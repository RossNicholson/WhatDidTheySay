-- WhatDidTheySay - Translation Engine
-- Main translation pipeline orchestrator

local Utils = WDTS_Utils
local Tokenizer = WDTS_Tokenizer
local LanguageDetect = WDTS_LanguageDetect
local Confidence = WDTS_Confidence
local LanguagePackManager = WDTS_LanguagePackManager

local Engine = {}
Engine.initialized = false

-- Language pack cache
Engine.languagePacks = {}

-- Translation cache (message hash -> translation result)
Engine.translationCache = {}
Engine.cacheMaxSize = 500 -- Limit cache size to avoid memory issues

-- Clear translation cache (useful after vocabulary updates)
function Engine.ClearCache()
    Engine.translationCache = {}
end

-- Load language pack
function Engine.LoadLanguagePack(lang)
    -- Always reload to pick up new vocabulary (cache cleared on reload anyway)
    -- Clear phrase cache to force rebuild
    if Engine.languagePacks[lang] then
        Engine.languagePacks[lang]._phraseLookupCache = nil
    end
    
    local pack = {
        tokens = {},
        phrases = {}, -- Multi-word phrases (e.g., "kannst du" = "can you")
        intents = {},
        patterns = {},
        grammar = {},
        _phraseLookupCache = nil, -- Will be built on first use
    }
    
    -- Try to load language pack files
    local packName = "WDTS_Lang_" .. lang
    
    -- Load tokens
    if _G[packName .. "_Tokens"] then
        pack.tokens = _G[packName .. "_Tokens"]
    end
    
    -- Extract phrases from tokens (keys with spaces or multiple words)
    -- Also check for explicit Phrases table
    if _G[packName .. "_Phrases"] then
        pack.phrases = _G[packName .. "_Phrases"]
    else
        -- Extract multi-word phrases from tokens (keys containing spaces)
        pack.phrases = {}
        if pack.tokens then
            for key, value in pairs(pack.tokens) do
                if type(key) == "string" and key:find("%s") then
                    pack.phrases[key:lower()] = value
                end
            end
        end
    end
    
    -- Load intents
    if _G[packName .. "_Intents"] then
        pack.intents = _G[packName .. "_Intents"]
    end
    
    -- Load patterns
    if _G[packName .. "_Patterns"] then
        pack.patterns = _G[packName .. "_Patterns"]
        -- Sort patterns by priority (higher priority first), then by specificity (longer patterns first)
        -- Priority defaults to 0 if not specified (higher number = higher priority)
        table.sort(pack.patterns, function(a, b)
            local priorityA = a.priority or 0
            local priorityB = b.priority or 0
            if priorityA ~= priorityB then
                return priorityA > priorityB
            end
            -- Same priority: sort by length (longer = more specific = higher priority)
            local lenA = a.from and #a.from or 0
            local lenB = b.from and #b.from or 0
            return lenA > lenB
        end)
    end
    
    -- Load grammar
    if _G[packName .. "_Grammar"] then
        pack.grammar = _G[packName .. "_Grammar"]
    end
    
    Engine.languagePacks[lang] = pack
    return pack
end

-- Detect intent from tokens and language pack
function Engine.DetectIntent(tokens, langPack)
    if not langPack.intents or #langPack.intents == 0 then
        return nil, 0.0
    end
    
    -- Build text from word tokens
    local words = {}
    for _, token in ipairs(tokens) do
        if token.type == "word" then
            table.insert(words, token.value)
        end
    end
    if #words == 0 then
        return nil, 0.0
    end
    
    local text = table.concat(words, " "):lower()
    
    local bestIntent = nil
    local bestScore = 0.0
    
    for _, intent in ipairs(langPack.intents) do
        if intent.patterns then
            for _, pattern in ipairs(intent.patterns) do
                local patternLower = pattern:lower()
                
                -- For single-character or very short patterns (like "r", "rdy"), require exact word match
                -- Otherwise they match too many false positives (e.g., "r" matches in "für", "waffe", etc.)
                local isShortPattern = #patternLower <= 3
                local patternMatches = false
                
                -- For short patterns, always check word-by-word to avoid false positives
                if isShortPattern then
                    -- Check each word individually - require exact match for short patterns
                    for _, word in ipairs(words) do
                        if word:lower() == patternLower then
                            patternMatches = true
                            break
                        end
                    end
                else
                    -- For longer patterns, check if it appears in the text
                    if text:find(patternLower, 1, true) then
                        patternMatches = true
                    end
                end
                
                if patternMatches then
                    local score = (intent.score or 0.5) * 1.0 -- Full match gets full score
                    if score > bestScore then
                        bestScore = score
                        bestIntent = intent
                    end
                end
            end
        end
    end
    
    -- Clamp score
    bestScore = Utils.Clamp(bestScore, 0.0, 1.0)
    
    if bestScore > 0.3 and bestIntent then
        return bestIntent, bestScore
    end
    
    return nil, 0.0
end

-- Apply phrase patterns (ordered by specificity, multiple matches allowed)
function Engine.ApplyPatterns(text, langPack)
    if not langPack.patterns or not text or text == "" then
        return text
    end
    
    local result = text
    local changed = true
    local maxIterations = 10 -- Prevent infinite loops
    local iterations = 0
    
    -- Apply patterns until no more matches (up to max iterations)
    while changed and iterations < maxIterations do
        changed = false
        iterations = iterations + 1
        
        for _, pattern in ipairs(langPack.patterns) do
            if pattern.from and pattern.to then
                -- Pattern replacement with capture group support (%1, %2, etc.)
                local success, replaced, count = pcall(function()
                    -- Use gsub to match and replace (supports capture groups)
                    local replacedText, replaceCount = result:gsub(pattern.from, pattern.to, 1)
                    return replacedText, replaceCount
                end)
                
                if success and replaced and count and count > 0 and replaced ~= result then
                    result = replaced
                    changed = true
                    -- Break to restart pattern matching with new text
                    break
                end
            end
        end
    end
    
    return result
end

-- Match multi-word phrases starting at a given token index
-- Enhanced with fuzzy matching for variations (case, articles, word order)
local function MatchPhraseAt(tokens, startIdx, langPack)
    if not langPack.phrases or not next(langPack.phrases) then
        return nil
    end
    
    -- Common German articles that can appear before phrases
    local articles = {
        ["der"] = true, ["die"] = true, ["das"] = true,
        ["ein"] = true, ["eine"] = true, ["einen"] = true,
        ["dem"] = true, ["den"] = true, ["des"] = true,
    }
    
    -- Build lookup table of phrase words (cache on first call per pack)
    if not langPack._phraseLookupCache then
        langPack._phraseLookupCache = {}
        langPack._maxPhraseLength = 0
        langPack._phraseVariations = {} -- Cache for variations
        
        for phraseKey, phraseValue in pairs(langPack.phrases) do
            local words = {}
            for word in phraseKey:gmatch("%S+") do
                table.insert(words, word:lower())
            end
            local phraseLen = #words
            if phraseLen > langPack._maxPhraseLength then
                langPack._maxPhraseLength = phraseLen
            end
            langPack._phraseLookupCache[phraseKey:lower()] = {
                words = words,
                translation = phraseValue
            }
            
            -- Pre-generate common variations for this phrase
            local variations = {}
            -- Exact match
            table.insert(variations, words)
            
            -- Variation: with article prefix (for phrases that can have articles)
            if phraseLen >= 2 then
                for article, _ in pairs(articles) do
                    local withArticle = {article}
                    for _, w in ipairs(words) do
                        table.insert(withArticle, w)
                    end
                    table.insert(variations, withArticle)
                end
            end
            
            langPack._phraseVariations[phraseKey:lower()] = variations
        end
    end
    
    local maxPhraseLength = langPack._maxPhraseLength
    if maxPhraseLength < 2 or startIdx > #tokens then
        return nil
    end
    
    if tokens[startIdx].type ~= "word" then
        return nil
    end
    
    -- Try to match phrases of decreasing length (longest first)
    for phraseLen = math.min(maxPhraseLength + 1, #tokens - startIdx + 1), 2, -1 do
        -- Extract token words from current position
        local tokenWords = {}
        local allWords = true
        for j = 0, phraseLen - 1 do
            local token = tokens[startIdx + j]
            if token and token.type == "word" then
                table.insert(tokenWords, token.value:lower())
            else
                allWords = false
                break
            end
        end
        
        if allWords and #tokenWords > 0 then
            -- Try exact match first (fastest)
            local phraseKey = table.concat(tokenWords, " ")
            local phraseData = langPack._phraseLookupCache[phraseKey]
            if phraseData then
                return {
                    length = phraseLen,
                    translation = phraseData.translation
                }
            end
            
            -- Try matching against all phrase variations (fuzzy matching)
            for cachedPhraseKey, phraseData in pairs(langPack._phraseLookupCache) do
                local variations = langPack._phraseVariations[cachedPhraseKey]
                
                for _, variationWords in ipairs(variations) do
                    -- Check if this variation matches our token words
                    if #variationWords == #tokenWords then
                        local match = true
                        for i = 1, #variationWords do
                            if variationWords[i] ~= tokenWords[i] then
                                match = false
                                break
                            end
                        end
                        if match then
                            return {
                                length = phraseLen,
                                translation = phraseData.translation
                            }
                        end
                    end
                    
                    -- Try matching without first article (skip article in tokenWords)
                    if #variationWords >= 2 and articles[tokenWords[1]] and
                       #variationWords == #tokenWords - 1 then
                        local match = true
                        for i = 1, #variationWords do
                            if variationWords[i] ~= tokenWords[i + 1] then
                                match = false
                                break
                            end
                        end
                        if match then
                            return {
                                length = phraseLen,
                                translation = phraseData.translation
                            }
                        end
                    end
                    
                    -- Try matching when phrase has article but tokens don't
                    if #variationWords >= 2 and articles[variationWords[1]] and
                       #variationWords - 1 == #tokenWords then
                        local match = true
                        for i = 2, #variationWords do
                            if variationWords[i] ~= tokenWords[i - 1] then
                                match = false
                                break
                            end
                        end
                        if match then
                            return {
                                length = #tokenWords,
                                translation = phraseData.translation
                            }
                        end
                    end
                end
            end
        end
    end
    
    return nil
end

-- Get context-aware translation for a token
-- Enhanced with expanded context window (3-5 words instead of just prev/next)
local function GetContextualTranslation(token, tokenIdx, tokens, langPack)
    if not langPack.tokens then
        return nil
    end
    
    -- token.value is already normalized (lowercased) by tokenizer
    local tokenKey = token.value
    local translation = langPack.tokens[tokenKey]
    
    -- Build expanded context window (look at up to 3 words before and after)
    local contextBefore = {}
    local contextAfter = {}
    for i = math.max(1, tokenIdx - 3), tokenIdx - 1 do
        if tokens[i] and tokens[i].type == "word" then
            table.insert(contextBefore, tokens[i].value:lower())
        end
    end
    for i = tokenIdx + 1, math.min(#tokens, tokenIdx + 3) do
        if tokens[i] and tokens[i].type == "word" then
            table.insert(contextAfter, tokens[i].value:lower())
        end
    end
    
    local prevToken = tokenIdx > 1 and tokens[tokenIdx - 1] or nil
    local nextToken = tokenIdx < #tokens and tokens[tokenIdx + 1] or nil
    
    -- Simple context rules (can be extended)
    -- Check if token has context-dependent translations
    if translation and type(translation) == "table" then
        -- Token has multiple possible translations based on context
        -- Check immediate context first (fastest)
        if prevToken and prevToken.type == "word" then
            local prevLower = prevToken.value:lower()
            if translation.after and translation.after[prevLower] then
                return translation.after[prevLower]
            end
        end
        if nextToken and nextToken.type == "word" then
            local nextLower = nextToken.value:lower()
            if translation.before and translation.before[nextLower] then
                return translation.before[nextLower]
            end
        end
        
        -- Check expanded context for better disambiguation
        -- Look for context patterns in the surrounding words
        if #contextBefore > 0 or #contextAfter > 0 then
            -- Special case: "wie" = "how" vs "like"
            if tokenKey == "wie" then
                -- "wie" = "how" when followed by question words or at start
                if #contextAfter > 0 then
                    local nextWord = contextAfter[1]
                    if nextWord == "viel" or nextWord == "viele" or nextWord == "lange" or 
                       nextWord == "oft" or nextWord == "gut" then
                        return "how"
                    end
                end
                -- "wie" = "like" when followed by noun/adjective (comparison)
                if nextToken and nextToken.type == "word" then
                    -- Default to "like" for comparisons
                    return "like"
                end
            end
            
            -- Special case: "von" before a proper noun (capitalized) or location name means "of"
            if tokenKey == "von" then
                if nextToken then
                    if nextToken.original:match("^[A-Z]") then
                        return "of"
                    end
                    local nextLower = nextToken.value:lower()
                    if nextLower == "elwynn" or nextLower == "stormwind" or nextLower == "ironforge" or 
                       nextLower == "darnassus" or nextLower == "orgrimmar" or nextLower == "thunder" then
                        return "of"
                    end
                end
            end
            
            -- Special case: "den" before a noun means "the"
            if tokenKey == "den" and nextToken and nextToken.type == "word" then
                return "the"
            end
        end
        
        -- Default translation
        if translation.default then
            return translation.default
        elseif translation[1] then
            return translation[1]
        else
            -- Fallback: return the first string value found in the table
            for _, v in pairs(translation) do
                if type(v) == "string" then
                    return v
                end
            end
            return nil
        end
    end
    
    -- Apply context-aware rules even for simple translations
    if tokenKey == "wie" then
        if #contextAfter > 0 then
            local nextWord = contextAfter[1]
            if nextWord == "viel" or nextWord == "viele" or nextWord == "lange" or 
               nextWord == "oft" or nextWord == "gut" then
                return "how"
            end
        end
        if nextToken then
            return "like"
        end
    end
    
    if tokenKey == "von" and nextToken then
        if nextToken.original:match("^[A-Z]") then
            return "of"
        end
        local nextLower = nextToken.value:lower()
        if nextLower == "elwynn" or nextLower == "stormwind" or nextLower == "ironforge" or 
           nextLower == "darnassus" or nextLower == "orgrimmar" or nextLower == "thunder" then
            return "of"
        end
    end
    
    if tokenKey == "den" and nextToken and nextToken.type == "word" then
        return "the"
    end
    
    -- If translation is not a table, return it as-is (should be a string or nil)
    return translation
end

-- Translate tokens using language pack (with phrase matching and context awareness)
function Engine.TranslateTokens(tokens, langPack)
    local translated = {}
    local translatedCount = 0
    local totalWords = 0
    local i = 1
    
    while i <= #tokens do
        local token = tokens[i]
        
        if token.type == "word" then
            totalWords = totalWords + 1
            
            -- First, try to match multi-word phrases starting at this position
            local phraseMatch = MatchPhraseAt(tokens, i, langPack)
            
            if phraseMatch then
                -- Translate the entire phrase
                local newToken = {
                    type = "word",
                    value = phraseMatch.translation,
                    original = token.original,
                }
                -- Preserve bracket flags from first token in phrase
                if token.hasOpenBracket then
                    newToken.hasOpenBracket = true
                end
                -- Preserve bracket flags from last token in phrase
                local lastTokenInPhrase = tokens[i + phraseMatch.length - 1]
                if lastTokenInPhrase and lastTokenInPhrase.hasCloseBracket then
                    newToken.hasCloseBracket = true
                end
                translated[#translated + 1] = newToken
                translatedCount = translatedCount + phraseMatch.length
                totalWords = totalWords + phraseMatch.length - 1 -- Already counted first word
                -- Skip the remaining words in the phrase
                i = i + phraseMatch.length
            else
                -- Single word translation with enhanced context awareness (3-5 word window)
                local trans = GetContextualTranslation(token, i, tokens, langPack)
                
                if trans then
                    local newToken = {
                        type = token.type,
                        value = trans,
                        original = token.original,
                    }
                    -- Preserve bracket flags from original token
                    if token.hasOpenBracket then
                        newToken.hasOpenBracket = true
                    end
                    if token.hasCloseBracket then
                        newToken.hasCloseBracket = true
                    end
                    translated[#translated + 1] = newToken
                    translatedCount = translatedCount + 1
                else
                    -- Keep original if no translation (bracket flags already present)
                    translated[#translated + 1] = token
                end
                i = i + 1
            end
        else
            -- Preserve non-word tokens
            translated[#translated + 1] = token
            i = i + 1
        end
    end
    
    local coverage = totalWords > 0 and (translatedCount / totalWords) or 0.0
    local unknownRatio = totalWords > 0 and ((totalWords - translatedCount) / totalWords) or 1.0
    
    return translated, coverage, unknownRatio
end

-- Apply grammar rules (optimized with early exit and grouping)
function Engine.ApplyGrammar(text, langPack)
    if not langPack.grammar or not langPack.grammar.rules then
        return text
    end
    
    local result = text
    local changed = false
    
    -- Cache compiled patterns on first use (performance optimization)
    if not langPack.grammar._compiledRules then
        langPack.grammar._compiledRules = {}
        for i, rule in ipairs(langPack.grammar.rules) do
            if rule.from and rule.to then
                langPack.grammar._compiledRules[i] = {
                    from = rule.from,
                    to = rule.to,
                    priority = rule.priority or 0
                }
            end
        end
        -- Sort by priority if specified (higher priority first)
        table.sort(langPack.grammar._compiledRules, function(a, b)
            return (a.priority or 0) > (b.priority or 0)
        end)
    end
    
    -- Apply rules with early exit optimization
    -- Apply rules in iterations, stopping early if no changes
    local maxIterations = 10 -- Prevent infinite loops
    local iteration = 0
    
    while iteration < maxIterations do
        iteration = iteration + 1
        changed = false
        
        for _, rule in ipairs(langPack.grammar._compiledRules) do
            local success, replaced, count = pcall(function()
                return result:gsub(rule.from, rule.to)
            end)
            
            if success and replaced and count and count > 0 then
                result = replaced
                changed = true
                -- Continue applying other rules in this iteration
            end
        end
        
        -- If no changes this iteration, we're done
        if not changed then
            break
        end
    end
    
    return result
end

-- Create cache key from message and languages
local function CreateCacheKey(message, sourceLang, targetLang)
    return string.format("%s:%s:%s", message or "", sourceLang or "", targetLang or "en")
end

-- Main translation pipeline
function Engine.Translate(message, sourceLang, targetLang, bypassCache)
    -- Default target language
    targetLang = targetLang or "en"
    
    -- Check cache first (unless bypassed for testing)
    if not bypassCache then
        local cacheKey = CreateCacheKey(message, sourceLang, targetLang)
        if Engine.translationCache[cacheKey] then
            local cached = Engine.translationCache[cacheKey]
            return cached.translated, cached.confidence, cached.intent
        end
    end
    
    -- Step 1: Tokenization
    local tokens, protected, protectedMap = Tokenizer.Tokenize(message)
    
    if #tokens == 0 then
        return nil, 0.0, "empty_message"
    end
    
    -- Step 2: Language detection (if sourceLang not provided)
    local detectedLang, langConfidence = LanguageDetect.Detect(tokens)
    if not sourceLang then
        sourceLang = detectedLang
    end
    
    -- Special handling for mixed-language messages (e.g., "If tank heal dm dann abfahrt")
    -- If detected as English but contains known German words, try German translation
    -- BUT: Don't trigger on universal gaming abbreviations that exist in both languages
    if (not sourceLang or sourceLang == "en" or langConfidence < LanguageDetect.MIN_CONFIDENCE) and LanguagePackManager.IsEnabled("de") then
        -- Common gaming abbreviations that are universal (English and German) - exclude from German detection
        local universalAbbreviations = {
            ["lf"] = true, ["lfb"] = true, ["lfm"] = true, ["lfg"] = true, ["lf1m"] = true,
            ["wts"] = true, ["wtb"] = true, ["wtt"] = true,
            ["tank"] = true, ["heal"] = true, ["healer"] = true, ["dps"] = true,
            ["dm"] = true, ["st"] = true, ["sfk"] = true, ["rfk"] = true, ["rfd"] = true,
            ["uld"] = true, ["zf"] = true, ["mara"] = true, ["scholo"] = true, ["strat"] = true,
            ["port"] = true, ["buff"] = true, ["buff"] = true, ["quest"] = true, ["quests"] = true,
            ["afk"] = true, ["brb"] = true, ["gg"] = true, ["wp"] = true, ["gl"] = true, ["hf"] = true,
            ["raid"] = true, ["dungeon"] = true, ["group"] = true, ["guild"] = true,
            ["mage"] = true, ["warrior"] = true, ["rogue"] = true, ["hunter"] = true,
            ["priest"] = true, ["warlock"] = true, ["druid"] = true, ["shaman"] = true, ["paladin"] = true,
            ["item"] = true, ["items"] = true, ["gold"] = true, ["silver"] = true, ["copper"] = true,
            ["world"] = true, ["help"] = true,
            ["bb"] = true, ["pls"] = true, ["summon"] = true, ["summons"] = true, ["sw"] = true,
        }
        
            -- Check if message contains actual German words (not just gaming abbreviations)
            local langPack = Engine.LoadLanguagePack("de")
            if langPack and langPack.tokens then
                local hasGermanCharacters = false
                local germanFunctionWords = 0
                local germanVocabularyWords = 0
                
                -- Check for German-specific characters first (strongest indicator)
                local messageText = message:lower()
                if messageText:find("ä") or messageText:find("ö") or messageText:find("ü") or messageText:find("ß") then
                    hasGermanCharacters = true
                end
                
                -- Check for German function words (also strong indicators)
                local germanFunctionWordsList = {
                    "der", "die", "das", "den", "dem", "des", "ein", "eine", "einen", "einem", "eines",
                    "und", "oder", "aber", "für", "von", "mit", "durch", "über", "unter",
                    "ist", "sind", "war", "waren", "bin", "bist", "seid", "hat", "haben",
                    "kann", "kannst", "können", "muss", "musst", "müssen",
                    "ich", "du", "er", "sie", "es", "wir", "ihr",
                    "mir", "dich", "ihn", "uns", "euch", "mein", "dein", "sein", "ihr",
                    "zu", "zum", "zur", "nach", "bei", "aus", "an", "auf", "in",
                    "wie", "wo", "was", "wer", "wann", "warum", "schade", "moin",
                }
                
                for _, token in ipairs(tokens) do
                    if token.type == "word" then
                        local word = token.value:lower()
                        
                        -- Skip universal gaming abbreviations
                        if not universalAbbreviations[word] then
                            -- Check if it's a German function word
                            local isFunctionWord = false
                            for _, fw in ipairs(germanFunctionWordsList) do
                                if word == fw then
                                    germanFunctionWords = germanFunctionWords + 1
                                    isFunctionWord = true
                                    break
                                end
                            end
                            
                            -- If not a function word, check if it's in German vocabulary
                            -- and has a translation that's different from the word itself (not a passthrough)
                            if not isFunctionWord and langPack.tokens[word] then
                                local translation = langPack.tokens[word]
                                if translation ~= word and translation:lower() ~= word then
                                    -- This is a genuine German word with a translation
                                    germanVocabularyWords = germanVocabularyWords + 1
                                end
                            end
                        end
                    end
                end
                
                -- Only override to German if we have strong indicators:
                -- 1. German-specific characters, OR
                -- 2. 2+ German function words, OR
                -- 3. 1 German function word + 1+ German vocabulary words, OR
                -- 4. 2+ German vocabulary words (genuine German, not abbreviations), OR
                -- 5. 1+ German vocabulary word AND message is entirely in brackets (quest/item names)
                local isBracketOnlyMessage = message:match("^%[.+%]$") or (message:match("^%[") and message:match("%]$"))
                if hasGermanCharacters or 
                   germanFunctionWords >= 2 or 
                   (germanFunctionWords >= 1 and germanVocabularyWords >= 1) or
                   germanVocabularyWords >= 2 or
                   (germanVocabularyWords >= 1 and isBracketOnlyMessage) then
                    sourceLang = "de"
                    langConfidence = 0.5 -- Give it moderate confidence for mixed messages
                end
            end
    end
    
    -- Check if message is purely English abbreviations/gaming terms
    -- Do this EARLY before mixed-language detection to prevent false positives
    -- If all words are universal gaming abbreviations, it's English and doesn't need translation
    local allUniversalAbbrevs = true
    local universalAbbrevsForCheck = {
        ["bb"] = true, ["pls"] = true, ["summon"] = true, ["summons"] = true,
        ["sw"] = true, ["lf"] = true, ["lfg"] = true, ["lfm"] = true, ["lfw"] = true,
        ["wts"] = true, ["wtb"] = true, ["tank"] = true, ["heal"] = true, ["healer"] = true,
        ["dm"] = true, ["port"] = true, ["portal"] = true, ["buff"] = true, ["quest"] = true,
        ["tp"] = true, ["tpn"] = true, ["darna"] = true, ["darnassus"] = true,
        ["for"] = true, ["to"] = true, ["with"] = true, ["or"] = true, -- Common English prepositions
        ["if"] = true, -- Ironforge abbreviation (uppercase IF in context means Ironforge, not "looking for")
        ["mage"] = true, ["warrior"] = true, ["rogue"] = true, ["hunter"] = true,
        ["priest"] = true, ["warlock"] = true, ["druid"] = true, ["shaman"] = true, ["paladin"] = true,
        ["dd"] = true, ["dps"] = true, -- Damage dealer abbreviations
    }
    local wordCount = 0
    for _, token in ipairs(tokens) do
        if token.type == "word" then
            wordCount = wordCount + 1
            local word = token.value:lower()
            if not universalAbbrevsForCheck[word] then
                allUniversalAbbrevs = false
                break
            end
        end
    end
    -- If all words are universal abbreviations, it's English and doesn't need translation
    if allUniversalAbbrevs and wordCount > 0 then
        return nil, 0.0, "already_english"
    end
    
    -- Special case: Very short messages (1-2 words) that are likely English greetings
    -- These don't need translation - they're universal
    if #tokens <= 2 then
        local allEnglishGreetings = true
        local englishGreetings = {"hi", "hey", "yo", "ok", "okay", "r", "rdy", "ready"}
        for _, token in ipairs(tokens) do
            if token.type == "word" then
                local isGreeting = false
                for _, greeting in ipairs(englishGreetings) do
                    if token.value:lower() == greeting then
                        isGreeting = true
                        break
                    end
                end
                if not isGreeting then
                    allEnglishGreetings = false
                    break
                end
            end
        end
        if allEnglishGreetings then
            -- Skip translation for universal English greetings
            return nil, 0.0, "english_greeting"
        end
    end
    
    if not sourceLang or langConfidence < LanguageDetect.MIN_CONFIDENCE then
        return nil, 0.0, "language_unknown"
    end
    
    -- Skip translation if source and target are the same
    if sourceLang == targetLang then
        return nil, 0.0, "same_language"
    end
    
    -- Step 3: Check if language pack is enabled
    if not LanguagePackManager.IsEnabled(sourceLang) then
        return nil, 0.0, "language_pack_disabled"
    end
    
    -- Step 3b: Load language pack
    local langPack = Engine.LoadLanguagePack(sourceLang)
    if not langPack or not langPack.tokens then
        return nil, 0.0, "language_pack_missing"
    end
    
    -- Step 4: Intent detection
    local intent, intentConfidence = Engine.DetectIntent(tokens, langPack)
    
    -- Step 4b: Apply patterns to ORIGINAL message (before translation)
    -- Patterns should match German text, not translated English
    -- Replace protected tokens with placeholders for pattern matching
    local originalForPatterns = message
    local patternPlaceholders = {}
    local placeholderIndex = 1
    for placeholder, protected in pairs(protectedMap) do
        local placeholderText = "|WDTS_ITEM_" .. placeholderIndex .. "|"
        patternPlaceholders[placeholderText] = protected
        originalForPatterns = originalForPatterns:gsub(placeholder:gsub("[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%0"), placeholderText, 1)
        placeholderIndex = placeholderIndex + 1
    end
    
    -- Try patterns on original German text
    local patternMatchedText = Engine.ApplyPatterns(originalForPatterns, langPack)
    local patternWasApplied = (patternMatchedText ~= originalForPatterns)
    
    -- Calculate coverage from ORIGINAL tokens (for pattern-matched messages, assume high coverage)
    local originalTokensCoverage = 0.0
    local originalTokensUnknownRatio = 1.0
    if patternWasApplied then
        -- Pattern matched - assume high coverage since pattern translated the structure
        -- Count how many words in original were part of the pattern
        local originalWordCount = 0
        for _, token in ipairs(tokens) do
            if token.type == "word" then
                originalWordCount = originalWordCount + 1
            end
        end
        -- If pattern matched, assume most/all words were translated by the pattern
        originalTokensCoverage = math.min(0.85, 1.0 - (1.0 / math.max(originalWordCount, 1)))
        originalTokensUnknownRatio = 1.0 - originalTokensCoverage
    else
        -- No pattern match - will calculate coverage normally
    end
    
    -- Step 5: Token translation
    -- If pattern was applied, use pattern result directly; otherwise translate tokens
    local translatedText = ""
    local coverage = 0.0
    local unknownRatio = 1.0
    
    if patternWasApplied then
        -- Pattern matched - use pattern result as translation
        -- BUT: patterns may have captured untranslated German words (e.g., "suche X für Y" captures X and Y)
        -- So we need to translate any remaining German words in the pattern result
        -- Re-tokenize and translate the pattern-matched text
        local patternTokens, _, _ = Tokenizer.Tokenize(patternMatchedText)
        local translatedPatternTokens, patternCoverage, patternUnknownRatio = Engine.TranslateTokens(patternTokens, langPack)
        local patternTranslatedText = Tokenizer.Reconstruct(translatedPatternTokens)
        
        -- Restore protected tokens
        for placeholderText, protected in pairs(patternPlaceholders) do
            patternTranslatedText = patternTranslatedText:gsub(placeholderText:gsub("[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%0"), protected, 1)
        end
        
        translatedText = patternTranslatedText
        coverage = math.max(originalTokensCoverage, patternCoverage) -- Use better coverage
        unknownRatio = math.min(originalTokensUnknownRatio, patternUnknownRatio) -- Use lower unknown ratio
    else
        -- No pattern match - translate tokens normally
        local translatedTokens, tokenCoverage, tokenUnknownRatio = Engine.TranslateTokens(tokens, langPack)
        translatedText = Tokenizer.Reconstruct(translatedTokens)
        coverage = tokenCoverage
        unknownRatio = tokenUnknownRatio
    end
    
    -- Step 6: Apply patterns to translated text (for any patterns that work on English)
    -- Only if we didn't already apply patterns to original
    -- Note: Patterns should primarily match German text, not English, so we skip this
    -- to avoid false positives on already-translated text
    -- if not patternWasApplied then
    --     translatedText = Engine.ApplyPatterns(translatedText, langPack)
    -- end
    
    -- Step 8: Apply grammar
    translatedText = Engine.ApplyGrammar(translatedText, langPack)
    
    -- Step 9: Restore protected tokens
    translatedText = Tokenizer.RestoreProtected(translatedText, protectedMap)
    
    -- Step 9b: Check if translation actually changed anything
    -- Remove color codes and normalize for comparison
    local originalClean = message:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):lower():gsub("%s+", " ")
    local translatedClean = translatedText:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):lower():gsub("%s+", " ")
    
    -- If translation is too similar to original (less than 30% different), reject it
    local similarity = 0.0
    if #originalClean > 0 and #translatedClean > 0 then
        -- Simple similarity check: count matching words
        local origWords = {}
        for word in originalClean:gmatch("%S+") do
            origWords[word] = (origWords[word] or 0) + 1
        end
        local transWords = {}
        for word in translatedClean:gmatch("%S+") do
            transWords[word] = (transWords[word] or 0) + 1
        end
        
        local matches = 0
        local total = 0
        for word, count in pairs(origWords) do
            total = total + count
            if transWords[word] then
                matches = matches + math.min(count, transWords[word])
            end
        end
        
        if total > 0 then
            similarity = matches / total
        end
    end
    
    -- If translation is more than 70% similar to original, it's not really a translation
    -- Exception: Very short single-word messages (like greetings) are expected to be similar
    local isShortGreeting = (#tokens == 1 and tokens[1].type == "word" and 
                             (tokens[1].value == "moin" or tokens[1].value == "hallo" or 
                              tokens[1].value == "hi" or tokens[1].value == "hey"))
    if similarity > 0.70 and coverage < 0.5 and not isShortGreeting then
        -- Too similar and low coverage - this is basically untranslated
        return nil, 0.0, "translation_too_similar"
    end
    
    -- Step 10: Calculate confidence (coverage penalties are handled in Confidence.Calculate)
    local finalConfidence = Confidence.Calculate({
        languageConfidence = langConfidence,
        intentConfidence = intentConfidence,
        phraseCoverage = coverage,
        unknownTokenRatio = unknownRatio,
        messageLength = #tokens,
        translationSimilarity = similarity, -- Pass similarity for penalty
    })
    
    local intentId = nil
    if intent then
        if type(intent) == "table" then
            intentId = intent.id
        else
            intentId = intent
        end
    end
    
    -- Cache successful translations (only if confidence is reasonable)
    if finalConfidence >= Confidence.THRESHOLD.MANUAL_OPTION and translatedText then
        -- Create cache key (might be nil if bypassCache was true, but that's okay)
        if cacheKey then
            -- Limit cache size
            local cacheSize = 0
            for _ in pairs(Engine.translationCache) do
                cacheSize = cacheSize + 1
            end
            
            if cacheSize >= Engine.cacheMaxSize then
                -- Remove oldest entry (simple strategy: clear cache if full)
                Engine.translationCache = {}
            end
            
            Engine.translationCache[cacheKey] = {
                translated = translatedText,
                confidence = finalConfidence,
                intent = intentId,
            }
        end
    end
    
    return translatedText, finalConfidence, intentId
end

-- Initialize engine
function Engine.Initialize()
    if Engine.initialized then
        return
    end
    
    -- Initialize language pack manager
    LanguagePackManager.Initialize()
    
    -- Connect LanguagePackManager to LanguageDetect
    LanguageDetect.LanguagePackManager = LanguagePackManager
    
    -- Preload enabled language packs
    local packs = LanguagePackManager.GetAvailablePacks()
    if packs then
        for lang, pack in pairs(packs) do
            if lang and LanguagePackManager.IsEnabled(lang) then
                Engine.LoadLanguagePack(lang)
            end
        end
    end
    
    Engine.initialized = true
end

WDTS_Engine = Engine

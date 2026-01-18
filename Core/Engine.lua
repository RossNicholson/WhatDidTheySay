-- WhatDidTheySay - Translation Engine
-- Main translation pipeline orchestrator

local Utils = WDTS_Utils
local Tokenizer = WDTS_Tokenizer
local LanguageDetect = WDTS_LanguageDetect
local Confidence = WDTS_Confidence
local LanguagePackManager = WDTS_LanguagePackManager
local GermanMorphology = WDTS_GermanMorphology -- Optional morphology helper
local FrenchMorphology = WDTS_FrenchMorphology -- Optional morphology helper
local DependencyParser = WDTS_DependencyParser -- Optional dependency parser

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
        articles = {}, -- Language-specific articles for phrase matching (e.g., ["der"] = true for German)
        charHints = {}, -- Language-specific characters (e.g., ["ä"] = true for German)
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
    
    -- Load language-specific metadata (articles, character hints)
    -- Articles are used for fuzzy phrase matching
    local langMetadata = _G[packName .. "_Metadata"]
    if langMetadata then
        if langMetadata.articles then
            pack.articles = langMetadata.articles
        end
        if langMetadata.charHints then
            pack.charHints = langMetadata.charHints
        end
    else
        -- Fallback: try to infer from language detection data
        if LanguageDetect.CHAR_HINTS[lang] then
            local charHintsTable = {}
            for _, char in ipairs(LanguageDetect.CHAR_HINTS[lang]) do
                charHintsTable[char] = true
            end
            pack.charHints = charHintsTable
        end
        -- Articles default to empty if not specified
        -- Each language pack should define its articles in metadata.lua
        if not pack.articles or not next(pack.articles) then
            pack.articles = {} -- Empty for languages without articles defined
        end
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

-- Try to match separable verb (prefix + verb separated)
-- Some languages (like German) have separable verbs: "macht auf" = "opens", "aufmachen" = "open"
-- Uses language-specific morphology helper if available
local function MatchSeparableVerb(tokens, startIdx, langPack)
    if not langPack or not langPack.phrases then
        return nil
    end
    
    -- Determine which language pack this is to load appropriate morphology helper
    local lang = nil
    for l, pack in pairs(Engine.languagePacks) do
        if pack == langPack then
            lang = l
            break
        end
    end
    
    -- Try to load language-specific morphology helper
    -- Naming convention: WDTS_[Language]Morphology (e.g., WDTS_GermanMorphology, WDTS_FrenchMorphology)
    local separablePrefixes = {}
    if lang then
        local langName = lang:sub(1,1):upper() .. lang:sub(2) -- "de" -> "De", "fr" -> "Fr"
        local morphologyHelper = _G["WDTS_" .. langName .. "Morphology"]
        if morphologyHelper and morphologyHelper.SEPARABLE_PREFIXES then
            separablePrefixes = morphologyHelper.SEPARABLE_PREFIXES
        elseif lang == "de" and GermanMorphology and GermanMorphology.SEPARABLE_PREFIXES then
            -- Backward compatibility: GermanMorphology global for German
            separablePrefixes = GermanMorphology.SEPARABLE_PREFIXES
        end
    end
    
    -- If no morphology helper found, don't attempt separable verb matching
    -- Language packs can define separable verb phrases directly in phrases.lua instead
    if not separablePrefixes or not next(separablePrefixes) then
        return nil
    end
    
    -- Look ahead up to 5 words for separated prefix + verb pattern
    local maxLookahead = math.min(5, #tokens - startIdx)
    
    for lookahead = 1, maxLookahead do
        local prefixToken = tokens[startIdx]
        local verbToken = tokens[startIdx + lookahead]
        
        -- Check if we have a prefix followed by a verb
        if prefixToken and verbToken and 
           prefixToken.type == "word" and verbToken.type == "word" then
            local prefix = prefixToken.value:lower()
            
            -- Check if prefix is a separable prefix
            if separablePrefixes[prefix] then
                -- Try combinations: prefix + verb, verb + prefix
                local verb = verbToken.value:lower()
                local combined1 = prefix .. " " .. verb
                local combined2 = verb .. " " .. prefix
                
                -- Check phrases for matches
                if langPack.phrases[combined1] then
                    return {
                        length = lookahead + 1,
                        translation = langPack.phrases[combined1]
                    }
                elseif langPack.phrases[combined2] then
                    return {
                        length = lookahead + 1,
                        translation = langPack.phrases[combined2]
                    }
                end
                
                -- Also try with common verb forms (add -en, -t, -e endings)
                local verbBase = verb
                if #verbBase >= 3 then
                    -- Try removing common endings
                    local endings = {"en", "t", "e", "st", "n"}
                    for _, ending in ipairs(endings) do
                        if verbBase:sub(-#ending) == ending then
                            local base = verbBase:sub(1, -#ending - 1)
                            local combined = prefix .. base
                            if langPack.tokens[combined] then
                                local trans = langPack.tokens[combined]
                                if type(trans) == "table" then
                                    trans = trans[1] or trans.default or trans
                                end
                                if type(trans) == "string" then
                                    return {
                                        length = lookahead + 1,
                                        translation = trans
                                    }
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    return nil
end

-- Match multi-word phrases starting at a given token index
-- Enhanced with fuzzy matching for variations (case, articles, word order)
local function MatchPhraseAt(tokens, startIdx, langPack)
    if not langPack.phrases or not next(langPack.phrases) then
        return nil
    end
    
    -- Use language-specific articles from language pack
    -- If not defined, use empty table (no article matching)
    local articles = langPack.articles or {}
    
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
    -- Allow single-word phrases (maxPhraseLength >= 1) for phrases like "vente" = "selling"
    if maxPhraseLength < 1 or startIdx > #tokens then
        return nil
end
    
    if tokens[startIdx].type ~= "word" then
        return nil
    end
    
    -- Try to match phrases of decreasing length (longest first)
    -- Start from maxPhraseLength down to 1 (to allow single-word phrases)
    for phraseLen = math.min(maxPhraseLength + 1, #tokens - startIdx + 1), 1, -1 do
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

-- Try to normalize verb to base form (infinitive)
-- This helps match verb conjugations that aren't in the dictionary
-- Uses morphology helpers if available (GermanMorphology, FrenchMorphology, etc.)
local function NormalizeVerbForm(word, sourceLang)
    sourceLang = sourceLang or "de" -- Default to German for backward compatibility
    
    -- Use French morphology helper for French
    if sourceLang == "fr" and FrenchMorphology and FrenchMorphology.NormalizeToInfinitive then
        local normalized = FrenchMorphology.NormalizeToInfinitive(word)
        if normalized then
            return normalized
        end
    end
    
    -- Use German morphology helper for German
    if sourceLang == "de" and GermanMorphology and GermanMorphology.NormalizeToInfinitive then
        local normalized = GermanMorphology.NormalizeToInfinitive(word)
        if normalized then
            return normalized
        end
    end
    
    -- Fallback to original logic
    local wordLower = word:lower()
    
    -- If already short, probably not a verb or already base form
    if #wordLower < 4 then
        return nil
    end
    
    -- Past tense forms (imperfect): wurdest -> werden, warst -> sein, glaubte -> glauben
    if wordLower == "wurdest" then
        return "werden"
    elseif wordLower == "warst" then
        return "sein"
    elseif wordLower == "wurde" then
        return "werden"
    elseif wordLower:sub(-2) == "te" and #wordLower >= 5 then
        -- Past tense weak verbs: glaubte -> glauben
        local stem = wordLower:sub(1, -3)
        if #stem >= 3 then
            return stem .. "en"
        end
    end
    
    -- Past participle: ge- prefix + -t or -en ending
    if wordLower:sub(1, 3) == "ge" and #wordLower >= 6 then
        local stem = wordLower:sub(4)
        if stem:sub(-2) == "en" then
            -- Remove -en, might be infinitive
            local base = stem:sub(1, -3)
            if #base >= 3 then
                return base .. "en"
            end
        elseif stem:sub(-1) == "t" then
            -- Remove -t, add -en for infinitive
            local base = stem:sub(1, -2)
            if #base >= 3 then
                return base .. "en"
            end
        end
        -- Special: gelassen -> lassen
        if wordLower == "gelassen" then
            return "lassen"
        end
    end
    
    -- Present tense 3rd person singular: -t ending
    if wordLower:sub(-1) == "t" and #wordLower >= 4 then
        local stem = wordLower:sub(1, -2)
        -- Check if removing -t and adding -en makes sense
        if #stem >= 3 then
            return stem .. "en"
        end
    end
    
    -- Present tense 2nd person: -st ending
    if wordLower:sub(-2) == "st" and #wordLower >= 5 then
        local stem = wordLower:sub(1, -3)
        if #stem >= 3 then
            return stem .. "en"
        end
    end
    
    -- Present tense 1st person: -e ending (often)
    if wordLower:sub(-1) == "e" and #wordLower >= 4 then
        local stem = wordLower:sub(1, -2)
        -- Check if it's likely a verb (common verb stems)
        if #stem >= 3 then
            return stem .. "en"
        end
    end
    
    return nil
end

-- Try to decompose and translate German compound words
-- German often combines words (e.g., "Levelgilde" = "Level" + "Gilde")
local function TryCompoundDecomposition(word, langPack)
    if not langPack or not langPack.tokens then
        return nil
    end
    
    -- Only try decomposition for words that:
    -- 1. Are not already translated
    -- 2. Are reasonably long (4+ characters, compounds are usually longer)
    -- 3. Are lowercase (capitalized might be proper nouns)
    local wordLower = word:lower()
    if #wordLower < 4 or wordLower:match("^[A-Z]") then
        return nil
    end
    
    -- Common German compound word boundaries and patterns
    -- Try splitting at various positions, prioritizing common word boundaries
    local minSplitLen = 3 -- Minimum length for a valid word part
    local maxSplitPos = #wordLower - minSplitLen
    
    -- Try splits from right to left (many compounds end with common nouns)
    for splitPos = maxSplitPos, minSplitLen, -1 do
        local firstPart = wordLower:sub(1, splitPos)
        local secondPart = wordLower:sub(splitPos + 1)
        
        -- Try to translate both parts
        local firstTrans = langPack.tokens[firstPart]
        local secondTrans = langPack.tokens[secondPart]
        
        -- If both parts translate, combine them
        if firstTrans and secondTrans then
            -- Extract string translation if it's a table
            if type(firstTrans) == "table" then
                firstTrans = firstTrans[1] or firstTrans.default or firstTrans
            end
            if type(secondTrans) == "table" then
                secondTrans = secondTrans[1] or secondTrans.default or secondTrans
            end
            
            -- Combine translations (usually space-separated)
            if type(firstTrans) == "string" and type(secondTrans) == "string" then
                return firstTrans .. " " .. secondTrans
            end
        end
        
        -- Also try with common linking elements removed
        -- Some compounds have linking elements like "s", "es", "en", "n"
        if splitPos >= 4 then
            local linkingElements = {"s", "es", "en", "n", "er"}
            for _, elem in ipairs(linkingElements) do
                local elemLen = #elem
                if splitPos >= elemLen + minSplitLen then
                    local firstPartWithElem = wordLower:sub(1, splitPos - elemLen)
                    local secondPartCheck = wordLower:sub(splitPos - elemLen + 1)
                    
                    -- Check if removing linking element helps
                    local firstTrans = langPack.tokens[firstPartWithElem]
                    local secondTrans = langPack.tokens[secondPart]
                    
                    if firstTrans and secondTrans then
                        if type(firstTrans) == "table" then
                            firstTrans = firstTrans[1] or firstTrans.default or firstTrans
                        end
                        if type(secondTrans) == "table" then
                            secondTrans = secondTrans[1] or secondTrans.default or secondTrans
                        end
                        
                        if type(firstTrans) == "string" and type(secondTrans) == "string" then
                            return firstTrans .. " " .. secondTrans
                        end
                    end
                end
            end
        end
        
        -- Try three-part compounds (less common but possible)
        if splitPos >= minSplitLen + 3 then
            local midSplitPos = math.floor(splitPos / 2)
            if midSplitPos >= minSplitLen and splitPos - midSplitPos >= minSplitLen then
                local firstPart = wordLower:sub(1, midSplitPos)
                local secondPart = wordLower:sub(midSplitPos + 1, splitPos)
                local thirdPart = wordLower:sub(splitPos + 1)
                
                local firstTrans = langPack.tokens[firstPart]
                local secondTrans = langPack.tokens[secondPart]
                local thirdTrans = langPack.tokens[thirdPart]
                
                if firstTrans and secondTrans and thirdTrans then
                    if type(firstTrans) == "table" then firstTrans = firstTrans[1] or firstTrans.default or firstTrans end
                    if type(secondTrans) == "table" then secondTrans = secondTrans[1] or secondTrans.default or secondTrans end
                    if type(thirdTrans) == "table" then thirdTrans = thirdTrans[1] or thirdTrans.default or thirdTrans end
                    
                    if type(firstTrans) == "string" and type(secondTrans) == "string" and type(thirdTrans) == "string" then
                        return firstTrans .. " " .. secondTrans .. " " .. thirdTrans
                    end
                end
            end
        end
    end
    
    return nil
end

-- Select the best translation option from multiple choices based on context
local function SelectBestTranslationOption(word, options, contextBefore, contextAfter, prevToken, nextToken)
    -- "auf" = "on/up/at" -> choose based on context
    if word == "auf" then
        -- "auf den Turm" = "on the tower" (spatial location)
        if nextToken and nextToken.type == "word" then
            local nextLower = nextToken.value:lower()
            -- Before articles (den, die, das) -> usually "on" or "at"
            if nextLower == "den" or nextLower == "die" or nextLower == "das" then
                return "on" -- "on the tower", "on the hill", etc.
            end
            -- Before location nouns -> "on" or "at"
            if nextLower == "turm" or nextLower == "berg" or nextLower == "hügel" or
               nextLower == "tisch" or nextLower == "dach" or nextLower == "tower" then
                return "on"
            end
        end
        -- Default to "on" for most cases (most common)
        return "on"
    end
    
    -- "geht" = "goes/works" -> choose based on context
    if word == "geht" then
        -- "das geht" = "that works"
        -- Check original value to catch "das" before it's translated
        if prevToken then
            local prevOriginal = (prevToken.original or prevToken.value):lower()
            if prevOriginal == "das" then
                return "works"
            end
        end
        -- Also check contextBefore array (original values)
        if #contextBefore > 0 then
            local lastContext = contextBefore[#contextBefore]
            if lastContext == "das" then
                return "works"
            end
        end
        -- "er/sie/es geht" = "he/she/it goes"
        return "goes"
    end
    
    -- "das" = "the/that" -> choose based on context (when translation has options)
    if word == "das" then
        -- If followed by verb, usually "that" (pronoun)
        if nextToken and nextToken.type == "word" then
            local nextLower = nextToken.value:lower()
            -- Before verbs, "das" is usually "that"
            if nextLower == "geht" or nextLower == "ist" or nextLower == "war" or 
               nextLower == "wird" or nextLower == "hat" or nextLower == "kann" then
                return "that"
            end
        end
        -- Default to "the" (article)
        return "the"
    end
    
    -- "süß" = "sweet/cute/nice" -> default to "sweet" (most literal)
    if word == "süß" then
        return "sweet"
    end
    
    -- "zauberstab" = "wand/staff" -> "wand" is more specific
    if word == "zauberstab" then
        return "wand"
    end
    
    -- "diszi" = "disc/disciple priest" -> "disc" is more common abbreviation
    if word == "diszi" then
        return "disc"
    end
    
    -- "bock" = "want to/interest" -> "want to" in most contexts
    if word == "bock" then
        return "want to"
    end
    
    -- "schaffen" = "manage/accomplish/can do" -> "manage" is most common
    if word == "schaffen" then
        return "manage"
    end
    
    -- "zweit" = "two/second" -> "two" in most contexts
    if word == "zweit" then
        -- Check if "zu zweit" phrase (handled separately)
        if prevToken and prevToken.value:lower() == "zu" then
            return "two" -- "zu zweit" = "with two"
        end
        return "second"
    end
    
    -- "laufen" = "running/going" -> check context
    if word == "laufen" or word == "laufe" or word == "läuft" then
        -- "ich laufe" = "I'm running/going" -> "going" is more natural
        if #contextBefore > 0 and (contextBefore[#contextBefore] == "ich" or contextBefore[#contextBefore] == "i") then
            return "going"
        end
        return "running"
    end
    
    -- Default: return first option (most common/literal translation)
    return options[1]
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
        -- In questions, "wie" = "how"
        -- Check if this is a question (sentence type or question mark)
        local isQuestion = false
        if nextToken then
            -- Check if followed by question word or verb (question structure)
            local nextLower = nextToken.value:lower()
            if nextLower == "viel" or nextLower == "viele" or nextLower == "lange" or 
               nextLower == "oft" or nextLower == "gut" or nextLower == "wurdest" or
               nextLower == "wurdest" or nextLower == "wurde" or nextLower == "ist" then
                return "how"
            end
        end
        if #contextAfter > 0 then
            local nextWord = contextAfter[1]
            if nextWord == "viel" or nextWord == "viele" or nextWord == "lange" or 
               nextWord == "oft" or nextWord == "gut" or nextWord == "wurdest" then
                return "how"
            end
        end
        -- After "und" (and) at start of sentence, often "how" in questions
        if #contextBefore > 0 and contextBefore[1] == "und" then
            if nextToken and (nextToken.value:lower() == "wurdest" or nextToken.value:lower() == "warst") then
                return "how"
            end
        end
        -- Default to "like" for comparisons
        if nextToken then
            return "like"
        end
        return "how" -- Default to "how" if uncertain
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
    
    -- Special case: "das" before verbs = "that", before nouns = "the"
    if tokenKey == "das" then
        if nextToken and nextToken.type == "word" then
            local nextLower = nextToken.value:lower()
            -- Before verbs, "das" is usually "that" (pronoun)
            if nextLower == "geht" or nextLower == "ist" or nextLower == "war" or 
               nextLower == "wird" or nextToken.value:lower() == "hat" or nextLower == "kann" or
               nextLower == "macht" or nextLower == "geht" then
                return "that"
            end
        end
        -- Default to "the" (article)
    end
    
    -- Special case: "wie" - handle table translation here too
    if tokenKey == "wie" and translation and type(translation) == "table" then
        -- In questions, "wie" = "how"
        if nextToken then
            local nextLower = nextToken.value:lower()
            if nextLower == "viel" or nextLower == "viele" or nextLower == "lange" or 
               nextLower == "oft" or nextLower == "gut" or nextLower == "wurdest" or
               nextLower == "wurde" or nextLower == "ist" or nextLower == "war" then
                return translation.question or "how"
            end
        end
        -- After "und" (and) at start, often "how" in questions
        if #contextBefore > 0 and contextBefore[1] == "und" then
            if nextToken and (nextToken.value:lower() == "wurdest" or nextToken.value:lower() == "warst") then
                return translation.question or "how"
            end
        end
        -- Default to table default
        return translation.default or "like"
    end
    
    -- If translation is not a table, check if it's a string with multiple options
    if type(translation) == "string" then
        -- Check if translation contains multiple options separated by "/"
        if translation:find("/") then
            -- Split options and choose the best one based on context
            local options = {}
            for option in translation:gmatch("([^/]+)") do
                table.insert(options, option:match("^%s*(.-)%s*$")) -- Trim whitespace
            end
            
            if #options > 1 then
                -- Try to choose best option based on context
                local bestOption = SelectBestTranslationOption(tokenKey, options, contextBefore, contextAfter, prevToken, nextToken)
                return bestOption or options[1] -- Fallback to first option
            else
                return translation
            end
        else
            return translation
        end
    end
    
    return translation
end

-- Translate tokens using dependency parsing (structure-based translation)
-- This is an alternative to word-by-word translation that uses dependency trees
local function TranslateTokensDependency(tokens, langPack)
    if not DependencyParser then
        -- Dependency parser not available, return nil to fall back to word-by-word
        return nil, nil, nil
    end
    
    -- Parse tokens into dependency tree
    local nodes = DependencyParser.Parse(tokens)
    if not nodes or #nodes == 0 then
        -- Parse failed, fall back to word-by-word
        return nil, nil, nil
    end
    
    local root = DependencyParser.GetRoot(nodes)
    if not root or root.pos ~= "VERB" then
        -- No verb found, can't build structure-based translation
        return nil, nil, nil
    end
    
    -- Translate nodes and build English word order
    -- English word order: SUBJ VERB OBJ (OBJ2) PREP
    local translatedParts = {}
    local nodeTranslations = {}  -- Cache translations for each node
    local translatedCount = 0
    local totalWords = 0
    
    -- Helper: Translate a single node
    local function TranslateNode(node)
        if not node then return nil end
        
        -- Check cache
        if nodeTranslations[node.nodeIndex] then
            return nodeTranslations[node.nodeIndex]
        end
        
        totalWords = totalWords + 1
        local trans = GetContextualTranslation(
            {type = "word", value = node.word, original = node.original},
            node.tokenIndex or node.nodeIndex,
            tokens,
            langPack
        )
        
        -- Fallback to normal translation methods
        if not trans then
            trans = TryCompoundDecomposition(node.word, langPack)
        end
        if not trans and langPack.tokens then
            local sourceLang = langPack.metadata and langPack.metadata.code or "de"
            local normalized = NormalizeVerbForm(node.word, sourceLang)
            if normalized then
                trans = langPack.tokens[normalized]
                if trans and type(trans) == "table" then
                    trans = trans[1] or trans.default or trans
                end
            end
        end
        
        if trans then
            translatedCount = translatedCount + 1
        end
        
        nodeTranslations[node.nodeIndex] = trans or node.word
        return trans or node.word
    end
    
    -- Translate and order by dependency structure
    -- English order: SUBJ → VERB → OBJ → OBJ2 → PREP
    
    -- 1. Translate SUBJ
    for _, dep in ipairs(root.dependencies) do
        if dep.relation == DependencyParser.RELATIONS.SUBJ then
            local subjNode = nodes[dep.target]
            if subjNode then
                local trans = TranslateNode(subjNode)
                -- Handle noun phrases: ARTICLE + NOUN
                if dep.phraseEnd and nodes[dep.phraseEnd] then
                    local nounTrans = TranslateNode(nodes[dep.phraseEnd])
                    if trans and nounTrans then
                        table.insert(translatedParts, {type = "subj", words = {trans, nounTrans}})
                    elseif trans then
                        table.insert(translatedParts, {type = "subj", words = {trans}})
                    end
                else
                    if trans then
                        table.insert(translatedParts, {type = "subj", words = {trans}})
                    end
                end
            end
            break  -- Only one subject
        end
    end
    
    -- 2. Translate VERB (root)
    local verbTrans = TranslateNode(root)
    if verbTrans then
        table.insert(translatedParts, {type = "verb", words = {verbTrans}})
    end
    
    -- 3. Translate OBJ (direct object)
    for _, dep in ipairs(root.dependencies) do
        if dep.relation == DependencyParser.RELATIONS.OBJ then
            local objNode = nodes[dep.target]
            if objNode then
                local trans = TranslateNode(objNode)
                if trans then
                    table.insert(translatedParts, {type = "obj", words = {trans}})
                end
            end
            break  -- Only one direct object
        end
    end
    
    -- 4. Translate OBJ2 (indirect object)
    for _, dep in ipairs(root.dependencies) do
        if dep.relation == DependencyParser.RELATIONS.OBJ2 then
            local obj2Node = nodes[dep.target]
            if obj2Node then
                local trans = TranslateNode(obj2Node)
                if trans then
                    table.insert(translatedParts, {type = "obj2", words = {trans}})
                end
            end
            break
        end
    end
    
    -- 5. Translate PREP (prepositional phrases)
    for _, dep in ipairs(root.dependencies) do
        if dep.relation == DependencyParser.RELATIONS.PREP then
            local prepNode = nodes[dep.target]
            if prepNode then
                local prepTrans = TranslateNode(prepNode)
                -- Translate prepositional phrase: PREP + (ARTICLE) + NOUN
                if dep.phraseEnd then
                    local prepWords = {prepTrans}
                    for i = dep.target + 1, dep.phraseEnd do
                        local phraseNode = nodes[i]
                        if phraseNode then
                            local phraseTrans = TranslateNode(phraseNode)
                            if phraseTrans then
                                table.insert(prepWords, phraseTrans)
                            end
                        end
                    end
                    table.insert(translatedParts, {type = "prep", words = prepWords})
                else
                    if prepTrans then
                        table.insert(translatedParts, {type = "prep", words = {prepTrans}})
                    end
                end
            end
        end
    end
    
    -- Build translated tokens from ordered parts
    local translated = {}
    for _, part in ipairs(translatedParts) do
        for _, word in ipairs(part.words) do
            table.insert(translated, {
                type = "word",
                value = word,
                original = word,  -- Will be filled in properly later if needed
            })
        end
    end
    
    -- Copy non-word tokens from original (punctuation, etc.)
    -- For now, just add spaces - we'll handle punctuation better in reconstruction
    
    local coverage = totalWords > 0 and (translatedCount / totalWords) or 0.0
    local unknownRatio = totalWords > 0 and ((totalWords - translatedCount) / totalWords) or 1.0
    
    return translated, coverage, unknownRatio
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
            
            -- If no phrase match, try separable verb matching
            if not phraseMatch then
                phraseMatch = MatchSeparableVerb(tokens, i, langPack)
            end
            
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
                
                -- If no direct translation found, try compound word decomposition
                if not trans then
                    trans = TryCompoundDecomposition(token.value, langPack)
                end
                
                -- If still no translation, try verb conjugation normalization
                if not trans and langPack.tokens then
                    local sourceLang = langPack.metadata and langPack.metadata.code or "de"
                    local normalized = NormalizeVerbForm(token.value, sourceLang)
                    if normalized then
                        trans = langPack.tokens[normalized]
                        if trans then
                            -- Extract string translation if it's a table
                            if type(trans) == "table" then
                                trans = trans[1] or trans.default or trans
                            end
                        end
                    end
                end
                
                -- If still no translation, try context inference for unknown words
                -- Only do this if we have good context (surrounding words are translated)
                if not trans and langPack.tokens then
                    -- Check if surrounding words give us hints
                    local contextBefore = {}
                    local contextAfter = {}
                    for j = math.max(1, i - 2), i - 1 do
                        if tokens[j] and tokens[j].type == "word" then
                            table.insert(contextBefore, tokens[j].value:lower())
                        end
                    end
                    for j = i + 1, math.min(#tokens, i + 2) do
                        if tokens[j] and tokens[j].type == "word" then
                            table.insert(contextAfter, tokens[j].value:lower())
                        end
                    end
                    
                    -- If we have translated context words, we can infer the unknown word
                    -- For now, we'll keep unknown words as-is (context inference is complex)
                    -- But we mark them as lower confidence in coverage calculation
                end
                
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

-- Detect sentence type (question, command, statement)
-- This helps with word order adjustments later
local function DetectSentenceType(tokens, message)
    if #tokens == 0 then
        return "statement"
    end
    
    local firstToken = tokens[1]
    local lastToken = tokens[#tokens]
    
    -- Check for question mark
    if lastToken and lastToken.type == "punctuation" and lastToken.value == "?" then
        return "question"
    end
    
    -- Check if starts with question word
    if firstToken and firstToken.type == "word" then
        local firstWord = firstToken.value:lower()
        local questionWords = {
            ["wie"] = true, ["wo"] = true, ["was"] = true, ["wer"] = true,
            ["wann"] = true, ["warum"] = true, ["wohin"] = true, ["woher"] = true,
            ["weshalb"] = true, ["weswegen"] = true
        }
        if questionWords[firstWord] then
            return "question"
        end
    end
    
    -- Check for question structure: verb + question word (inverted question)
    -- German questions often have verb before subject
    if #tokens >= 3 then
        local firstWord = tokens[1].type == "word" and tokens[1].value:lower() or nil
        local secondWord = tokens[2].type == "word" and tokens[2].value:lower() or nil
        
        -- Common German question verbs
        local questionVerbs = {
            ["ist"] = true, ["sind"] = true, ["war"] = true, ["waren"] = true,
            ["kann"] = true, ["kannst"] = true, ["können"] = true,
            ["hat"] = true, ["hast"] = true, ["haben"] = true,
            ["gibt"] = true, ["gibt es"] = true
        }
        
        -- Check if first word is a verb and second is a pronoun/subject (question structure)
        if questionVerbs[firstWord] and secondWord then
            local pronouns = {
                ["du"] = true, ["ihr"] = true, ["wir"] = true, ["sie"] = true,
                ["er"] = true, ["es"] = true, ["das"] = true, ["der"] = true, ["die"] = true
            }
            if pronouns[secondWord] then
                return "question"
            end
        end
    end
    
    -- Check for command/imperative
    -- Commands often start with verbs in imperative form, or are short phrases
    if firstToken and firstToken.type == "word" then
        local firstWord = firstToken.value:lower()
        
        -- Common German imperative verbs (often end in -e, -en, or are base form)
        -- These are common command verbs in WoW context
        local imperativeVerbs = {
            ["komm"] = true, ["kommt"] = true, ["komme"] = true,
            ["geh"] = true, ["geht"] = true, ["gehe"] = true,
            ["warte"] = true, ["wartet"] = true,
            ["hilf"] = true, ["helft"] = true, ["helfe"] = true,
            ["folg"] = true, ["folgt"] = true, ["folge"] = true,
            ["stop"] = true, ["halt"] = true, ["warte"] = true
        }
        
        if imperativeVerbs[firstWord] then
            return "command"
        end
    end
    
    -- Check if message is very short (likely command or exclamation)
    local wordCount = 0
    for _, token in ipairs(tokens) do
        if token.type == "word" then
            wordCount = wordCount + 1
        end
    end
    
    if wordCount <= 2 and lastToken and lastToken.type == "punctuation" and lastToken.value == "!" then
        return "command"
    end
    
    -- Default to statement
    return "statement"
end

-- Create cache key from message and languages
local function CreateCacheKey(message, sourceLang, targetLang)
    return string.format("%s:%s:%s", message or "", sourceLang or "", targetLang or "en")
end

-- Main translation pipeline
function Engine.Translate(message, sourceLang, targetLang, bypassCache)
    -- Default target language
    targetLang = targetLang or "en"
    
    -- Save original sourceLang parameter (before it gets changed)
    local originalSourceLang = sourceLang
    
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
    
    -- Step 2: Detect sentence type (question, command, statement)
    local sentenceType = DetectSentenceType(tokens, message)
    
    -- Step 2.5: Check for WoW abbreviations language pack FIRST (before foreign language detection)
    -- This allows users to enable/disable abbreviation expansion separately from foreign languages
    -- WoW pack should only activate if explicitly enabled AND message contains WoW abbreviations
    -- BUT: Only activate for English messages (not foreign language messages that happen to contain abbreviations)
    if not sourceLang or sourceLang == "wow" then
        if LanguagePackManager.IsEnabled("wow") then
            -- Quick check: if message contains foreign language characters, skip WoW pack
            -- This prevents WoW pack from interfering with foreign language translation
            local hasForeignChars = message:find("[äöüßÄÖÜàáâãäåèéêëìíîïòóôõöùúûüýÿç]", 1) ~= nil
            if not hasForeignChars then
                local wowPack = Engine.LoadLanguagePack("wow")
                if wowPack and wowPack.tokens then
                    -- Check if message contains WoW abbreviations
                    local wowAbbrevCount = 0
                    local totalWords = 0
                    for _, token in ipairs(tokens) do
                        if token.type == "word" then
                            totalWords = totalWords + 1
                            local word = token.value:lower()
                            -- Check if it's a WoW abbreviation pattern FIRST (lf*, wt*, etc.)
                            -- These are always WoW abbreviations regardless of universal list
                            if word:match("^lf") or word:match("^wt[stb]") or word:match("^l[fmg]") then
                                wowAbbrevCount = wowAbbrevCount + 1
                            -- Check if it's a WoW abbreviation (exists in WoW pack)
                            -- WoW pack tokens are abbreviations that should be expanded
                            elseif wowPack.tokens[word] then
                                -- Count it even if it's in universal list, since we want to expand it
                                wowAbbrevCount = wowAbbrevCount + 1
                            end
                        end
                    end
                    
                    -- If message contains WoW abbreviations and WoW pack is enabled, use it
                    -- Require at least 30% of words to be WoW abbreviations, or if sourceLang was explicitly "wow"
                    if (wowAbbrevCount > 0 and totalWords > 0 and (wowAbbrevCount / totalWords) >= 0.30) or sourceLang == "wow" then
                        sourceLang = "wow"
                        langConfidence = 0.6 -- Moderate confidence for abbreviation expansion
                        useWowPack = true
                    end
                end
            end
        end
    end
    
    -- Step 3: Language detection (if sourceLang not provided and not using WoW pack)
    local detectedLang, detectedLangConfidence = nil, 0.0
    if not useWowPack then
        detectedLang, detectedLangConfidence = LanguageDetect.Detect(tokens)
        if not sourceLang then
            sourceLang = detectedLang
            langConfidence = detectedLangConfidence
        else
            langConfidence = detectedLangConfidence or 0.5
        end
    end
    
    -- Special handling for mixed-language messages (e.g., "If tank heal dm dann abfahrt")
    -- If detected as English but contains known words from enabled languages, try that language
    -- BUT: Don't trigger on universal gaming abbreviations that exist in both languages
    -- BUT: Skip this if we're using WoW pack
    if not useWowPack and (not sourceLang or sourceLang == "en" or langConfidence < LanguageDetect.MIN_CONFIDENCE) then
        -- Use centralized universal WoW abbreviations from Utils
        local universalAbbreviations = Utils.UNIVERSAL_WOW_ABBREVIATIONS
        
        -- Try each enabled language pack to see if message contains words from that language
        local enabledPacks = LanguagePackManager.GetAvailablePacks()
        local bestMatchLang = nil
        local bestMatchScore = 0
        
        for lang, packInfo in pairs(enabledPacks) do
            if lang ~= "en" and LanguagePackManager.IsEnabled(lang) then
                local langPack = Engine.LoadLanguagePack(lang)
                if langPack and langPack.tokens then
                    local hasLanguageCharacters = false
                    local languageFunctionWords = 0
                    local languageVocabularyWords = 0
                    local matchScore = 0
                    
                    -- Check for language-specific characters first (strongest indicator)
                    local messageText = message:lower()
                    if langPack.charHints then
                        for char, _ in pairs(langPack.charHints) do
                            if messageText:find(char, 1, true) then
                                hasLanguageCharacters = true
                                matchScore = matchScore + 3
                                break
                            end
                        end
                    elseif LanguageDetect.CHAR_HINTS[lang] then
                        -- Fallback to LanguageDetect char hints
                        for _, char in ipairs(LanguageDetect.CHAR_HINTS[lang]) do
                            if messageText:find(char, 1, true) then
                                hasLanguageCharacters = true
                                matchScore = matchScore + 3
                                break
                            end
                        end
                    end
                    
                    -- Check for language function words
                    if LanguageDetect.FUNCTION_WORDS[lang] then
                        local functionWordsList = LanguageDetect.FUNCTION_WORDS[lang]
                        for _, token in ipairs(tokens) do
                            if token.type == "word" then
                                local word = token.value:lower()
                                
                                -- Skip universal gaming abbreviations
                                if not universalAbbreviations[word] then
                                    -- Check if it's a function word for this language
                                    for _, fw in ipairs(functionWordsList) do
                                        if word == fw:lower() then
                                            languageFunctionWords = languageFunctionWords + 1
                                            matchScore = matchScore + 1
                                            break
                                        end
                                    end
                                    
                                    -- If not a function word, check if it's in language vocabulary
                                    if langPack.tokens[word] then
                                        local translation = langPack.tokens[word]
                                        -- Handle table translations (e.g., context-dependent)
                                        if type(translation) == "table" then
                                            translation = translation.default or translation[1]
                                        end
                                        -- Only check if translation is a string and different from word
                                        if type(translation) == "string" and translation ~= word and translation:lower() ~= word then
                                            -- This is a genuine word with a translation
                                            languageVocabularyWords = languageVocabularyWords + 1
                                            matchScore = matchScore + 1
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    -- Calculate match score
                    -- Lower threshold for single strong German words (like "Eisengegengewicht")
                    -- If we have a vocabulary word that's clearly German (not a loanword), count it
                    local hasStrongGermanWord = false
                    if languageVocabularyWords >= 1 then
                        -- Check if any vocabulary word is clearly German (long compound words, specific German terms)
                        for _, token in ipairs(tokens) do
                            if token.type == "word" then
                                local word = token.value:lower()
                                if langPack.tokens[word] then
                                    local translation = langPack.tokens[word]
                                    -- If it's a compound word (long) or clearly German term, it's a strong indicator
                                    -- Also boost score for German nouns that are clearly not English (like "verbannung")
                                    if #word >= 10 or word:find("gegengewicht") or word:find("schließkassette") or 
                                       word:find("magierstab") or word:find("kriegsaxt") or word:find("traumsänger") or
                                       word:find("beinschützer") or word:find("verbannung") or word:find("verbannungen") then
                                        hasStrongGermanWord = true
                                        matchScore = matchScore + 2 -- Boost score for strong German words
                                        break
                                    end
                                end
                            end
                        end
                    end
                    
                    -- Require STRONG evidence that this is actually a foreign language message:
                    -- 1. Language-specific characters (ä, ö, ü, ß, é, è, etc.) - strongest indicator
                    -- 2. Multiple function words (2+)
                    -- 3. At least 1 function word + 1 vocabulary word (but vocabulary word must not be a universal gaming term)
                    -- 4. Strong German compound words (already handled above)
                    -- BUT: Don't match if message is mostly universal gaming abbreviations
                    local nonUniversalWords = 0
                    local tokenWordCount = 0
                    for _, token in ipairs(tokens) do
                        if token.type == "word" then
                            tokenWordCount = tokenWordCount + 1
                            local word = token.value:lower()
                            if not universalAbbreviations[word] then
                                nonUniversalWords = nonUniversalWords + 1
                            end
                        end
                    end
                    
                    -- Require that at least 30% of words are non-universal for mixed-language detection
                    -- This prevents pure English gaming messages from being detected as foreign
                    local hasNonUniversalContent = (tokenWordCount > 0 and (nonUniversalWords / tokenWordCount) >= 0.30)
                    
                    if hasLanguageCharacters or 
                       (languageFunctionWords >= 2 and hasNonUniversalContent) or 
                       (languageFunctionWords >= 1 and languageVocabularyWords >= 1 and hasNonUniversalContent) or
                       hasStrongGermanWord then
                        if matchScore > bestMatchScore then
                            bestMatchScore = matchScore
                            bestMatchLang = lang
                        end
                    end
                end
            end
        end
        
        -- If we found a strong match, use it
        -- BUT: Require higher threshold (>= 3) when no language-specific characters are present
        -- This prevents false positives on pure English gaming messages
        if bestMatchLang then
            -- Check if we have language-specific characters for this match
            local hasCharsForMatch = false
            if bestMatchLang == "de" then
                hasCharsForMatch = message:find("[äöüßÄÖÜ]", 1) ~= nil
            elseif bestMatchLang == "fr" then
                hasCharsForMatch = message:find("[àáâãäåèéêëìíîïòóôõöùúûüýÿç]", 1) ~= nil
            end
            
            -- Require higher score if no language-specific characters
            local requiredScore = hasCharsForMatch and 2 or 4
            if bestMatchScore >= requiredScore then
                sourceLang = bestMatchLang
                langConfidence = 0.5 -- Give it moderate confidence for mixed messages
            end
        end
    end
    
    -- Check if message is purely English abbreviations/gaming terms
    -- BUT: Skip this check if sourceLang is explicitly provided (user knows the language)
    -- Skip this check if mixed-language detection already found a match above
    -- Do this check AFTER mixed-language detection if sourceLang is still "en"
    -- If all words are universal gaming abbreviations, it's English and doesn't need translation
    
    -- Don't skip translation if sourceLang was explicitly provided (user knows the language)
    -- originalSourceLang is the parameter passed to the function (before any detection)
    -- Also don't skip if using WoW pack (abbreviation expansion)
    -- Note: useWowPack might be set later, so we check if sourceLang == "wow" as well
    local sourceLangWasExplicit = (originalSourceLang and originalSourceLang ~= "en") or (sourceLang == "wow") or useWowPack
    
    local allUniversalAbbrevs = true
    -- Use centralized universal WoW abbreviations from Utils
    local universalAbbrevsForCheck = Utils.UNIVERSAL_WOW_ABBREVIATIONS
    local wordCount = 0
    local universalWordCount = 0
    for _, token in ipairs(tokens) do
        if token.type == "word" then
            wordCount = wordCount + 1
            local word = token.value:lower()
            if universalAbbrevsForCheck[word] then
                universalWordCount = universalWordCount + 1
            else
                -- Check if it's a proper noun (starts with capital letter) or number
                -- These are often English even if they exist in other language vocabularies
                local firstChar = token.value:sub(1, 1)
                if firstChar:match("%u") or token.value:match("^%d+") then
                    -- Proper noun or number - count as universal
                    universalWordCount = universalWordCount + 1
                else
                    allUniversalAbbrevs = false
                end
            end
        end
    end
    -- If all words are universal abbreviations, it's English and doesn't need translation
    -- BUT: Don't skip if sourceLang was explicitly provided (user knows the language)
    if allUniversalAbbrevs and wordCount > 0 and not sourceLangWasExplicit then
        return nil, 0.0, "already_english"
    end
    -- If MOST words (>= 70%) are universal English gaming terms, it's probably English
    -- BUT: Don't skip if we already detected a mixed-language match (sourceLang changed from "en")
    -- BUT: Don't skip if sourceLang was explicitly provided (user knows the language)
    -- This catches messages like "LF2M for Uldaman" where "Uldaman" is a proper noun
    -- Also catch 2-word messages where both words are universal (e.g., "layer pls")
    -- However, if sourceLang was already changed by mixed-language detection, don't override it
    local wasSourceLangChanged = (sourceLang and sourceLang ~= "en" and sourceLang ~= detectedLang)
    if wordCount >= 2 and (universalWordCount / wordCount) >= 0.70 and not wasSourceLangChanged and not sourceLangWasExplicit then
        return nil, 0.0, "already_english"
    end
    -- For 2-word messages, if at least one word is universal and the other is a common English word, skip
    -- BUT: Don't skip if sourceLang was explicitly provided (user knows the language)
    if wordCount == 2 and universalWordCount >= 1 and not sourceLangWasExplicit then
        -- Check if the non-universal word is a common English gaming term or word
        for _, token in ipairs(tokens) do
            if token.type == "word" then
                local word = token.value:lower()
                if not universalAbbrevsForCheck[word] then
                    -- Check if it's a common English word (not likely to be translated)
                    local commonEnglishWords = {
                        ["layer"] = true, ["layers"] = true, ["layering"] = true,
                        ["inv"] = true, ["invite"] = true, ["invites"] = true,
                    }
                    if commonEnglishWords[word] then
                        -- Both words are English gaming terms, skip translation
                        return nil, 0.0, "already_english"
                    end
                end
            end
        end
    end
    
    -- Special case: Very short messages (1-2 words) that are likely English greetings
    -- These don't need translation - they're universal
    -- BUT: Check if words exist in enabled language packs first (e.g., "r" = "ready" in German)
    if #tokens <= 2 then
        local allEnglishGreetings = true
        local englishGreetings = {"hi", "hey", "yo", "ok", "okay", "rdy", "ready", "rip"}
        -- Note: "r" removed from English-only list - it can be German "ready" abbreviation
        -- "rip" = rest in peace (universal gaming abbreviation, shouldn't translate)
        
        -- First check if any word exists in enabled language packs
        local hasLanguagePackMatch = false
        for _, token in ipairs(tokens) do
            if token.type == "word" and token.value and type(token.value) == "string" then
                local word = token.value:lower()
                -- Check all enabled language packs
                local enabledPacks = LanguagePackManager.GetAvailablePacks()
                for lang, packInfo in pairs(enabledPacks) do
                    if lang ~= "en" and LanguagePackManager.IsEnabled(lang) then
                        local langPack = Engine.LoadLanguagePack(lang)
                        if langPack and langPack.tokens and langPack.tokens[word] then
                            local translation = langPack.tokens[word]
                            -- If it has a translation different from the word itself, it's a language pack word
                            if type(translation) == "string" and translation ~= word and translation:lower() ~= word then
                                hasLanguagePackMatch = true
                                break
                            elseif type(translation) == "table" and translation.default then
                                -- Table-based translation (contextual)
                                hasLanguagePackMatch = true
                                break
                            end
                        end
                    end
                end
                if hasLanguagePackMatch then
                    break
                end
            end
        end
        
        -- Only skip as English greeting if no language pack match found
        if not hasLanguagePackMatch then
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
                -- Skip translation for universal English greetings (only if not in language pack)
                -- BUT: Allow emoticons when sourceLang is explicitly provided (they should pass through)
                if not sourceLangWasExplicit or #tokens > 1 then
                    return nil, 0.0, "english_greeting"
                end
                -- If sourceLang was explicitly provided and it's just an emoticon, allow it to pass through
            end
        end
    end
    
    -- If language detection failed or confidence is too low, don't translate
    -- This prevents false positives on random text
    -- BUT: If sourceLang was explicitly provided, allow translation even for English terms
    -- (e.g., English gaming terms in German chat like "shadow priests")
    if not sourceLang or langConfidence < LanguageDetect.MIN_CONFIDENCE then
        if not sourceLangWasExplicit then
            return nil, 0.0, "language_unknown"
        end
        -- If sourceLang was explicitly provided, continue with translation
        -- The message might be English gaming terms that should pass through unchanged
    end
    
    -- Skip translation if source and target are the same
    if sourceLang == targetLang then
        return nil, 0.0, "same_language"
    end
    
    -- Validate sourceLang is set (should never happen, but safety check)
    if not sourceLang then
        return nil, 0.0, "language_unknown"
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
        -- No pattern match - try dependency-based translation first, fall back to word-by-word
        local translatedTokens, tokenCoverage, tokenUnknownRatio = TranslateTokensDependency(tokens, langPack)
        if not translatedTokens then
            -- Dependency parsing failed or not available, use word-by-word translation
            translatedTokens, tokenCoverage, tokenUnknownRatio = Engine.TranslateTokens(tokens, langPack)
        end
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
    -- Exception: When sourceLang is explicitly provided, allow identical translations (e.g., gaming terms)
    local isShortGreeting = (#tokens == 1 and tokens[1].type == "word" and 
                             (tokens[1].value == "moin" or tokens[1].value == "hallo" or 
                              tokens[1].value == "hi" or tokens[1].value == "hey"))
    -- Allow identical translations when sourceLang was explicitly provided (user knows the language)
    -- This handles gaming terms like "tank", "lfg", "wtb", "wts" that are loanwords in French
    local isExplicitSourceLang = (originalSourceLang and originalSourceLang ~= "en")
    if similarity > 0.70 and coverage < 0.5 and not isShortGreeting and not isExplicitSourceLang then
        -- Too similar and low coverage - this is basically untranslated
        return nil, 0.0, "translation_too_similar"
    end
    -- Reject very low similarity translations that are essentially unchanged
    -- This catches cases like "heal spam" -> "heal spam" (100% similar, not a real translation)
    -- BUT: Allow when sourceLang is explicitly provided (gaming terms are often identical)
    if similarity > 0.95 and not isExplicitSourceLang then
        -- Almost identical - this is not a useful translation (unless explicitly provided sourceLang)
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
        messageText = message, -- Pass original message for bracket/item link detection
    })
    
    -- Final check: Reject very low confidence translations that are too similar to original
    -- This catches cases like "heal spam" where it translates but is essentially unchanged
    -- BUT: Allow when sourceLang is explicitly provided (gaming terms are often identical)
    if finalConfidence < 0.30 and similarity > 0.80 and not isExplicitSourceLang then
        return nil, 0.0, "translation_too_similar"
    end
    -- Also reject if similarity is extremely high (>95%) regardless of confidence
    -- These are essentially unchanged messages
    -- BUT: Allow when sourceLang is explicitly provided (gaming terms are often identical)
    if similarity > 0.95 and not isExplicitSourceLang then
        return nil, 0.0, "translation_too_similar"
    end
    
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

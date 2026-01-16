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
        -- Sort patterns by specificity (longer patterns first)
        table.sort(pack.patterns, function(a, b)
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
local function MatchPhraseAt(tokens, startIdx, langPack)
    if not langPack.phrases or not next(langPack.phrases) then
        return nil
    end
    
    -- Build lookup table of phrase words (cache on first call per pack)
    if not langPack._phraseLookupCache then
        langPack._phraseLookupCache = {}
        langPack._maxPhraseLength = 0
        
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
        end
    end
    
    local maxPhraseLength = langPack._maxPhraseLength
    if maxPhraseLength < 2 or startIdx > #tokens then
        return nil
    end
    
    -- Try to match phrases of decreasing length (longest first)
    -- For same-length phrases, we match against the actual token text to find the exact match
    if tokens[startIdx].type == "word" then
        for phraseLen = math.min(maxPhraseLength, #tokens - startIdx + 1), 2, -1 do
            local phraseWords = {}
            local allWords = true
            for j = 0, phraseLen - 1 do
                if tokens[startIdx + j] and tokens[startIdx + j].type == "word" then
                    table.insert(phraseWords, tokens[startIdx + j].value:lower())
                else
                    allWords = false
                    break
                end
            end
            
            if allWords then
                -- Build the actual phrase key from tokens
                local phraseKey = table.concat(phraseWords, " ")
                local phraseData = langPack._phraseLookupCache[phraseKey]
                if phraseData then
                    -- Found a matching phrase - this is the exact match for this length
                    return {
                        length = phraseLen,
                        translation = phraseData.translation
                    }
                end
            end
        end
    end
    
    return nil
end

-- Get context-aware translation for a token
local function GetContextualTranslation(token, prevToken, nextToken, langPack)
    if not langPack.tokens then
        return nil
    end
    
    -- token.value is already normalized (lowercased) by tokenizer
    local tokenKey = token.value
    local translation = langPack.tokens[tokenKey]
    
    -- Simple context rules (can be extended)
    -- Check if token has context-dependent translations
    if translation and type(translation) == "table" then
        -- Token has multiple possible translations based on context
        -- Simple context checking (can be expanded)
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
        -- Default translation
        return translation.default or translation[1]
    end
    
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
                translated[#translated + 1] = {
                    type = "word",
                    value = phraseMatch.translation,
                    original = token.original,
                }
                translatedCount = translatedCount + phraseMatch.length
                totalWords = totalWords + phraseMatch.length - 1 -- Already counted first word
                -- Skip the remaining words in the phrase
                i = i + phraseMatch.length
            else
                -- Single word translation with context awareness
                local prevToken = i > 1 and tokens[i - 1] or nil
                local nextToken = i < #tokens and tokens[i + 1] or nil
                local trans = GetContextualTranslation(token, prevToken, nextToken, langPack)
                
                if trans then
                    translated[#translated + 1] = {
                        type = token.type,
                        value = trans,
                        original = token.original,
                    }
                    translatedCount = translatedCount + 1
                else
                    -- Keep original if no translation
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

-- Apply grammar rules
function Engine.ApplyGrammar(text, langPack)
    if not langPack.grammar or not langPack.grammar.rules then
        return text
    end
    
    local result = text
    
    for _, rule in ipairs(langPack.grammar.rules) do
        if rule.from and rule.to then
            local success, replaced = pcall(function()
                return result:gsub(rule.from, rule.to)
            end)
            if success then
                result = replaced
            end
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
    if (not sourceLang or sourceLang == "en" or langConfidence < LanguageDetect.MIN_CONFIDENCE) and LanguagePackManager.IsEnabled("de") then
        -- Check if message contains any German words from enabled language packs
        local langPack = Engine.LoadLanguagePack("de")
        if langPack and langPack.tokens then
            local hasGermanWords = false
            for _, token in ipairs(tokens) do
                if token.type == "word" then
                    local word = token.value:lower()
                    if langPack.tokens[word] then
                        hasGermanWords = true
                        break
                    end
                end
            end
            
            -- If we found German words, override language detection to German
            if hasGermanWords then
                sourceLang = "de"
                langConfidence = 0.5 -- Give it moderate confidence for mixed messages
            end
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
        -- Restore protected tokens in pattern-matched text
        for placeholderText, protected in pairs(patternPlaceholders) do
            patternMatchedText = patternMatchedText:gsub(placeholderText:gsub("[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%0"), protected, 1)
        end
        translatedText = patternMatchedText
        coverage = originalTokensCoverage
        unknownRatio = originalTokensUnknownRatio
    else
        -- No pattern match - translate tokens normally
        local translatedTokens, tokenCoverage, tokenUnknownRatio = Engine.TranslateTokens(tokens, langPack)
        translatedText = Tokenizer.Reconstruct(translatedTokens)
        coverage = tokenCoverage
        unknownRatio = tokenUnknownRatio
    end
    
    -- Step 6: Apply patterns to translated text (for any patterns that work on English)
    -- Only if we didn't already apply patterns to original
    if not patternWasApplied then
        translatedText = Engine.ApplyPatterns(translatedText, langPack)
    end
    
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
    if similarity > 0.70 and coverage < 0.5 then
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

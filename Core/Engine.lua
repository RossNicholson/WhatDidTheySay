-- WhatDidTheySay - Translation Engine
-- Main translation pipeline orchestrator

local Utils = WDTS_Utils
local Tokenizer = WDTS_Tokenizer
local LanguageDetect = WDTS_LanguageDetect
local Confidence = WDTS_Confidence

local Engine = {}
Engine.initialized = false

-- Language pack cache
Engine.languagePacks = {}

-- Load language pack
function Engine.LoadLanguagePack(lang)
    if Engine.languagePacks[lang] then
        return Engine.languagePacks[lang]
    end
    
    local pack = {
        tokens = {},
        intents = {},
        patterns = {},
        grammar = {},
    }
    
    -- Try to load language pack files
    local packName = "WDTS_Lang_" .. lang
    
    -- Load tokens
    if _G[packName .. "_Tokens"] then
        pack.tokens = _G[packName .. "_Tokens"]
    end
    
    -- Load intents
    if _G[packName .. "_Intents"] then
        pack.intents = _G[packName .. "_Intents"]
    end
    
    -- Load patterns
    if _G[packName .. "_Patterns"] then
        pack.patterns = _G[packName .. "_Patterns"]
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
    local text = table.concat(words, " "):lower()
    
    local bestIntent = nil
    local bestScore = 0.0
    
    for _, intent in ipairs(langPack.intents) do
        if intent.patterns then
            for _, pattern in ipairs(intent.patterns) do
                -- Simple pattern matching
                local matches = 0
                for word in text:gmatch("%S+") do
                    if word:find(pattern:lower(), 1, true) then
                        matches = matches + 1
                    end
                end
                
                if matches > 0 then
                    local score = (intent.score or 0.5) * (matches / #words)
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
    
    if bestScore > 0.3 then
        return bestIntent, bestScore
    end
    
    return nil, 0.0
end

-- Apply phrase patterns
function Engine.ApplyPatterns(text, langPack)
    if not langPack.patterns then
        return text
    end
    
    local result = text
    
    for _, pattern in ipairs(langPack.patterns) do
        if pattern.from and pattern.to then
            -- Simple pattern replacement
            local success, replaced = pcall(function()
                return text:gsub(pattern.from, pattern.to)
            end)
            if success and replaced ~= text then
                result = replaced
                break -- Use first matching pattern
            end
        end
    end
    
    return result
end

-- Translate tokens using language pack
function Engine.TranslateTokens(tokens, langPack)
    local translated = {}
    local translatedCount = 0
    local totalWords = 0
    
    for _, token in ipairs(tokens) do
        if token.type == "word" then
            totalWords = totalWords + 1
            -- Look up translation
            if langPack.tokens and langPack.tokens[token.value] then
                local trans = langPack.tokens[token.value]
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
        else
            -- Preserve non-word tokens
            translated[#translated + 1] = token
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

-- Main translation pipeline
function Engine.Translate(message, sourceLang, targetLang)
    -- Default target language
    targetLang = targetLang or "en"
    
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
    
    if not sourceLang or langConfidence < LanguageDetect.MIN_CONFIDENCE then
        return nil, 0.0, "language_unknown"
    end
    
    -- Skip translation if source and target are the same
    if sourceLang == targetLang then
        return nil, 0.0, "same_language"
    end
    
    -- Step 3: Load language pack
    local langPack = Engine.LoadLanguagePack(sourceLang)
    if not langPack or not langPack.tokens then
        return nil, 0.0, "language_pack_missing"
    end
    
    -- Step 4: Intent detection
    local intent, intentConfidence = Engine.DetectIntent(tokens, langPack)
    
    -- Step 5: Token translation
    local translatedTokens, coverage, unknownRatio = Engine.TranslateTokens(tokens, langPack)
    
    -- Step 6: Reconstruct text
    local translatedText = Tokenizer.Reconstruct(translatedTokens)
    
    -- Step 7: Apply patterns
    translatedText = Engine.ApplyPatterns(translatedText, langPack)
    
    -- Step 8: Apply grammar
    translatedText = Engine.ApplyGrammar(translatedText, langPack)
    
    -- Step 9: Restore protected tokens
    translatedText = Tokenizer.RestoreProtected(translatedText, protectedMap)
    
    -- Step 10: Calculate confidence
    local finalConfidence = Confidence.Calculate({
        languageConfidence = langConfidence,
        intentConfidence = intentConfidence,
        phraseCoverage = coverage,
        unknownTokenRatio = unknownRatio,
        messageLength = #tokens,
    })
    
    return translatedText, finalConfidence, intent and intent.id or nil
end

-- Initialize engine
function Engine.Initialize()
    if Engine.initialized then
        return
    end
    
    -- Preload default language packs (en is usually not needed, but load de)
    Engine.LoadLanguagePack("de")
    
    Engine.initialized = true
end

WDTS_Engine = Engine

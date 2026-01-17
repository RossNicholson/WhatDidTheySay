-- WhatDidTheySay - Language Detection
-- Lightweight language detection using function words and character hints

local Utils = WDTS_Utils
local LanguageDetect = {}

-- Will be set during initialization
LanguageDetect.LanguagePackManager = nil

-- Function words for each language (high-frequency, language-specific)
LanguageDetect.FUNCTION_WORDS = {
    en = {
        "the", "a", "an", "and", "or", "but", "in", "on", "at", "to", "for",
        "of", "with", "by", "from", "as", "is", "are", "was", "were", "be",
        "been", "have", "has", "had", "do", "does", "did", "will", "would",
        "can", "could", "should", "may", "might", "must", "this", "that",
        "these", "those", "what", "which", "who", "where", "when", "why",
        "how", "i", "you", "he", "she", "it", "we", "they", "me", "him",
        "her", "us", "them", "my", "your", "his", "her", "its", "our", "their",
    },
    de = {
        "der", "die", "das", "den", "dem", "des", "ein", "eine", "einen",
        "einem", "eines", "und", "oder", "aber", "in", "auf", "an", "zu",
        "für", "von", "mit", "durch", "über", "unter", "ist", "sind", "war",
        "waren", "bin", "bist", "seid", "habe", "has", "hat", "haben",
        "wird", "werden", "wurde", "wurden", "kann", "kannst", "können",
        "muss", "musst", "müssen", "soll", "sollst", "sollen", "darf",
        "darfst", "dürfen", "ich", "du", "er", "sie", "es", "wir", "ihr",
        "mich", "dich", "ihn", "uns", "euch", "mein", "dein", "sein", "ihr",
        "unser", "euer", "dies", "diese", "dieser", "welche", "wer", "was",
        "wo", "wann", "warum", "wie", "schade",
    },
}

-- Character hints (language-specific characters)
LanguageDetect.CHAR_HINTS = {
    de = { "ä", "ö", "ü", "ß", "Ä", "Ö", "Ü" },
    -- Add more languages as needed
}

-- Default detection threshold
LanguageDetect.MIN_CONFIDENCE = 0.30

-- Detect language from tokens
function LanguageDetect.Detect(tokens)
    -- Count word tokens
    local wordTokens = {}
    for _, token in ipairs(tokens) do
        if token.type == "word" then
            table.insert(wordTokens, token.value)
        end
    end
    
    if #wordTokens == 0 then
        return nil, 0.0
    end
    
    -- Build text from tokens for character analysis
    local text = table.concat(wordTokens, " ")
    
    -- Score each language (only enabled ones)
    local scores = {}
    for lang, functionWords in pairs(LanguageDetect.FUNCTION_WORDS) do
        -- Skip if language pack is disabled (but "en" is okay as it's the target)
        if lang ~= "en" then
            if LanguageDetect.LanguagePackManager and not LanguageDetect.LanguagePackManager.IsEnabled(lang) then
                -- Skip disabled languages
            else
                -- Language is enabled, score it
                local score = 0.0
                local matches = 0
                
                -- Function word matching
                for _, word in ipairs(wordTokens) do
                    for _, fw in ipairs(functionWords) do
                        if word == fw then
                            matches = matches + 1
                            break
                        end
                    end
                end
                
                -- Normalize by word count
                if #wordTokens > 0 then
                    score = matches / #wordTokens
                end
                
                -- Character hint bonus
                local charHints = LanguageDetect.CHAR_HINTS[lang]
                if charHints then
                    local charMatches = 0
                    for _, char in ipairs(charHints) do
                        if text:find(char, 1, true) then
                            charMatches = charMatches + 1
                        end
                    end
                    -- Small bonus for character hints
                    score = score + (charMatches * 0.1)
                end
                
                scores[lang] = score
            end
        end
    end
    
    -- Find best match
    local bestLang = nil
    local bestScore = 0.0
    
    for lang, score in pairs(scores) do
        if score > bestScore then
            bestScore = score
            bestLang = lang
        end
    end
    
    -- Clamp confidence to 0.0-1.0
    bestScore = Utils.Clamp(bestScore, 0.0, 1.0)
    
    -- Return nil if below threshold
    if bestScore < LanguageDetect.MIN_CONFIDENCE then
        return nil, bestScore
    end
    
    return bestLang, bestScore
end

-- Check if text contains language-specific characters
function LanguageDetect.HasCharHints(text, lang)
    local hints = LanguageDetect.CHAR_HINTS[lang]
    if not hints then return false end
    
    for _, char in ipairs(hints) do
        if text:find(char, 1, true) then
            return true
        end
    end
    
    return false
end

-- Initialize language detection (called after LanguagePackManager is available)
function LanguageDetect.Initialize()
    -- This will be called from Engine.Initialize after LanguagePackManager is set
end

WDTS_LanguageDetect = LanguageDetect

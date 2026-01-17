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
        "für", "von", "mit", "durch", "über", "unter", "nach", "vor", "ist", "sind", "war",
        "waren", "bin", "bist", "seid", "habe", "has", "hat", "haben",
        "wird", "werden", "wurde", "wurden", "kann", "kannst", "können",
        "muss", "musst", "müssen", "soll", "sollst", "sollen", "darf",
        "darfst", "dürfen", "ich", "du", "er", "sie", "es", "wir", "ihr",
        "mich", "dich", "ihn", "uns", "euch", "mein", "dein", "sein", "ihr",
        "unser", "euer", "dies", "diese", "dieser", "welche", "wer", "was",
        "wo", "wann", "warum", "wie", "schade", "moin", "vielleicht", "veileicht", "anderes",
        "sehr", "mega", "nett", "halt", "grad", "gerade", "also", "warst", "war",
        -- Common greetings and basic words
        "hallo", "danke", "bitte", "ja", "nein", "ok", "okay",
        -- Common verbs for LFG/trading
        "suche", "sucht", "suchst", "suchen", -- "suche" = "looking for"
        "brauche", "brauchst", "braucht", "brauchen", -- "brauche" = "need"
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
            table.insert(wordTokens, token.value:lower()) -- Normalize to lowercase
        end
    end
    
    if #wordTokens == 0 then
        return nil, 0.0
    end
    
    -- Build text from tokens for character analysis
    local text = table.concat(wordTokens, " ")
    
    -- Score each language (only enabled ones)
    local scores = {}
    local vocabularyMatches = {} -- Track vocabulary-based matches as fallback
    
    for lang, functionWords in pairs(LanguageDetect.FUNCTION_WORDS) do
        -- Skip if language pack is disabled (but "en" is okay as it's the target)
        if lang ~= "en" then
            if LanguageDetect.LanguagePackManager and not LanguageDetect.LanguagePackManager.IsEnabled(lang) then
                -- Skip disabled languages
            else
                -- Language is enabled, score it
                local score = 0.0
                local matches = 0
                local vocabMatches = 0
                
                -- Function word matching
                for _, word in ipairs(wordTokens) do
                    for _, fw in ipairs(functionWords) do
                        if word == fw:lower() then
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
                
                -- VOCABULARY-BASED FALLBACK: Check if words exist in language pack tokens
                -- This catches words that exist in vocabulary but aren't function words
                -- Access language pack via global table (loaded from language pack files)
                local packTokensTable = _G["WDTS_Lang_" .. lang .. "_Tokens"]
                if packTokensTable then
                    for _, word in ipairs(wordTokens) do
                        if packTokensTable[word] then
                            vocabMatches = vocabMatches + 1
                        end
                    end
                    -- For short messages (1-2 words), vocabulary match gives significant boost
                    if #wordTokens <= 2 and vocabMatches > 0 then
                        -- If ALL words are in vocabulary, give high confidence
                        if vocabMatches == #wordTokens then
                            score = math.max(score, 0.60) -- High confidence for vocabulary match
                        else
                            -- Partial match still helps
                            score = score + (vocabMatches / #wordTokens) * 0.3
                        end
                    elseif vocabMatches > 0 then
                        -- For longer messages, vocabulary match is a bonus
                        score = score + (vocabMatches / #wordTokens) * 0.2
                    end
                end
                
                scores[lang] = score
                vocabularyMatches[lang] = vocabMatches
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
    
    -- Special handling for short messages with vocabulary matches
    -- Lower threshold for single-word messages if word exists in vocabulary
    local effectiveThreshold = LanguageDetect.MIN_CONFIDENCE
    if #wordTokens == 1 and bestLang and vocabularyMatches[bestLang] and vocabularyMatches[bestLang] > 0 then
        effectiveThreshold = 0.20 -- Lower threshold for single-word vocabulary matches
    elseif #wordTokens == 2 and bestLang and vocabularyMatches[bestLang] and vocabularyMatches[bestLang] >= 1 then
        effectiveThreshold = 0.25 -- Slightly lower for 2-word messages
        -- Special case: If one word is a German vocabulary word (like "geil"), boost confidence
        if vocabularyMatches[bestLang] >= 1 then
            bestScore = math.max(bestScore, 0.35) -- Boost for German word in 2-word message
        end
    end
    
    -- Return nil if below threshold
    if bestScore < effectiveThreshold then
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
    -- Set LanguagePackManager reference for vocabulary-based detection
    LanguageDetect.LanguagePackManager = WDTS_LanguagePackManager
end

WDTS_LanguageDetect = LanguageDetect

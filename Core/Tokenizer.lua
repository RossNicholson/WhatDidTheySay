-- WhatDidTheySay - Tokenizer
-- Tokenisation and protection logic

local Utils = WDTS_Utils
local Tokenizer = {}

-- Token types
Tokenizer.TOKEN_TYPE = {
    WORD = "word",
    NUMBER = "number",
    PUNCTUATION = "punctuation",
    PROTECTED = "protected", -- Player names, links, etc.
}

-- Create a token object
local function CreateToken(type, value, original)
    return {
        type = type,
        value = value, -- normalized/processed value
        original = original or value, -- original unmodified value
    }
end

-- Extract all protected tokens and replace with placeholders
function Tokenizer.ExtractProtected(text)
    local protected = {}
    local protectedMap = {}
    local placeholderPattern = "|WDTS_PROTECTED_%d+|"
    local index = 1
    local processed = text
    
    -- Extract item links
    for link in processed:gmatch("|c%x+|Hitem:[^|]+|h[^|]*|h|r") do
        local placeholder = "|WDTS_PROTECTED_" .. index .. "|"
        protected[index] = { type = "item_link", value = link }
        protectedMap[placeholder] = link
        processed = processed:gsub(link:gsub("[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%0"), placeholder, 1)
        index = index + 1
    end
    
    -- Extract spell links
    for link in processed:gmatch("|c%x+|Hspell:[^|]+|h[^|]*|h|r") do
        local placeholder = "|WDTS_PROTECTED_" .. index .. "|"
        protected[index] = { type = "spell_link", value = link }
        protectedMap[placeholder] = link
        processed = processed:gsub(link:gsub("[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%0"), placeholder, 1)
        index = index + 1
    end
    
    -- Extract quest links
    for link in processed:gmatch("|c%x+|Hquest:[^|]+|h[^|]*|h|r") do
        local placeholder = "|WDTS_PROTECTED_" .. index .. "|"
        protected[index] = { type = "quest_link", value = link }
        protectedMap[placeholder] = link
        processed = processed:gsub(link:gsub("[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%0"), placeholder, 1)
        index = index + 1
    end
    
    -- Extract raid icons
    for icon in processed:gmatch("{rt[1-8]}") do
        local placeholder = "|WDTS_PROTECTED_" .. index .. "|"
        protected[index] = { type = "raid_icon", value = icon }
        protectedMap[placeholder] = icon
        processed = processed:gsub(icon, placeholder, 1)
        index = index + 1
    end
    
    return processed, protected, protectedMap
end

-- Restore protected tokens from placeholders
function Tokenizer.RestoreProtected(text, protectedMap)
    local restored = text
    for placeholder, original in pairs(protectedMap) do
        restored = restored:gsub(placeholder:gsub("[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%0"), original)
    end
    return restored
end

-- Tokenize message into structured tokens
function Tokenizer.Tokenize(text)
    local tokens = {}
    
    -- Extract protected content first
    local processed, protected, protectedMap = Tokenizer.ExtractProtected(text)
    
    -- Tokenize remaining text
    local words = Utils.SplitWords(processed)
    
    for _, word in ipairs(words) do
        -- Check if it's a protected placeholder
        if word:match("|WDTS_PROTECTED_%d+|") then
            table.insert(tokens, CreateToken(Tokenizer.TOKEN_TYPE.PROTECTED, word, word))
        -- Check if it's a number
        elseif Utils.IsNumber(word) then
            table.insert(tokens, CreateToken(Tokenizer.TOKEN_TYPE.NUMBER, word, word))
        -- Check if it's punctuation-only
        elseif word:match("^[%p]+$") then
            table.insert(tokens, CreateToken(Tokenizer.TOKEN_TYPE.PUNCTUATION, word, word))
        -- Otherwise it's a word
        else
            -- Remove trailing punctuation for analysis, but preserve original
            local clean = word:gsub("[%p]+$", "")
            local normalized = Utils.Normalize(clean)
            table.insert(tokens, CreateToken(Tokenizer.TOKEN_TYPE.WORD, normalized, word))
        end
    end
    
    return tokens, protected, protectedMap
end

-- Reconstruct text from tokens
function Tokenizer.Reconstruct(tokens)
    local parts = {}
    for _, token in ipairs(tokens) do
        table.insert(parts, token.original)
    end
    return table.concat(parts, " ")
end

WDTS_Tokenizer = Tokenizer

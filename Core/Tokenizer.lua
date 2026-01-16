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
    
    -- Extract simple item names in brackets [Item Name] (not WoW links, just bracket notation)
    -- BUT: Don't protect plain text in brackets - allow translation of German quest/item names
    -- Only protect if it looks like a game link (has |h|r) or is just a number/abbreviation
    for fullBracket in processed:gmatch("%[[^%]]+%]") do
        -- Check if this is a WoW link (has |h|r at the end) - always protect these
        if fullBracket:match("|h|r$") then
            local placeholder = "|WDTS_PROTECTED_" .. index .. "|"
            protected[index] = { type = "item_bracket", value = fullBracket }
            protectedMap[placeholder] = fullBracket
            -- Escape special characters for gsub
            local escaped = fullBracket:gsub("[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%0")
            processed = processed:gsub(escaped, placeholder, 1)
            index = index + 1
        -- Otherwise, allow translation of plain text in brackets (e.g., German quest names)
        -- This improves translation quality while still protecting actual game links
        end
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
    
    -- Pre-process: replace plain brackets [content] with placeholders to preserve structure
    -- This allows content inside brackets to be tokenized separately while preserving brackets
    local bracketMap = {}
    local bracketCounter = 0
    local processedForTokenize = processed
    
    -- Find all plain brackets (not already protected WoW links)
    for fullBracket in processedForTokenize:gmatch("%[[^%]]+%]") do
        -- Check it's not a protected placeholder
        if not fullBracket:match("|WDTS_PROTECTED_%d+|") then
            bracketCounter = bracketCounter + 1
            local placeholder = "|WDTS_BRACKET_" .. bracketCounter .. "|"
            bracketMap[placeholder] = fullBracket
            -- Escape for gsub
            local escaped = fullBracket:gsub("[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%0")
            processedForTokenize = processedForTokenize:gsub(escaped, placeholder, 1)
        end
    end
    
    -- Now tokenize the processed text
    local words = Utils.SplitWords(processedForTokenize)
    
    for _, word in ipairs(words) do
        -- Check if it's a bracket placeholder
        if word:match("|WDTS_BRACKET_%d+|") then
            local fullBracket = bracketMap[word]
            if fullBracket then
                -- Extract content inside brackets
                local content = fullBracket:match("^%[(.*)%]$")
                if content then
                    -- Recursively tokenize the bracket content
                    local contentTokens, _, _ = Tokenizer.Tokenize(content)
                    if #contentTokens > 0 then
                        -- Mark first token with opening bracket
                        contentTokens[1].hasOpenBracket = true
                        -- Mark last token with closing bracket  
                        contentTokens[#contentTokens].hasCloseBracket = true
                        -- Add all tokens from bracket content
                        for _, ct in ipairs(contentTokens) do
                            table.insert(tokens, ct)
                        end
                    else
                        -- Empty bracket
                        local emptyToken = CreateToken(Tokenizer.TOKEN_TYPE.PUNCTUATION, "[]", "[]")
                        emptyToken.hasOpenBracket = true
                        emptyToken.hasCloseBracket = true
                        table.insert(tokens, emptyToken)
                    end
                end
            end
        -- Check if it's a protected placeholder
        elseif word:match("|WDTS_PROTECTED_%d+|") then
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
-- Use token.value (translated) if present, otherwise token.original
-- Preserves bracket structure for translated content
function Tokenizer.Reconstruct(tokens)
    local parts = {}
    for i, token in ipairs(tokens) do
        -- Check if this token should have an opening bracket
        if token.hasOpenBracket then
            table.insert(parts, "[")
        end
        
        -- Use translated value if it exists and differs from original, otherwise use original
        -- This preserves punctuation and formatting while using translations
        if token.value and token.value ~= token.original then
            -- Use translated value for the text, but preserve original formatting for non-words
            if token.type == "word" then
                table.insert(parts, token.value)
            else
                table.insert(parts, token.original)
            end
        else
            table.insert(parts, token.original)
        end
        
        -- Check if this token should have a closing bracket
        if token.hasCloseBracket then
            table.insert(parts, "]")
        end
        
        -- Add space between tokens (except in special cases)
        if i < #tokens then
            local nextToken = tokens[i + 1]
            -- Add space before opening bracket (when preceded by a word, not punctuation)
            if nextToken and nextToken.hasOpenBracket and not token.hasOpenBracket then
                -- Only add space if current token is a word or number, not punctuation
                if token.type == "word" or token.type == "number" then
                    table.insert(parts, " ")
                end
            -- Don't add space before closing bracket or right after opening bracket
            elseif not (token.hasCloseBracket or (nextToken and nextToken.hasOpenBracket)) then
                -- Don't add space before punctuation that attaches (like comma, period, closing parens)
                local nextIsAttachingPunct = nextToken.type == "punctuation" and nextToken.original:match("^[,%.%!%?%)%]]$")
                -- Don't add space after opening punctuation (like opening parens, brackets)
                local currIsOpeningPunct = token.type == "punctuation" and (token.original:match("^[%(%[]$") or token.hasOpenBracket)
                if not (nextIsAttachingPunct or currIsOpeningPunct) then
                    table.insert(parts, " ")
                end
            end
        end
    end
    return table.concat(parts, "")
end

WDTS_Tokenizer = Tokenizer

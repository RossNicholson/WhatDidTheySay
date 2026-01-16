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
    
    -- Extract simple number brackets like [20] or [30+] as protected tokens
    -- These should be preserved as-is (not translated) to avoid breaking nested brackets
    -- Match [digits] or [digits+symbol] like [30+], [20-]
    for numBracket in processed:gmatch("%[%d+[%+%-]?%]") do
        local placeholder = "|WDTS_PROTECTED_" .. index .. "|"
        protected[index] = { type = "number_bracket", value = numBracket }
        protectedMap[placeholder] = numBracket
        local escaped = numBracket:gsub("[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%0")
        processed = processed:gsub(escaped, placeholder, 1)
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
    -- Handle nested brackets by matching from right to left (inside to outside)
    local bracketMap = {}
    local bracketCounter = 0
    local processedForTokenize = processed
    
    -- Note: Simple number brackets like [20] are already protected in ExtractProtected
    
    -- Find all plain brackets (not already protected WoW links or number brackets)
    -- Match brackets from right to left to handle nesting correctly
    local bracketPositions = {}
    local pos = 1
    while true do
        local start, finish = processedForTokenize:find("%[", pos)
        if not start then break end
        
        -- Find matching closing bracket by counting nesting
        local depth = 1
        local endPos = start + 1
        while depth > 0 and endPos <= #processedForTokenize do
            local char = processedForTokenize:sub(endPos, endPos)
            if char == "[" then
                depth = depth + 1
            elseif char == "]" then
                depth = depth - 1
            end
            if depth > 0 then
                endPos = endPos + 1
            end
        end
        
        if depth == 0 then
            local fullBracket = processedForTokenize:sub(start, endPos)
            -- Skip if it's a protected placeholder (number brackets are already protected)
            if not fullBracket:match("|WDTS_PROTECTED_%d+|") and not fullBracket:match("|WDTS_BRACKET_%d+|") then
                table.insert(bracketPositions, {start = start, finish = endPos, bracket = fullBracket})
            end
        end
        pos = start + 1
    end
    
    -- Replace brackets from right to left to avoid position shifts
    table.sort(bracketPositions, function(a, b) return a.start > b.start end)
    for _, bp in ipairs(bracketPositions) do
        local fullBracket = bp.bracket
        bracketCounter = bracketCounter + 1
        local placeholder = "|WDTS_BRACKET_" .. bracketCounter .. "|"
        bracketMap[placeholder] = fullBracket
        -- Escape for gsub
        local escaped = fullBracket:gsub("[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%0")
        -- Replace bracket with placeholder, but preserve text before/after bracket by adding spaces if needed
        -- This handles cases like "LFG[...]" -> "LFG |WDTS_BRACKET_X|"
        -- and adjacent brackets "(253)][[32+]" -> "(253)] |WDTS_BRACKET_X|"
        local beforeBracket = processedForTokenize:sub(1, bp.start - 1)
        local afterBracket = processedForTokenize:sub(bp.finish + 1)
        local spaceBefore = ""
        local spaceAfter = ""
        if beforeBracket ~= "" and not beforeBracket:match("%s$") then
            -- Add space before bracket placeholder to separate it from preceding text
            spaceBefore = " "
        end
        if afterBracket ~= "" and not afterBracket:match("^%s") then
            -- Add space after bracket placeholder if next char is not whitespace
            -- But only if it's not a closing bracket (adjacent brackets should have space)
            if not afterBracket:match("^%]") then
                spaceAfter = " "
            end
        end
        processedForTokenize = beforeBracket .. spaceBefore .. placeholder .. spaceAfter .. afterBracket
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
            -- Check if word contains hyphens (compound words like "Crushridge-Kriegstreiber")
            -- Split on hyphens to translate each part separately
            if word:find("-") and not word:match("^%-") and not word:match("%-$") then
                local parts = {}
                for part in word:gmatch("[^-]+") do
                    table.insert(parts, part)
                end
                if #parts > 1 then
                    -- Tokenize each part separately
                    for i, part in ipairs(parts) do
                        local clean = part:gsub("[%p]+$", "")
                        local normalized = Utils.Normalize(clean)
                        table.insert(tokens, CreateToken(Tokenizer.TOKEN_TYPE.WORD, normalized, part))
                        -- Add hyphen between parts (except after last part)
                        if i < #parts then
                            table.insert(tokens, CreateToken(Tokenizer.TOKEN_TYPE.PUNCTUATION, "-", "-"))
                        end
                    end
                else
                    -- Single word (no hyphens or only at edges)
                    local clean = word:gsub("[%p]+$", "")
                    local normalized = Utils.Normalize(clean)
                    table.insert(tokens, CreateToken(Tokenizer.TOKEN_TYPE.WORD, normalized, word))
                end
            else
                -- Remove trailing punctuation for analysis, but preserve original
                local clean = word:gsub("[%p]+$", "")
                local normalized = Utils.Normalize(clean)
                table.insert(tokens, CreateToken(Tokenizer.TOKEN_TYPE.WORD, normalized, word))
            end
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
        -- Special case: if token has closing bracket, preserve original to keep trailing punctuation
        -- But strip the closing bracket if it's already in original (to avoid duplication)
        if token.hasCloseBracket and token.original then
            -- Use original to preserve closing punctuation before the bracket
            -- But remove trailing ] if present (we'll add it separately)
            local original = token.original:gsub("%]+$", "")
            table.insert(parts, original)
        elseif token.value and token.value ~= token.original then
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
                -- Don't add space around hyphens (compound words)
                local currIsHyphen = token.type == "punctuation" and token.original == "-"
                local nextIsHyphen = nextToken.type == "punctuation" and nextToken.original == "-"
                if not (nextIsAttachingPunct or currIsOpeningPunct or currIsHyphen or nextIsHyphen) then
                    table.insert(parts, " ")
                end
            end
        end
    end
    return table.concat(parts, "")
end

WDTS_Tokenizer = Tokenizer

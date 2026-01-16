-- WhatDidTheySay - Core Utilities
-- Shared helper functions

local Utils = {}

-- Split string by whitespace, preserving order
function Utils.SplitWords(text)
    local words = {}
    for word in text:gmatch("%S+") do
        table.insert(words, word)
    end
    return words
end

-- Normalize text for comparison (lowercase, trim)
function Utils.Normalize(text)
    return text:lower():gsub("^%s+", ""):gsub("%s+$", "")
end

-- Check if string contains only ASCII characters
function Utils.IsASCII(text)
    return not text:match("[^\x00-\x7F]")
end

-- Count occurrences of pattern in text
function Utils.CountPattern(text, pattern)
    local count = 0
    for _ in text:gmatch(pattern) do
        count = count + 1
    end
    return count
end

-- Check if string is a number
function Utils.IsNumber(str)
    return tonumber(str) ~= nil
end

-- Check if string looks like a player name (WoW name format)
function Utils.IsPlayerName(str)
    -- WoW names: 2-12 characters, alphanumeric, some special chars allowed
    return str:match("^[A-Za-z][A-Za-z0-9]*$") ~= nil and #str >= 2 and #str <= 12
end

-- Extract item links from text (returns table of link strings)
function Utils.ExtractItemLinks(text)
    local links = {}
    for link in text:gmatch("|c%x+|Hitem:[^|]+|h[^|]*|h|r") do
        table.insert(links, link)
    end
    return links
end

-- Extract spell links from text
function Utils.ExtractSpellLinks(text)
    local links = {}
    for link in text:gmatch("|c%x+|Hspell:[^|]+|h[^|]*|h|r") do
        table.insert(links, link)
    end
    return links
end

-- Extract quest links from text
function Utils.ExtractQuestLinks(text)
    local links = {}
    for link in text:gmatch("|c%x+|Hquest:[^|]+|h[^|]*|h|r") do
        table.insert(links, link)
    end
    return links
end

-- Extract raid icons from text
function Utils.ExtractRaidIcons(text)
    local icons = {}
    for icon in text:gmatch("{rt[1-8]}") do
        table.insert(icons, icon)
    end
    return icons
end

-- Safely clamp value between min and max
function Utils.Clamp(value, min, max)
    if value < min then return min end
    if value > max then return max end
    return value
end

-- Get table length (safe for sparse arrays)
function Utils.TableLength(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end

WDTS_Utils = Utils

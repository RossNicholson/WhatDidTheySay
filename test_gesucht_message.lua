#!/usr/bin/env lua5.1
-- Test script for "Ifm [[18] GESUCHT: Gurgelbacke! (4740)]" message

local function loadAll()
    _G = _G or {}
    _G.WhatDidTheySayDB = { enabledLanguagePacks = { de = true } }
    _G.GetTime = function() return os.time() end
    _G.GetChannelList = function() return end
    _G.IsInRaid = function() return false end
    _G.select = select
    
    local function loadFile(path)
        local file = io.open(path, "r")
        local content = file:read("*all")
        file:close()
        local func = loadstring(content, path)
        setfenv(func, _G)
        func()
    end
    
    loadFile("Core/Utils.lua")
    loadFile("Core/Tokenizer.lua")
    loadFile("Core/LanguageDetect.lua")
    loadFile("Core/Confidence.lua")
    loadFile("Core/LanguagePackManager.lua")
    loadFile("Core/Engine.lua")
    loadFile("Languages/de/tokens.lua")
    loadFile("Languages/de/intents.lua")
    loadFile("Languages/de/patterns.lua")
    loadFile("Languages/de/grammar.lua")
    loadFile("Languages/de/phrases.lua")
    
    WDTS_LanguagePackManager.Initialize()
    WDTS_Engine.Initialize()
end

loadAll()

-- Test message
local message = "Ifm [[18] GESUCHT: Gurgelbacke! (4740)]"

print("Testing message: " .. message)
print("---")

local translated, confidence, reason = WDTS_Engine.Translate(message, "de", "en", true)

print("Translation: " .. (translated or "nil"))
print("Confidence: " .. (confidence or "nil"))
print("Reason: " .. (reason or "nil"))
print("---")

-- Expected: "LFM [[18] WANTED: Gurgelbacke! (4740)]" (preserves original bracket structure)
-- The key is that "GESUCHT" should be translated to "WANTED" (uppercase with colon)
local expected = "LFM [[18] WANTED: Gurgelbacke! (4740)]"
print("Expected: " .. expected)
print("Match: " .. (translated == expected and "YES" or "NO"))

#!/usr/bin/env lua5.1
-- Test script for "freue mich so sehr auf dungeon, endlich kein speed-run ich pull die ganze ini mehr" message

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

-- Test message 1
local message1 = "freue mich so sehr auf dungeon, endlich kein speed-run ich pull die ganze ini mehr"

print("Testing message 1: " .. message1)
print("---")

local translated1, confidence1, reason1 = WDTS_Engine.Translate(message1, "de", "en", true)

print("Translation: " .. (translated1 or "nil"))
print("Confidence: " .. (confidence1 or "nil"))
print("Reason: " .. (reason1 or "nil"))
print("---")

-- Expected: "I'm so excited about dungeon, finally no speed-run I'll pull the whole instance anymore"
local expected1 = "I'm so excited about dungeon, finally no speed-run I'll pull the whole instance anymore"
print("Expected: " .. expected1)
print("Match: " .. (translated1 == expected1 and "YES" or "NO"))
print("\n")

-- Test message 2
local message2 = "noch jmd hilfe bei elite-quest rund um sturmwind/ironforge?"

print("Testing message 2: " .. message2)
print("---")

local translated2, confidence2, reason2 = WDTS_Engine.Translate(message2, "de", "en", true)

print("Translation: " .. (translated2 or "nil"))
print("Confidence: " .. (confidence2 or "nil"))
print("Reason: " .. (reason2 or "nil"))
print("---")

-- Expected: "does anyone still need help with elite quest around Stormwind/Ironforge?"
local expected2 = "does anyone still need help with elite quest around Stormwind/Ironforge?"
print("Expected: " .. expected2)
print("Match: " .. (translated2 == expected2 and "YES" or "NO"))

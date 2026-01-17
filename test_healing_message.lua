#!/usr/bin/env lua5.1
-- Test for healing message: "weiß nicht ob wir das zu zweit schaffen. aber ich kann heilen :) bin diszi"

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
    if io.open("Languages/de/phrases.lua") then
        loadFile("Languages/de/phrases.lua")
    end
end

loadAll()

-- Test message
local testMessage = "weiß nicht ob wir das zu zweit schaffen. aber ich kann heilen :) bin diszi"
print("=" .. string.rep("=", 70))
print("Test: " .. testMessage)
print("=" .. string.rep("=", 70))

local translated, confidence, reason = WDTS_Engine.Translate(testMessage, nil, "en", true)
if translated then
    print("✓ Translation: " .. translated)
    print("  Confidence: " .. string.format("%.2f", confidence))
    if reason then
        print("  Reason: " .. reason)
    end
else
    print("✗ No translation")
    print("  Confidence: " .. string.format("%.2f", confidence or 0))
    if reason then
        print("  Reason: " .. reason)
    end
end

print("")
print("Expected: 'don't know if we can manage that with just the two of us. but I can heal :) I'm disc'")
print("=" .. string.rep("=", 70))

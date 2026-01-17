#!/usr/bin/env lua5.1
-- Test script for mixed-language detection fixes
-- Tests that English messages aren't translated and mixed messages are handled correctly

-- Mock WoW API
_G = _G or {}
_G.WhatDidTheySayDB = {
    enabledLanguagePacks = { de = true },
}

_G.GetTime = function() return os.time() end
_G.GetChannelList = function() return end
_G.IsInRaid = function() return false end
_G.select = select

-- Load files
local function loadFile(path)
    local file = io.open(path, "r")
    if not file then
        error("Could not open: " .. path)
    end
    local content = file:read("*all")
    file:close()
    local func = loadstring(content, path)
    if not func then
        error("Error compiling: " .. path)
    end
    setfenv(func, _G)
    func()
end

-- Load in order
loadFile("Core/Utils.lua")
loadFile("Core/Tokenizer.lua")
loadFile("Core/LanguageDetect.lua")
loadFile("Core/Confidence.lua")
loadFile("Core/LanguagePackManager.lua")
loadFile("Core/Engine.lua")
loadFile("Languages/de/metadata.lua")
loadFile("Languages/de/tokens.lua")
loadFile("Languages/de/intents.lua")
loadFile("Languages/de/patterns.lua")
loadFile("Languages/de/grammar.lua")
loadFile("Languages/de/phrases.lua")

WDTS_Engine.Initialize()

print("=" .. string.rep("=", 70))
print("Testing Mixed-Language Detection Fixes")
print("=" .. string.rep("=", 70))
print()

local testCases = {
    -- Test 1: Pure English should NOT translate
    {
        message = "LF ENCHANT",
        shouldTranslate = false,
        expectedReason = "already_english",
        description = "Pure English gaming terms should not translate"
    },
    {
        message = "lf enchant",
        shouldTranslate = false,
        expectedReason = "already_english",
        description = "Pure English gaming terms (lowercase) should not translate"
    },
    {
        message = "LF1M tank",
        shouldTranslate = false,
        expectedReason = "already_english",
        description = "Pure English LFG message should not translate"
    },
    
    -- Test 2: Mixed language SHOULD translate
    {
        message = "wtb essence der verbannung",
        shouldTranslate = true,
        expectedReason = nil,
        description = "Mixed English/German should translate German parts"
    },
    {
        message = "lfm für stockades",
        shouldTranslate = true,
        expectedReason = nil,
        description = "Mixed LFG with German preposition should translate"
    },
    
    -- Test 3: Pure German SHOULD translate
    {
        message = "suche verzauberer",
        shouldTranslate = true,
        expectedReason = nil,
        description = "Pure German should translate"
    },
    {
        message = "brauche tank für dm",
        shouldTranslate = true,
        expectedReason = nil,
        description = "German LFG message should translate"
    },
}

local passed = 0
local failed = 0

for i, test in ipairs(testCases) do
    print(string.format("Test %d: %s", i, test.description))
    print(string.format("  Message: '%s'", test.message))
    
    local translated, confidence, intent = WDTS_Engine.Translate(test.message, nil, "en", true)
    
    local didTranslate = (translated ~= nil and confidence > 0)
    local correct = (didTranslate == test.shouldTranslate)
    
    if test.expectedReason then
        correct = correct and (intent == test.expectedReason)
    end
    
    if correct then
        passed = passed + 1
        print(string.format("  ✓ PASS - Translated: %s, Confidence: %.2f, Intent: %s", 
            tostring(didTranslate), confidence or 0, intent or "nil"))
        if translated then
            print(string.format("  Translation: '%s'", translated))
        end
    else
        failed = failed + 1
        print(string.format("  ✗ FAIL - Expected translate: %s, Got: %s", 
            tostring(test.shouldTranslate), tostring(didTranslate)))
        print(string.format("  Confidence: %.2f, Intent: %s", confidence or 0, intent or "nil"))
        if translated then
            print(string.format("  Translation: '%s'", translated))
        end
        if test.expectedReason and intent ~= test.expectedReason then
            print(string.format("  Expected intent: %s, Got: %s", test.expectedReason, intent or "nil"))
        end
    end
    print()
end

print("=" .. string.rep("=", 70))
print(string.format("Results: %d passed, %d failed", passed, failed))
print("=" .. string.rep("=", 70))

if failed > 0 then
    os.exit(1)
end

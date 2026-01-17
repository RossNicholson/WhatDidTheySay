#!/usr/bin/env lua5.1
-- Test script for German Morphology improvements

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
loadFile("Core/GermanMorphology.lua")
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

WDTS_Engine.Initialize()

-- Test cases for morphology improvements
local testCases = {
    {
        name = "Past tense verbs",
        message = "ich sagte gestern dass ich es gemacht habe",
        expected = "I said yesterday that I did it",
    },
    {
        name = "Past participles",
        message = "habe gesagt dass ich es gesehen habe",
        expected = "I said that I saw it",
    },
    {
        name = "Modal verbs with past tense",
        message = "ich wollte kommen aber konnte nicht",
        expected = "I wanted to come but couldn't",
    },
    {
        name = "Past participle with sein",
        message = "bin gekommen und habe es gefunden",
        expected = "I came and found it",
    },
    {
        name = "Complex past tense",
        message = "ich glaubte dass du es gehabt hast",
        expected = "I thought that you had it",
    },
}

print("=== Testing German Morphology Improvements ===\n")

local passed = 0
local failed = 0

for i, test in ipairs(testCases) do
    print(string.format("Test %d: %s", i, test.name))
    print(string.format("  Input: %s", test.message))
    
    local result = WDTS_Engine.Translate(test.message, "GUILD")
    
    if result then
        print(string.format("  Output: %s (confidence: %.2f)", result.text, result.confidence))
        if test.expected then
            -- Simple check if expected words appear
            local match = false
            local expectedWords = {}
            for word in test.expected:gmatch("%S+") do
                table.insert(expectedWords, word:lower())
            end
            local resultLower = result.text:lower()
            local foundCount = 0
            for _, word in ipairs(expectedWords) do
                if resultLower:match(word) then
                    foundCount = foundCount + 1
                end
            end
            if foundCount >= #expectedWords * 0.7 then -- 70% word match
                print("  ✅ PASS")
                passed = passed + 1
            else
                print(string.format("  ❌ FAIL (expected words: %s)", test.expected))
                failed = failed + 1
            end
        else
            print("  ⚠️  No expected value")
        end
    else
        print("  ❌ FAIL (no translation)")
        failed = failed + 1
    end
    print()
end

print(string.format("\n=== Results: %d passed, %d failed ===", passed, failed))

#!/usr/bin/env lua5.1
-- Test Chunk 5: Integration Test - Dependency Parsing in Translation Pipeline

_G = _G or {}
_G.GetTime = function() return os.time() end

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

-- Initialize required globals for WoW addon environment
_G.WhatDidTheySayDB = {
    channels = {},
    autoTranslate = true,
    showOriginal = true,
    minConfidence = 0.70,
    firstRun = false,
    showTranslationIndicator = "color",
    enabledLanguagePacks = {de = true},
}

-- Load all required modules
loadFile("Core/Utils.lua")
loadFile("Core/Tokenizer.lua")
loadFile("Core/LanguageDetect.lua")
loadFile("Core/Confidence.lua")
loadFile("Core/LanguagePackManager.lua")
loadFile("Core/GermanMorphology.lua")
loadFile("Core/DependencyParser.lua")
loadFile("Languages/de/metadata.lua")
loadFile("Languages/de/tokens.lua")
loadFile("Languages/de/phrases.lua")
loadFile("Languages/de/patterns.lua")
loadFile("Languages/de/grammar.lua")
loadFile("Core/Engine.lua")

print("=" .. string.rep("=", 80))
print("Chunk 5 Test: Dependency Parsing Integration")
print("Testing structure-based translation for simple German sentences")
print("=" .. string.rep("=", 80))
print()

local Engine = WDTS_Engine
Engine.Initialize()

-- Test cases: Simple German sentences that should benefit from dependency parsing
local testCases = {
    {
        input = "Ich gehe nach Stormwind",
        expected = "I go to Stormwind",
        description = "Simple sentence with prepositional phrase",
    },
    {
        input = "Ich sehe dich",
        expected = "I see you",
        description = "Simple sentence with direct object",
    },
    {
        input = "Der Mann geht",
        expected = "The man goes",
        description = "Noun phrase subject",
    },
    {
        input = "Ich gebe dir Geld",
        expected = "I give you money",
        description = "Sentence with indirect object",
    },
}

local passed = 0
local failed = 0

for i, test in ipairs(testCases) do
    print(string.format("Test %d: %s", i, test.description))
    print(string.format("  Input:    '%s'", test.input))
    print(string.format("  Expected: '%s'", test.expected))
    
    local translated, confidence, intent = Engine.Translate(test.input, "de", "en", true)
    
    if translated then
        -- Clean up translation for comparison (remove color codes, normalize whitespace)
        local cleaned = translated:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
        local expectedCleaned = test.expected:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
        
        print(string.format("  Got:      '%s' (confidence: %.2f)", cleaned, confidence))
        
        -- Simple word-by-word comparison (order matters for dependency parsing)
        local expectedWords = {}
        for word in expectedCleaned:gmatch("%S+") do
            table.insert(expectedWords, word:lower())
        end
        local gotWords = {}
        for word in cleaned:gmatch("%S+") do
            table.insert(gotWords, word:lower())
        end
        
        local matches = 0
        for j, expectedWord in ipairs(expectedWords) do
            if gotWords[j] == expectedWord then
                matches = matches + 1
            end
        end
        
        if matches == #expectedWords and #gotWords == #expectedWords then
            print("  ✓ PASSED - Word order and words match")
            passed = passed + 1
        else
            print(string.format("  ✗ FAILED - Only %d/%d words match in correct order", matches, #expectedWords))
            if #gotWords ~= #expectedWords then
                print(string.format("    (Word count mismatch: got %d, expected %d)", #gotWords, #expectedWords))
            end
            failed = failed + 1
        end
    else
        print(string.format("  ✗ FAILED - No translation (intent: %s)", intent or "unknown"))
        failed = failed + 1
    end
    
    print()
end

print("=" .. string.rep("=", 80))
print(string.format("Results: %d passed, %d failed", passed, failed))
print("=" .. string.rep("=", 80))

if failed == 0 then
    print("✓ All tests passed!")
else
    print("✗ Some tests failed")
end

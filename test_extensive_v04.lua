#!/usr/bin/env lua5.1
-- Extensive test suite for v0.4.0 - Properly tests all fixes

-- Mock WoW API
_G = _G or {}
_G.WhatDidTheySayDB = {
    enabledLanguagePacks = { de = true },
    enabledLanguages = { de = true },
    channels = {
        WHISPER = true,
        SAY = true,
        PARTY = true,
        RAID = true,
        GENERAL = true,
        TRADE = true,
        WORLD = true,
        LFG = true,
        GUILD = true,
    },
    autoTranslate = true,
    showOriginal = true,
    minConfidence = 0.30,
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

print("Loading addon modules...")
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

-- Test cases organized by category
local testCategories = {
    basic = {
        name = "Basic Vocabulary",
        tests = {
            { input = "hallo", expected = "hello", minConfidence = 0.5 },
            { input = "danke", expected = "thanks", minConfidence = 0.5 },
            { input = "ja", expected = "yes", minConfidence = 0.5 },
            { input = "nein", expected = "no", minConfidence = 0.5 },
            { input = "bitte", expected = "please", minConfidence = 0.5 },
        }
    },
    pronouns_verbs = {
        name = "Pronouns & Basic Verbs",
        tests = {
            { input = "ich kann", expected = "I can", minConfidence = 0.5 },
            { input = "ich bin", expected = "I am", minConfidence = 0.5 },
            { input = "ich habe", expected = "I have", minConfidence = 0.5 },
            { input = "du bist", expected = "you are", minConfidence = 0.5 },
            { input = "er ist", expected = "he is", minConfidence = 0.5 },
        }
    },
    modal_verbs = {
        name = "Modal Verbs",
        tests = {
            { input = "ich kann", expected = "I can", minConfidence = 0.5 },
            { input = "ich könnte", expected = "I could", minConfidence = 0.5 },
            { input = "ich will", expected = "I want", minConfidence = 0.5 },
            { input = "ich wollte", expected = "I wanted", minConfidence = 0.5 },
            { input = "ich sollte", expected = "I should", minConfidence = 0.5 },
            { input = "ich muss", expected = "I must", minConfidence = 0.5 },
            { input = "ich möchte", expected = "I would like", minConfidence = 0.5 },
        }
    },
    past_tense = {
        name = "Past Tense",
        tests = {
            { input = "ich sagte", expected = "I said", minConfidence = 0.5 },
            { input = "ich machte", expected = "I made", minConfidence = 0.5 },
            { input = "ich hatte", expected = "I had", minConfidence = 0.5 },
            { input = "ich war", expected = "I was", minConfidence = 0.5 },
        }
    },
    past_participle = {
        name = "Past Participles",
        tests = {
            { input = "habe gesagt", expected = "I said", minConfidence = 0.5 },
            { input = "habe gemacht", expected = "I did", minConfidence = 0.5 },
            { input = "bin gekommen", expected = "I came", minConfidence = 0.5 },
            { input = "bin gegangen", expected = "I went", minConfidence = 0.5 },
        }
    },
    common_phrases = {
        name = "Common Phrases",
        tests = {
            { input = "ich glaube", expected = "I think", minConfidence = 0.5 },
            { input = "komme gleich", expected = "coming soon", minConfidence = 0.5 },
            { input = "bin unterwegs", expected = "on my way", minConfidence = 0.5 },
        }
    },
    separable_verbs = {
        name = "Separable Verbs",
        tests = {
            { input = "macht auf", expected = "opens", minConfidence = 0.5 },
            { input = "macht zu", expected = "closes", minConfidence = 0.5 },
        }
    },
    wow_terms = {
        name = "WoW Terms",
        tests = {
            { input = "suche tank", expected = "looking tank", minConfidence = 0.5 },
            { input = "wer will bfd", expected = "who wants BFD", minConfidence = 0.5 },
        }
    },
    questions = {
        name = "Questions",
        tests = {
            { input = "was machst du", expected = "what are you doing", minConfidence = 0.5 },
            { input = "wo bist du", expected = "where are you", minConfidence = 0.5 },
        }
    },
}

-- Run tests
local totalTests = 0
local passedTests = 0
local failedTests = 0
local failures = {}

print("\n" .. string.rep("=", 70))
print("EXTENSIVE TEST SUITE FOR v0.4.0")
print(string.rep("=", 70) .. "\n")

for categoryName, category in pairs(testCategories) do
    print(string.format("--- %s ---", category.name))
    
    for i, test in ipairs(category.tests) do
        totalTests = totalTests + 1
        
        local translated, confidence, intent = WDTS_Engine.Translate(test.input, nil, "en")
        local passed = false
        local reason = ""
        
        if not translated then
            reason = string.format("No translation (intent: %s)", intent or "unknown")
        elseif confidence < (test.minConfidence or 0.30) then
            reason = string.format("Low confidence: %.2f < %.2f", confidence, test.minConfidence or 0.30)
        else
            -- Check if translation matches expected (flexible matching)
            local transLower = translated:lower()
            local expectedLower = test.expected:lower()
            
            -- Check if all key words from expected appear in translation
            local expectedWords = {}
            for word in expectedLower:gmatch("%S+") do
                table.insert(expectedWords, word)
            end
            
            local foundCount = 0
            for _, word in ipairs(expectedWords) do
                if transLower:match(word) then
                    foundCount = foundCount + 1
                end
            end
            
            if foundCount >= #expectedWords * 0.7 then -- 70% word match
                passed = true
            else
                reason = string.format("Word match: %d/%d (expected: '%s')", foundCount, #expectedWords, test.expected)
            end
        end
        
        if passed then
            passedTests = passedTests + 1
            print(string.format("  ✓ [%s] -> [%s] (conf: %.2f)", 
                test.input, translated, confidence))
        else
            failedTests = failedTests + 1
            print(string.format("  ✗ [%s] -> [%s] (conf: %.2f) - %s", 
                test.input, translated or "NO TRANSLATION", confidence or 0, reason))
            table.insert(failures, {
                category = category.name,
                input = test.input,
                output = translated or "NO TRANSLATION",
                expected = test.expected,
                confidence = confidence or 0,
                intent = intent,
                reason = reason,
            })
        end
    end
    print()
end

-- Summary
print(string.rep("=", 70))
print("TEST SUMMARY")
print(string.rep("=", 70))
print(string.format("Total Tests: %d", totalTests))
print(string.format("Passed: %d (%.1f%%)", passedTests, (passedTests / totalTests) * 100))
print(string.format("Failed: %d (%.1f%%)", failedTests, (failedTests / totalTests) * 100))

if #failures > 0 then
    print("\n" .. string.rep("=", 70))
    print("FAILED TESTS:")
    print(string.rep("=", 70))
    
    -- Group by category
    local byCategory = {}
    for _, failure in ipairs(failures) do
        if not byCategory[failure.category] then
            byCategory[failure.category] = {}
        end
        table.insert(byCategory[failure.category], failure)
    end
    
    for category, categoryFailures in pairs(byCategory) do
        print(string.format("\n[%s] - %d failure(s):", category, #categoryFailures))
        for _, failure in ipairs(categoryFailures) do
            print(string.format("  ✗ '%s'", failure.input))
            print(string.format("    Expected: '%s'", failure.expected))
            print(string.format("    Got:      '%s' (conf: %.2f, intent: %s)", 
                failure.output, failure.confidence, failure.intent or "nil"))
            print(string.format("    Reason:   %s", failure.reason))
        end
    end
end

print("\n" .. string.rep("=", 70))

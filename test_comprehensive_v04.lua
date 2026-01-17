#!/usr/bin/env lua5.1
-- Comprehensive test suite for v0.4.0 improvements
-- Tests vocabulary, morphology, phrases, grammar, and edge cases

-- Mock WoW API
_G = _G or {}
_G.WhatDidTheySayDB = {
    enabledLanguagePacks = { de = true },
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

-- Comprehensive test cases
local testCategories = {
    basic = {
        name = "Basic Vocabulary",
        tests = {
            { input = "hallo", expectedWords = {"hello", "hi"} },
            { input = "danke", expectedWords = {"thanks", "thank"} },
            { input = "ja", expectedWords = {"yes"} },
            { input = "nein", expectedWords = {"no"} },
            { input = "bitte", expectedWords = {"please"} },
        }
    },
    past_tense = {
        name = "Past Tense Verbs",
        tests = {
            { input = "ich sagte", expectedWords = {"I", "said"} },
            { input = "ich machte", expectedWords = {"I", "made", "did"} },
            { input = "ich glaubte", expectedWords = {"I", "thought", "believed"} },
            { input = "ich hatte", expectedWords = {"I", "had"} },
            { input = "du sagtest", expectedWords = {"you", "said"} },
            { input = "er machte", expectedWords = {"he", "made", "did"} },
        }
    },
    past_participle = {
        name = "Past Participles",
        tests = {
            { input = "habe gesagt", expectedWords = {"I", "said"} },
            { input = "habe gemacht", expectedWords = {"I", "did", "made"} },
            { input = "habe gesehen", expectedWords = {"I", "saw", "seen"} },
            { input = "bin gekommen", expectedWords = {"I", "came", "come"} },
            { input = "bin gegangen", expectedWords = {"I", "went", "gone"} },
            { input = "habe gehabt", expectedWords = {"I", "had"} },
        }
    },
    modal_verbs = {
        name = "Modal Verbs",
        tests = {
            { input = "ich kann", expectedWords = {"I", "can"} },
            { input = "ich könnte", expectedWords = {"I", "could"} },
            { input = "ich will", expectedWords = {"I", "want"} },
            { input = "ich wollte", expectedWords = {"I", "wanted"} },
            { input = "ich sollte", expectedWords = {"I", "should"} },
            { input = "ich muss", expectedWords = {"I", "must"} },
            { input = "ich müsste", expectedWords = {"I", "must", "would"} },
            { input = "ich möchte", expectedWords = {"I", "would", "like"} },
        }
    },
    separable_verbs = {
        name = "Separable Verbs",
        tests = {
            { input = "macht auf", expectedWords = {"opens", "open"} },
            { input = "macht zu", expectedWords = {"closes", "close"} },
            { input = "kommt an", expectedWords = {"arrives", "arrive"} },
            { input = "geht weg", expectedWords = {"goes", "away"} },
            { input = "läuft los", expectedWords = {"runs", "away", "starts"} },
        }
    },
    common_phrases = {
        name = "Common Phrases",
        tests = {
            { input = "kannst du mir helfen", expectedWords = {"can", "you", "help", "me"} },
            { input = "ich glaube", expectedWords = {"I", "think"} },
            { input = "weiss nicht", expectedWords = {"don't", "know"} },
            { input = "komme gleich", expectedWords = {"coming", "soon"} },
            { input = "bin unterwegs", expectedWords = {"on", "my", "way"} },
        }
    },
    wow_terms = {
        name = "WoW Terms",
        tests = {
            { input = "ich brauche einen tank", expectedWords = {"I", "need", "tank"} },
            { input = "wir gehen in bfd", expectedWords = {"we", "going", "BFD"} },
            { input = "suche heiler", expectedWords = {"looking", "healer"} },
            { input = "wer will in dungeon", expectedWords = {"who", "wants", "dungeon"} },
            { input = "ich bin level 60", expectedWords = {"I", "am", "level", "60"} },
        }
    },
    pronouns_dative = {
        name = "Dative Pronouns",
        tests = {
            { input = "gib mir", expectedWords = {"give", "me"} },
            { input = "gib dir", expectedWords = {"give", "you"} },
            { input = "gib ihm", expectedWords = {"give", "him", "it"} },
            { input = "gib uns", expectedWords = {"give", "us"} },
            { input = "gib euch", expectedWords = {"give", "you"} },
        }
    },
    complex_sentences = {
        name = "Complex Sentences",
        tests = {
            { input = "ich sagte gestern dass ich es gemacht habe", expectedWords = {"I", "said", "yesterday", "that", "I", "did", "made"} },
            { input = "ich glaube dass du recht hast", expectedWords = {"I", "think", "that", "you", "right"} },
            { input = "kannst du mir helfen weil ich nicht weiss", expectedWords = {"can", "you", "help", "me", "because", "I", "don't", "know"} },
        }
    },
    questions = {
        name = "Questions",
        tests = {
            { input = "was machst du", expectedWords = {"what", "are", "you", "doing"} },
            { input = "wie geht es dir", expectedWords = {"how", "are", "you"} },
            { input = "wo bist du", expectedWords = {"where", "are", "you"} },
            { input = "warum nicht", expectedWords = {"why", "not"} },
        }
    },
    slang_colloquial = {
        name = "Slang & Colloquial",
        tests = {
            { input = "kannste", expectedWords = {"can", "you"} },
            { input = "habe nix", expectedWords = {"I", "have", "nothing"} },
            { input = "is ja", expectedWords = {"is", "yes", "sure"} },
            { input = "geht nicht", expectedWords = {"doesn't", "work", "can't"} },
        }
    },
}

-- Run tests
local totalTests = 0
local passedTests = 0
local failedTests = 0
local failures = {}

print("\n=== Comprehensive Test Suite for v0.4.0 ===\n")

for categoryName, category in pairs(testCategories) do
    print(string.format("\n--- %s ---", category.name))
    
    for i, test in ipairs(category.tests) do
        totalTests = totalTests + 1
        
        local result = WDTS_Engine.Translate(test.input, "GUILD")
        local passed = false
        local reason = ""
        
        if not result then
            reason = "No translation returned"
        elseif result.confidence and result.confidence < 0.30 then
            reason = string.format("Low confidence: %.2f", result.confidence)
        elseif not result.text then
            reason = "No text in result"
        else
            -- Check if expected words appear in translation
            local resultLower = result.text:lower()
            local foundCount = 0
            local missingWords = {}
            
            for _, word in ipairs(test.expectedWords) do
                local wordLower = word:lower()
                -- Try exact match or as part of a word
                if resultLower:match(wordLower) or resultLower:match("%f[%a]" .. wordLower:gsub("[%-%[%]]", "%%%1") .. "%f[^%a]") then
                    foundCount = foundCount + 1
                else
                    table.insert(missingWords, word)
                end
            end
            
            local matchRatio = foundCount / #test.expectedWords
            if matchRatio >= 0.7 then -- 70% of expected words found
                passed = true
            else
                reason = string.format("Missing words: %s (found %d/%d, confidence: %.2f)", 
                    table.concat(missingWords, ", "), foundCount, #test.expectedWords, result.confidence or 0)
            end
        end
        
        if passed then
            passedTests = passedTests + 1
            print(string.format("  ✓ [%s] -> %s (conf: %.2f)", test.input, translated or "N/A", confidence or 0))
        else
            failedTests = failedTests + 1
            local output = translated or "NO TRANSLATION"
            local conf = confidence or 0
            print(string.format("  ✗ [%s] -> %s (conf: %.2f) - %s", test.input, output, conf, reason))
            table.insert(failures, {
                category = category.name,
                input = test.input,
                output = output,
                confidence = conf,
                reason = reason,
                expected = test.expectedWords,
                intent = intent,
            })
        end
    end
end

-- Summary
print("\n" .. string.rep("=", 60))
print(string.format("\nTEST SUMMARY"))
print(string.rep("=", 60))
print(string.format("Total Tests: %d", totalTests))
print(string.format("Passed: %d (%.1f%%)", passedTests, (passedTests / totalTests) * 100))
print(string.format("Failed: %d (%.1f%%)", failedTests, (failedTests / totalTests) * 100))

if #failures > 0 then
    print("\n" .. string.rep("=", 60))
    print("FAILED TESTS BY CATEGORY:")
    print(string.rep("=", 60))
    
    local byCategory = {}
    for _, failure in ipairs(failures) do
        if not byCategory[failure.category] then
            byCategory[failure.category] = {}
        end
        table.insert(byCategory[failure.category], failure)
    end
    
    for category, categoryFailures in pairs(byCategory) do
        print(string.format("\n[%s] - %d failures", category, #categoryFailures))
        for _, failure in ipairs(categoryFailures) do
            print(string.format("  ✗ '%s' -> '%s' (conf: %.2f)", 
                failure.input, failure.output, failure.confidence))
            print(string.format("    Expected: %s", table.concat(failure.expected, ", ")))
            print(string.format("    Reason: %s", failure.reason))
        end
    end
end

print("\n" .. string.rep("=", 60))

#!/usr/bin/env lua5.1
-- Comprehensive translation test suite
-- Tests various German phrases to identify failures and low-confidence translations

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

print("Loading addon modules...")
loadFile("Core/Utils.lua")
loadFile("Core/Tokenizer.lua")
loadFile("Core/LanguageDetect.lua")
loadFile("Core/Confidence.lua")
loadFile("Core/LanguagePackManager.lua")
loadFile("Core/GermanMorphology.lua")
loadFile("Core/DependencyParser.lua")
loadFile("Core/Engine.lua")
loadFile("Languages/de/metadata.lua")
loadFile("Languages/de/tokens.lua")
loadFile("Languages/de/intents.lua")
loadFile("Languages/de/patterns.lua")
loadFile("Languages/de/grammar.lua")
loadFile("Languages/de/phrases.lua")

WDTS_Engine.Initialize()

-- Test categories
local testCategories = {
    {
        name = "LFG Messages",
        tests = {
            "suche gruppe für DM",
            "LFM für BFD",
            "suche heiler für Stockades",
            "brauche tank für Deadmines",
            "sucht dps für Gnomer",
            "suche port nach SW",
            "kann jemand nach Stormwind porten",
            "brauche summon nach Booty Bay",
        },
    },
    {
        name = "Trading Messages",
        tests = {
            "verkaufe [Small Silk Pack] für 5g",
            "kaufe [Linen Cloth] für 1s",
            "WTS 6 slot bags",
            "was kostet [Small Silk Pack]",
            "wie viel für [Linen Cloth]",
            "suche vz für feurige waffe",
            "brauche schmied für eisengegengewicht",
        },
    },
    {
        name = "Questions",
        tests = {
            "was machst du?",
            "wo bist du?",
            "wie geht es dir?",
            "kannst du mir helfen?",
            "willst du mitkommen?",
            "hast du noch platz?",
            "weißt du wo das ist?",
            "kann wer porten?",
            "möchte wer bfd gehen?",
        },
    },
    {
        name = "Statements",
        tests = {
            "ich gehe nach Stormwind",
            "bin gerade in IF",
            "habe keine zeit mehr",
            "muss leider gehen",
            "komme gleich",
            "bin unterwegs",
            "war kurz weg",
            "bin wieder da",
        },
    },
    {
        name = "Complex Sentences",
        tests = {
            "wenn du zeit hast, können wir dann gehen",
            "ich glaube, dass das funktioniert",
            "weil ich keine zeit habe, muss ich gehen",
            "obwohl es spät ist, will ich noch spielen",
            "nachdem wir fertig sind, gehen wir nach hause",
            "während wir warten, können wir questen",
        },
    },
    {
        name = "WoW-Specific Terms",
        tests = {
            "suche verzauberer für +55 heilung",
            "brauche schneider für 6 slot taschen",
            "sucht alchemist für tränke",
            "suche schmied für waffe",
            "brauche kürschner für lederrüstung",
        },
    },
    {
        name = "Guild/Recruitment",
        tests = {
            "suche deutsche gilde",
            "sucht aktive gilde",
            "deutsche gilde rekrutiert mitstreiter",
            "komm zu unserer gilde",
        },
    },
    {
        name = "Common Phrases",
        tests = {
            "kein problem",
            "danke dir",
            "bitte schön",
            "viel glück",
            "bis später",
            "tschüss",
            "keine ahnung",
            "vielleicht später",
        },
    },
    {
        name = "Modal Verbs",
        tests = {
            "ich kann heilen",
            "du musst warten",
            "wir sollen gehen",
            "ihr könnt mitkommen",
            "sie will spielen",
            "er darf bleiben",
        },
    },
    {
        name = "Past Tense",
        tests = {
            "ich habe gesagt",
            "du hast gemacht",
            "wir sind gegangen",
            "ihr habt gesehen",
            "sie ist gekommen",
        },
    },
    {
        name = "Future Tense",
        tests = {
            "ich werde gehen",
            "du wirst kommen",
            "wir werden machen",
            "ihr werdet sehen",
        },
    },
    {
        name = "Separable Verbs",
        tests = {
            "mach auf die tür",
            "macht zu das fenster",
            "komm zurück",
            "geh weiter",
            "mach mit",
        },
    },
    {
        name = "Relative Clauses",
        tests = {
            "jemand der helfen kann",
            "wer das machen will",
            "die person die kommt",
            "der mann der geht",
        },
    },
    {
        name = "Subordinate Clauses",
        tests = {
            "ich weiß, dass du recht hast",
            "wenn es regnet, bleiben wir drinnen",
            "weil es spät ist, gehen wir",
            "obwohl es schwer ist, machen wir es",
        },
    },
    {
        name = "Mixed Language",
        tests = {
            "lf heal für DM",
            "need port to SW",
            "suche group für bfd",
            "brauche dps für instance",
        },
    },
    {
        name = "Edge Cases",
        tests = {
            "r",
            "ok",
            "ja",
            "nein",
            "danke",
            "bitte",
            "hallo",
        },
    },
}

-- Results storage
local results = {
    passed = {},
    failed = {},
    skipped = {},
    lowConfidence = {},
}

-- Run tests
print("\n" .. string.rep("=", 80))
print("COMPREHENSIVE TRANSLATION TEST SUITE")
print(string.rep("=", 80) .. "\n")

local totalTests = 0
local totalPassed = 0
local totalFailed = 0
local totalSkipped = 0
local totalLowConfidence = 0

for _, category in ipairs(testCategories) do
    print(string.format("\n[%s]", category.name))
    print(string.rep("-", 80))
    
    for _, testMsg in ipairs(category.tests) do
        totalTests = totalTests + 1
        
        local translated, confidence, reason = WDTS_Engine.Translate(testMsg, nil, "en", true)
        
        local status = "UNKNOWN"
        local issue = nil
        
        if not translated then
            status = "SKIPPED"
            totalSkipped = totalSkipped + 1
            table.insert(results.skipped, {
                category = category.name,
                message = testMsg,
                reason = reason or "no_translation",
                confidence = confidence or 0,
            })
            issue = string.format("SKIPPED: %s (confidence: %.2f)", reason or "no_translation", confidence or 0)
        elseif confidence and confidence < 0.50 then
            status = "LOW_CONFIDENCE"
            totalLowConfidence = totalLowConfidence + 1
            table.insert(results.lowConfidence, {
                category = category.name,
                message = testMsg,
                translation = translated,
                confidence = confidence,
            })
            issue = string.format("LOW CONFIDENCE: %.2f", confidence)
        else
            status = "PASSED"
            totalPassed = totalPassed + 1
            table.insert(results.passed, {
                category = category.name,
                message = testMsg,
                translation = translated,
                confidence = confidence,
            })
        end
        
        -- Print result
        if status == "PASSED" then
            print(string.format("  ✓ %s", testMsg))
            print(string.format("    → %s (confidence: %.2f)", translated, confidence or 0))
        else
            print(string.format("  ✗ %s", testMsg))
            if translated then
                print(string.format("    → %s", translated))
            end
            print(string.format("    ⚠ %s", issue))
        end
    end
end

-- Summary
print("\n" .. string.rep("=", 80))
print("SUMMARY")
print(string.rep("=", 80))
print(string.format("Total Tests: %d", totalTests))
print(string.format("  ✓ Passed: %d (%.1f%%)", totalPassed, (totalPassed / totalTests) * 100))
print(string.format("  ✗ Failed/Skipped: %d (%.1f%%)", totalSkipped, (totalSkipped / totalTests) * 100))
print(string.format("  ⚠ Low Confidence: %d (%.1f%%)", totalLowConfidence, (totalLowConfidence / totalTests) * 100))

-- Detailed failure report
if #results.skipped > 0 or #results.lowConfidence > 0 then
    print("\n" .. string.rep("=", 80))
    print("ISSUES TO FIX")
    print(string.rep("=", 80))
    
    if #results.skipped > 0 then
        print("\n[SKIPPED TRANSLATIONS]")
        for _, item in ipairs(results.skipped) do
            print(string.format("  [%s] %s", item.category, item.message))
            print(string.format("    Reason: %s (confidence: %.2f)", item.reason, item.confidence))
        end
    end
    
    if #results.lowConfidence > 0 then
        print("\n[LOW CONFIDENCE TRANSLATIONS]")
        for _, item in ipairs(results.lowConfidence) do
            print(string.format("  [%s] %s", item.category, item.message))
            print(string.format("    Translation: %s", item.translation))
            print(string.format("    Confidence: %.2f", item.confidence))
        end
    end
end

print("\n" .. string.rep("=", 80))

-- Exit with error if there are failures
if totalSkipped > 0 or totalLowConfidence > 0 then
    os.exit(1)
end

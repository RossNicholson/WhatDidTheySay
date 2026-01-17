#!/usr/bin/env lua5.1
-- Comprehensive test suite covering all translation scenarios
-- Tests English detection, German translation, mixed language, edge cases, and more

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

print("=" .. string.rep("=", 80))
print("COMPREHENSIVE TRANSLATION TEST SUITE")
print("=" .. string.rep("=", 80))
print()

local totalTests = 0
local totalPassed = 0
local totalFailed = 0

local function runTestCategory(name, tests)
    print(string.rep("-", 80))
    print("CATEGORY: " .. name)
    print(string.rep("-", 80))
    print()
    
    local categoryPassed = 0
    local categoryFailed = 0
    
    for i, test in ipairs(tests) do
        totalTests = totalTests + 1
        local message = test.msg or test.message
        local translated, confidence, intent = WDTS_Engine.Translate(message, nil, "en", true)
        
        local passed = false
        local reason = ""
        
        if test.shouldSkip then
            -- Should NOT translate
            if not translated or confidence == 0 then
                passed = true
                if test.reason and intent ~= test.reason then
                    passed = false
                    reason = string.format("Expected reason '%s', got '%s'", test.reason, intent or "nil")
                end
            else
                reason = string.format("Should not translate but got: '%s' (conf: %.2f)", translated, confidence)
            end
        elseif test.shouldTranslate ~= false then
            -- Should translate
            if translated and confidence > 0 then
                passed = true
                if test.minConf and confidence < test.minConf then
                    passed = false
                    reason = string.format("Confidence too low: %.2f < %.2f", confidence, test.minConf)
                end
                if test.expected then
                    local transLower = translated:lower()
                    local expectedLower = test.expected:lower()
                    if not transLower:find(expectedLower:gsub("%%", "%%%%"), 1, true) then
                        passed = false
                        reason = string.format("Expected '%s' in translation, got '%s'", test.expected, translated)
                    end
                end
            else
                reason = string.format("Should translate but didn't (conf: %.2f, intent: %s)", confidence or 0, intent or "nil")
            end
        end
        
        if passed then
            categoryPassed = categoryPassed + 1
            totalPassed = totalPassed + 1
            print(string.format("  ✓ [%d] '%s'", i, message))
            if translated then
                print(string.format("      → '%s' (conf: %.2f)", translated, confidence))
            else
                print(string.format("      → Skipped (reason: %s)", intent or "unknown"))
            end
        else
            categoryFailed = categoryFailed + 1
            totalFailed = totalFailed + 1
            print(string.format("  ✗ [%d] '%s'", i, message))
            print(string.format("      %s", reason))
            if translated then
                print(string.format("      Got: '%s' (conf: %.2f, intent: %s)", translated, confidence, intent or "nil"))
            end
        end
    end
    
    print()
    print(string.format("Category Results: %d passed, %d failed", categoryPassed, categoryFailed))
    print()
    return categoryPassed, categoryFailed
end

-- ============================================================================
-- CATEGORY 1: Pure English Messages (Should NOT translate)
-- ============================================================================
local englishTests = {
    -- Gaming abbreviations
    {msg = "LF ENCHANT", shouldSkip = true, reason = "already_english"},
    {msg = "lf enchant", shouldSkip = true, reason = "already_english"},
    {msg = "LF1M tank", shouldSkip = true, reason = "already_english"},
    {msg = "LF2M for Uldaman", shouldSkip = true, reason = "already_english"},
    {msg = "LFM DM", shouldSkip = true, reason = "already_english"},
    {msg = "WTS bags", shouldSkip = true, reason = "already_english"},
    {msg = "WTB mount", shouldSkip = true, reason = "already_english"},
    {msg = "WTT items", shouldSkip = true, reason = "already_english"},
    
    -- Common English phrases
    {msg = "ready", shouldSkip = true},
    {msg = "ready?", shouldSkip = true},
    {msg = "gg", shouldSkip = true},
    {msg = "wp", shouldSkip = true},
    {msg = "gl", shouldSkip = true},
    {msg = "hf", shouldSkip = true},
    {msg = "brb", shouldSkip = true},
    {msg = "afk", shouldSkip = true},
    {msg = "ty", shouldSkip = true},
    {msg = "thx", shouldSkip = true},
    {msg = "np", shouldSkip = true},
    {msg = "sry", shouldSkip = true},
    
    -- English commands
    {msg = "pull", shouldSkip = true},
    {msg = "stop", shouldSkip = true},
    {msg = "wait", shouldSkip = true},
    {msg = "go", shouldSkip = true},
    {msg = "heal", shouldSkip = true},
    {msg = "tank", shouldSkip = true},
    {msg = "dps", shouldSkip = true},
    
    -- English with numbers
    {msg = "LF1M", shouldSkip = true},
    {msg = "LF2M", shouldSkip = true},
    {msg = "LF3M", shouldSkip = true},
    {msg = "level 60", shouldSkip = true},
    {msg = "lvl 60", shouldSkip = true},
    
    -- English questions
    {msg = "who wants?", shouldSkip = true},
    {msg = "anyone?", shouldSkip = true},
    {msg = "ready?", shouldSkip = true},
    
    -- Mixed case English
    {msg = "LF ENCHANT", shouldSkip = true},
    {msg = "Lf Enchant", shouldSkip = true},
    {msg = "lf enchant", shouldSkip = true},
}

-- ============================================================================
-- CATEGORY 2: Pure German Messages (Should translate)
-- ============================================================================
local germanTests = {
    -- Common phrases
    {msg = "hallo", expected = "hello", minConf = 0.80},
    {msg = "danke", expected = "thanks", minConf = 0.90},
    {msg = "bitte", expected = "please", minConf = 0.80},
    {msg = "tschüss", expected = "bye", minConf = 0.80},
    
    -- LFG messages
    {msg = "suche gruppe", expected = "looking for group", minConf = 0.70},
    {msg = "suche tank", expected = "looking for tank", minConf = 0.70},
    {msg = "suche heiler", expected = "looking for healer", minConf = 0.70},
    {msg = "brauche tank für dm", expected = "need tank for", minConf = 0.50},
    {msg = "lfm für stockades", expected = "lfm for stockades", minConf = 0.50},
    
    -- Trading
    {msg = "verkaufe tasche", expected = "selling bag", minConf = 0.50},
    {msg = "kaufe waffe", expected = "buying weapon", minConf = 0.50},
    {msg = "suche verzauberer", expected = "looking for enchanter", minConf = 0.70},
    
    -- Questions
    {msg = "was ist das?", expected = "what is that", minConf = 0.70},
    {msg = "wie geht es dir?", expected = "how are you", minConf = 0.50},
    {msg = "wo bist du?", expected = "where are you", minConf = 0.70},
    {msg = "wer will mit?", expected = "who wants to come", minConf = 0.50},
    
    -- Commands
    {msg = "komm hier", expected = "come here", minConf = 0.70},
    {msg = "warte bitte", expected = "wait please", minConf = 0.70},
    {msg = "folgt mir", expected = "follow me", minConf = 0.70},
    
    -- Status
    {msg = "bin bereit", expected = "am ready", minConf = 0.70},
    {msg = "bin fertig", expected = "am done", minConf = 0.70},
    {msg = "bin kurz weg", expected = "brb", minConf = 0.70},
    
    -- Gaming terms
    {msg = "brauche heal", expected = "need heal", minConf = 0.70},
    {msg = "out of mana", expected = "out of mana", minConf = 0.50},
    {msg = "cd ready", expected = "cooldown ready", minConf = 0.70},
}

-- ============================================================================
-- CATEGORY 3: Mixed Language Messages (Should translate German parts)
-- ============================================================================
local mixedTests = {
    {msg = "wtb essence der verbannung", expected = "wtb essence", minConf = 0.40},
    {msg = "lfm für dm", expected = "lfm for", minConf = 0.40},
    {msg = "lf tank für stockades", expected = "lf tank for", minConf = 0.40},
    {msg = "wts tasche für gold", expected = "wts bag for gold", minConf = 0.40},
    {msg = "pls langsam", expected = "please slowly", minConf = 0.40},
    {msg = "oom nach pull", expected = "oom after pull", minConf = 0.40},
}

-- ============================================================================
-- CATEGORY 4: Edge Cases
-- ============================================================================
local edgeCaseTests = {
    -- Very short messages
    {msg = "f", shouldSkip = true},
    {msg = "r", shouldSkip = false}, -- "r" can be German "ready"
    {msg = "ok", shouldSkip = true},
    {msg = "ja", expected = "yes", minConf = 0.80},
    {msg = "nein", expected = "no", minConf = 0.80},
    
    -- Empty/special characters
    {msg = "", shouldSkip = true},
    {msg = "…", shouldSkip = true},
    {msg = "😐", shouldSkip = true},
    {msg = "!!!", shouldSkip = true},
    
    -- Numbers only
    {msg = "123", shouldSkip = true},
    {msg = "60", shouldSkip = true},
    
    -- Punctuation only
    {msg = "...", shouldSkip = true},
    {msg = "???", shouldSkip = true},
    {msg = "!!!", shouldSkip = true},
    
    -- Very long messages
    {msg = "Du suchst eine aktive, deutsche Gilde? Komm zu 'Legenden der Allianz' und genieße täglich organisierte World Buffs, Innis & Quests!", expected = "you are looking for", minConf = 0.30},
    
    -- Messages with special characters
    {msg = "was ist das?", expected = "what is that", minConf = 0.70},
    {msg = "hallo!!!", expected = "hello", minConf = 0.70},
    {msg = "danke...", expected = "thanks", minConf = 0.80},
}

-- ============================================================================
-- CATEGORY 5: Real-World Chat Examples
-- ============================================================================
local realWorldTests = {
    -- Trade channel
    {msg = "LF ENCHANT", shouldSkip = true},
    {msg = "WTS 6 Slot Bags", shouldSkip = true},
    {msg = "WTB Essenz der Verbannung", expected = "wtb essence", minConf = 0.40},
    {msg = "verkaufe tasche 5g", expected = "selling bag", minConf = 0.50},
    
    -- LFG channel
    {msg = "LF2M for Uldaman", shouldSkip = true},
    {msg = "suche tank für dm", expected = "looking for tank for", minConf = 0.50},
    {msg = "brauche heiler für stockades", expected = "need healer for", minConf = 0.50},
    
    -- Guild chat
    {msg = "hallo zusammen", expected = "hello everyone", minConf = 0.70},
    {msg = "gute nacht", expected = "good night", minConf = 0.70},
    {msg = "viel glück", expected = "good luck", minConf = 0.70},
    
    -- Party chat
    {msg = "warte kurz", expected = "wait a moment", minConf = 0.70},
    {msg = "bin gleich da", expected = "be right there", minConf = 0.70},
    {msg = "folgt mir", expected = "follow me", minConf = 0.70},
}

-- ============================================================================
-- CATEGORY 6: Vocabulary Coverage Tests
-- ============================================================================
local vocabularyTests = {
    -- Common WoW terms
    {msg = "quest", shouldSkip = true},
    {msg = "questgeber", expected = "quest giver", minConf = 0.50},
    {msg = "questitem", expected = "quest item", minConf = 0.50},
    
    -- Gaming slang
    {msg = "noob", shouldSkip = true},
    {msg = "pro", shouldSkip = true},
    {msg = "gg", shouldSkip = true},
    
    -- German gaming terms
    {msg = "verzauberer", expected = "enchanter", minConf = 0.80},
    {msg = "schmied", expected = "blacksmith", minConf = 0.80},
    {msg = "kräuterkundiger", expected = "herbalist", minConf = 0.80},
}

-- ============================================================================
-- CATEGORY 7: Grammar and Word Order Tests
-- ============================================================================
local grammarTests = {
    -- Questions (should have correct word order)
    {msg = "was ist das?", expected = "what is that", minConf = 0.70},
    {msg = "wo bist du?", expected = "where are you", minConf = 0.70},
    {msg = "wie geht es dir?", expected = "how are you", minConf = 0.50},
    
    -- Commands
    {msg = "komm hier", expected = "come here", minConf = 0.70},
    {msg = "warte bitte", expected = "wait please", minConf = 0.70},
    
    -- Statements
    {msg = "ich bin bereit", expected = "i am ready", minConf = 0.70},
    {msg = "du bist fertig", expected = "you are done", minConf = 0.70},
}

-- ============================================================================
-- RUN ALL TESTS
-- ============================================================================

runTestCategory("1. Pure English Messages (Should NOT translate)", englishTests)
runTestCategory("2. Pure German Messages (Should translate)", germanTests)
runTestCategory("3. Mixed Language Messages (Should translate German parts)", mixedTests)
runTestCategory("4. Edge Cases", edgeCaseTests)
runTestCategory("5. Real-World Chat Examples", realWorldTests)
runTestCategory("6. Vocabulary Coverage", vocabularyTests)
runTestCategory("7. Grammar and Word Order", grammarTests)

-- ============================================================================
-- FINAL SUMMARY
-- ============================================================================
print("=" .. string.rep("=", 80))
print("FINAL SUMMARY")
print("=" .. string.rep("=", 80))
print(string.format("Total Tests: %d", totalTests))
print(string.format("Passed: %d (%.1f%%)", totalPassed, (totalPassed / totalTests) * 100))
print(string.format("Failed: %d (%.1f%%)", totalFailed, (totalFailed / totalTests) * 100))
print("=" .. string.rep("=", 80))

if totalFailed > 0 then
    print("\n⚠️  Some tests failed. Review the output above.")
    os.exit(1)
else
    print("\n✓ All tests passed!")
    os.exit(0)
end

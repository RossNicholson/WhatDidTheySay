#!/usr/bin/env lua5.1
-- Comprehensive test for English detection and translation accuracy

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

-- Test categories
local englishTests = {
    -- Pure English gaming messages (should NOT translate)
    {msg = "LF2M for Uldaman fast run", shouldSkip = true, reason = "already_english"},
    {msg = "need port to darnassus", shouldSkip = true, reason = "already_english"},
    {msg = "LE TANK FOR STOCKADES THEN GO", shouldSkip = true, reason = "already_english"},
    {msg = "LF1M DM HC, need Heal + DPS", shouldSkip = true, reason = "already_english"},
    {msg = "ready", shouldSkip = true, reason = "english_greeting"},
    {msg = "rip", shouldSkip = true, reason = "english_greeting"},
    {msg = "WTS 6 Slot Bags", shouldSkip = true},
    {msg = "sheep moon?", shouldSkip = true},
    {msg = "pull 1 mob", shouldSkip = true},
    {msg = "heal spam", shouldSkip = true},
    {msg = "nice save", shouldSkip = true},
    {msg = "mana break", shouldSkip = true},
    {msg = "drink", shouldSkip = true},
    {msg = "boss down", shouldSkip = true},
    {msg = "gg", shouldSkip = true},
    {msg = "same", shouldSkip = true},
    {msg = "fair", shouldSkip = true},
}

local germanTests = {
    -- Pure German messages (should translate)
    {msg = "was für ein addon ist das nochmal?", expected = "what kind of addon is that again", minConf = 0.50},
    {msg = "brauchst kein addon", expected = "you don't need an addon", minConf = 0.80},
    {msg = "danke", expected = "thanks", minConf = 0.90},
    {msg = "jmd grad Lag gehabt?", expected = "anyone just had lag", minConf = 0.50},
    {msg = "lebt noch, HS inc", expected = "still alive hearthstone incoming", minConf = 0.50},
    {msg = "gz", expected = "grats", minConf = 0.90},
    {msg = "ich hab nur F gesagt", expected = "I have only f said", minConf = 0.40},
    {msg = "volle mana", expected = "full mana", minConf = 0.80},
    {msg = "CD bereit", expected = "cooldown ready", minConf = 0.80},
    {msg = "pet auf passiv", expected = "pet on passive", minConf = 0.80},
}

local mixedTests = {
    -- Mixed German-English messages (should translate German parts)
    {msg = "LF2M für DM", expected = "LF2M for DM", minConf = 0.40},
    {msg = "pls langsam, HC run", expected = "please slowly, HC run", minConf = 0.40},
    {msg = "oom nach pull", expected = "oom after pull", minConf = 0.40},
}

local edgeCases = {
    -- Edge cases
    {msg = "f", shouldSkip = true}, -- Single letter, should skip
    {msg = "…", shouldSkip = true}, -- Ellipsis, should skip
    {msg = "😐", shouldSkip = true}, -- Emoji only, should skip
    {msg = "hallo", expected = "hello", minConf = 0.80}, -- German greeting
}

print("=" .. string.rep("=", 80))
print("Comprehensive Translation Test")
print("=" .. string.rep("=", 80))
print()

local function testCategory(name, tests)
    print(string.format("\n%s:", name))
    print(string.rep("-", 80))
    
    local passed = 0
    local failed = 0
    
    for i, test in ipairs(tests) do
        local translated, confidence, reason = WDTS_Engine.Translate(test.msg, nil, "en", true)
        
        local success = false
        local errorMsg = ""
        
        if test.shouldSkip then
            -- Should NOT translate
            if not translated then
                if test.reason then
                    if reason == test.reason then
                        success = true
                    else
                        errorMsg = string.format("Expected reason '%s', got '%s'", test.reason, reason or "nil")
                    end
                else
                    success = true
                end
            else
                errorMsg = string.format("Should not translate but got: '%s' (conf: %.2f)", translated, confidence or 0)
            end
        else
            -- Should translate
            if translated then
                if test.expected then
                    -- Check if expected phrase appears in translation (fuzzy match)
                    local translatedLower = translated:lower()
                    local expectedLower = test.expected:lower()
                    if translatedLower:find(expectedLower, 1, true) or expectedLower:find(translatedLower, 1, true) then
                        success = true
                    else
                        errorMsg = string.format("Expected '%s' in translation, got '%s'", test.expected, translated)
                    end
                end
                
                if test.minConf then
                    if (confidence or 0) >= test.minConf then
                        -- Confidence check passed
                        if not test.expected or success then
                            success = true
                        end
                    else
                        errorMsg = string.format("Confidence %.2f below minimum %.2f", confidence or 0, test.minConf)
                        success = false
                    end
                end
            else
                errorMsg = string.format("Should translate but got reason: %s", reason or "unknown")
            end
        end
        
        if success then
            passed = passed + 1
            local icon = test.shouldSkip and "✓" or "✓"
            print(string.format("%s [%d/%d] %s", icon, i, #tests, test.msg:sub(1, 60)))
            if translated and test.expected then
                print(string.format("    → %s (conf: %.2f)", translated:sub(1, 70), confidence or 0))
            elseif not translated then
                print(string.format("    → Skipped (reason: %s)", reason or "unknown"))
            end
        else
            failed = failed + 1
            print(string.format("❌ [%d/%d] %s", i, #tests, test.msg:sub(1, 60)))
            print(string.format("    Error: %s", errorMsg))
            if translated then
                print(string.format("    Got: '%s' (conf: %.2f, reason: %s)", translated, confidence or 0, reason or "none"))
            else
                print(string.format("    Got: Not translated (reason: %s)", reason or "unknown"))
            end
        end
    end
    
    print(string.format("\n%s Results: %d passed, %d failed (%.1f%%)", name, passed, failed, (passed / #tests) * 100))
    return passed, failed
end

local totalPassed = 0
local totalFailed = 0

local p1, f1 = testCategory("English Messages (Should Skip)", englishTests)
local p2, f2 = testCategory("German Messages (Should Translate)", germanTests)
local p3, f3 = testCategory("Mixed Messages (Should Translate German)", mixedTests)
local p4, f4 = testCategory("Edge Cases", edgeCases)

totalPassed = p1 + p2 + p3 + p4
totalFailed = f1 + f2 + f3 + f4

print()
print("=" .. string.rep("=", 80))
print(string.format("Overall Results: %d passed, %d failed (%.1f%% pass rate)", 
    totalPassed, totalFailed, (totalPassed / (totalPassed + totalFailed)) * 100))
print("=" .. string.rep("=", 80))

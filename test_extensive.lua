#!/usr/bin/env lua5.1
-- Extensive test suite for translation engine

local message = arg[1]

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
loadFile("Languages/de/tokens.lua")
loadFile("Languages/de/intents.lua")
loadFile("Languages/de/patterns.lua")
loadFile("Languages/de/grammar.lua")
loadFile("Languages/de/phrases.lua")

WDTS_Engine.Initialize()

-- Test messages
local testCases = {
    {msg = "suche gruppe für DM", desc = "Basic LFG"},
    {msg = "schneider der [Small Silk Pack] kann? /w", desc = "Crafting request with item"},
    {msg = "Du suchst eine aktive, deutsche Gilde?", desc = "Guild recruitment (short)"},
    {msg = "Heal Ifg Todesminen", desc = "Mixed language LFG"},
    {msg = "suche vz für feurige waffe", desc = "Enchantment request"},
    {msg = "schmied gesucht für Eisenschildstachel", desc = "Crafting wanted"},
    {msg = "If tank heal dm dann abfahrt", desc = "Mixed language with German"},
    {msg = "Kann man als Alli HDW gehen?", desc = "Question about dungeon"},
    {msg = "LF Tank für ST", desc = "LFG mixed language"},
    {msg = "kann uns jemand mit einer spende für unseren gildenrock unterstützen bitte", desc = "Donation request"},
    {msg = "einfach nen bank char machen", desc = "Bank character advice"},
}

print("=" .. string.rep("=", 78))
print("Extensive Translation Testing")
print("=" .. string.rep("=", 78))
print()

local passed = 0
local failed = 0
local totalWords = 0
local translatedWords = 0

for i, test in ipairs(testCases) do
    print(string.format("Test %d/%d: %s", i, #testCases, test.desc))
    print(string.format("  Input: %s", test.msg))
    
    local translated, confidence, intent = WDTS_Engine.Translate(test.msg, nil, "en", true)
    
    if translated then
        print(string.format("  Output: %s", translated))
        print(string.format("  Confidence: %.2f", confidence))
        if intent then
            print(string.format("  Intent: %s", type(intent) == "table" and intent.id or intent))
        end
        
        -- Check coverage
        local tokens = WDTS_Tokenizer.Tokenize(test.msg)
        local langPack = WDTS_Engine.LoadLanguagePack("de")
        local words = 0
        local matched = 0
        for _, token in ipairs(tokens) do
            if token.type == "word" then
                words = words + 1
                if langPack.tokens[token.value] then
                    matched = matched + 1
                end
            end
        end
        totalWords = totalWords + words
        translatedWords = translatedWords + matched
        
        local coverage = words > 0 and (matched / words) or 0
        print(string.format("  Coverage: %d/%d words (%.1f%%)", matched, words, coverage * 100))
        
        if confidence >= 0.45 then
            print("  ✓ PASS (confidence OK)")
            passed = passed + 1
        else
            print(string.format("  ⚠ LOW CONFIDENCE (%.2f < 0.45)", confidence))
            failed = failed + 1
        end
    else
        print(string.format("  ❌ FAILED - No translation (conf: %.2f)", confidence or 0))
        print(string.format("  Reason: %s", intent or "unknown"))
        failed = failed + 1
    end
    print()
end

print("=" .. string.rep("=", 78))
print(string.format("Summary: %d passed, %d failed", passed, failed))
print(string.format("Overall vocabulary coverage: %.1f%% (%d/%d words)", 
    totalWords > 0 and (translatedWords/totalWords)*100 or 0, translatedWords, totalWords))
print("=" .. string.rep("=", 78))

if failed > 0 then
    os.exit(1)
end

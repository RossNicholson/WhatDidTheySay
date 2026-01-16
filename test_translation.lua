#!/usr/bin/env lua5.1
-- Standalone translation testing script
-- Usage: lua5.1 test_translation.lua

-- Mock WoW API
_G = _G or {}
_G.WhatDidTheySayDB = {
    channels = {
        WHISPER = true,
        SAY = true,
        PARTY = true,
        RAID = true,
        GENERAL = true,
        TRADE = true,
        WORLD = true,
        LFG = true,
    },
    autoTranslate = true,
    showOriginal = true,
    minConfidence = 0.70,
    enabledLanguagePacks = {
        de = true,
    },
}

-- Mock global functions that addon expects
_G.GetTime = function() return os.time() end
_G.GetChannelList = function() return end
_G.IsInRaid = function() return false end
_G.select = select

-- Load addon files (in order)
local function loadFile(path)
    local file = io.open(path, "r")
    if not file then
        error("Could not open file: " .. path)
    end
    local content = file:read("*all")
    file:close()
    
    -- Create a safe environment for loading
    local env = setmetatable({}, {__index = _G})
    local func = load(content, path, "t", env)
    if not func then
        error("Error loading file: " .. path)
    end
    func()
    return env
end

print("Loading addon modules...")

-- Load core modules in order
loadFile("Core/Utils.lua")
loadFile("Core/Tokenizer.lua")
loadFile("Core/LanguageDetect.lua")
loadFile("Core/Confidence.lua")
loadFile("Core/LanguagePackManager.lua")
loadFile("Core/Engine.lua")

-- Load language packs
print("Loading language packs...")
loadFile("Languages/de/tokens.lua")
loadFile("Languages/de/intents.lua")
loadFile("Languages/de/patterns.lua")
loadFile("Languages/de/grammar.lua")
loadFile("Languages/de/phrases.lua")

-- Initialize
print("Initializing engine...")
WDTS_Engine.Initialize()

-- Test cases
local tests = {
    {
        name = "Simple LFG",
        message = "suche gruppe für DM",
        expected = "looking for group for DM",
    },
    {
        name = "Crafting request",
        message = "schneider der [Small Silk Pack] kann? /w",
        expected = "tailor who can [Small Silk Pack]? /w",
    },
    {
        name = "Guild recruitment (long)",
        message = 'Du suchst eine aktive, deutsche Gilde? Komm zu "Legenden der Allianz" und genieße täglich organisierte World Buffs, Innis & Quests!',
        expected_contains = {"you", "looking", "active", "guild", "daily"},
    },
    {
        name = "LFG mixed language",
        message = "Heal Ifg Todesminen",
        expected_contains = {"heal", "lfg", "deadmines"},
    },
    {
        name = "Simple translation",
        message = "suche vz für feurige waffe",
        expected_contains = {"enchantment", "fiery", "weapon"},
    },
}

-- Run tests
print("\n" .. string.rep("=", 70))
print("Running translation tests...")
print(string.rep("=", 70) .. "\n")

local passed = 0
local failed = 0

for i, test in ipairs(tests) do
    print(string.format("Test %d: %s", i, test.name))
    print(string.format("  Input: %s", test.message))
    
    local translated, confidence, intent = WDTS_Engine.Translate(test.message, nil, "en", true)
    
    if not translated then
        print(string.format("  ❌ FAILED: No translation (confidence: %.2f)", confidence or 0))
        failed = failed + 1
    else
        print(string.format("  Output: %s", translated))
        print(string.format("  Confidence: %.2f", confidence or 0))
        if intent then
            print(string.format("  Intent: %s", intent.id or "unknown"))
        end
        
        -- Check result
        local success = false
        if test.expected then
            -- Exact match
            local cleanTrans = translated:gsub("%s+", " "):lower()
            local cleanExpected = test.expected:gsub("%s+", " "):lower()
            success = cleanTrans == cleanExpected
        elseif test.expected_contains then
            -- Contains check
            local transLower = translated:lower()
            success = true
            for _, word in ipairs(test.expected_contains) do
                if not transLower:find(word:lower(), 1, true) then
                    success = false
                    print(string.format("    ⚠ Missing expected word: %s", word))
                    break
                end
            end
        end
        
        if success then
            print("  ✅ PASSED")
            passed = passed + 1
        else
            print("  ❌ FAILED")
            if test.expected then
                print(string.format("    Expected: %s", test.expected))
            end
            failed = failed + 1
        end
    end
    print()
end

-- Summary
print(string.rep("=", 70))
print(string.format("Results: %d passed, %d failed", passed, failed))
print(string.rep("=", 70))

if failed > 0 then
    os.exit(1)
end

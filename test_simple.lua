#!/usr/bin/env lua5.1
-- Simplified test script that shows what's happening
-- Usage: lua5.1 test_simple.lua <message>

local message = arg[1] or 'Du suchst eine aktive, deutsche Gilde? Komm zu "Legenden der Allianz" und genieße täglich organisierte World Buffs, Innis & Quests!'

print("Testing message:", message)
print()

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
    -- Lua 5.1 uses loadstring instead of load with string
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

-- Debug: show tokenization
local Tokenizer = WDTS_Tokenizer
local tokens, protected, protectedMap = Tokenizer.Tokenize(message)
print("\n=== Tokenization ===")
print(string.format("Found %d tokens:", #tokens))
local wordCount = 0
local translatedCount = 0
for i, token in ipairs(tokens) do
    if token.type == "word" then
        wordCount = wordCount + 1
        local langPack = WDTS_Engine.LoadLanguagePack("de")
        local translation = langPack and langPack.tokens and langPack.tokens[token.value] or nil
        local status = translation and ("✓ → " .. translation) or "✗ (no translation)"
        print(string.format("  [%d] %s -> %s %s", i, token.original, token.value, status))
        if translation then
            translatedCount = translatedCount + 1
        end
    else
        print(string.format("  [%d] %s (type: %s)", i, token.original, token.type))
    end
end
print(string.format("\nCoverage: %d/%d words (%.1f%%)", translatedCount, wordCount, (wordCount > 0 and (translatedCount/wordCount)*100 or 0)))

-- Debug: show what TranslateTokens produces
local langPack = WDTS_Engine.LoadLanguagePack("de")
local translatedTokens, tokenCoverage, tokenUnknownRatio = WDTS_Engine.TranslateTokens(tokens, langPack)
print("\n=== Translated Tokens ===")
for i, token in ipairs(translatedTokens) do
    if token.type == "word" then
        print(string.format("  [%d] original=%s value=%s", i, token.original, token.value))
    end
end
print(string.format("Coverage: %.1f%%", tokenCoverage * 100))

-- Test reconstruction
local reconstructed = WDTS_Tokenizer.Reconstruct(translatedTokens)
print("Reconstructed:", reconstructed)

-- Test translation
local translated, confidence, intent = WDTS_Engine.Translate(message, nil, "en", true)

print("\n=== Translation Result ===")
if translated then
    print("  Translated:", translated)
    print("  Confidence:", string.format("%.2f", confidence))
    if intent then
        print("  Intent:", intent.id or "unknown")
    end
else
    print("  ❌ Translation failed")
    print("  Confidence:", string.format("%.2f", confidence or 0))
    print("  Reason:", intent or "unknown")
end

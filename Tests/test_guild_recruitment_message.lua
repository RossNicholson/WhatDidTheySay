#!/usr/bin/env lua5.1
-- Test for guild recruitment message from screenshot

_G = _G or {}
_G.WhatDidTheySayDB = {
    enabledLanguagePacks = { de = true },
}

_G.GetTime = function() return os.time() end
_G.GetChannelList = function() return end
_G.IsInRaid = function() return false end
_G.select = select

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

local message = "Die Gilde Streichelzoo sucht Mitglieder! Alle sind willkommen egal ob Anfänger oder nicht, Dungeons oder Raiden, Leveln oder einfach entspannt zusammen zocken und chatten. /w me ginv für autoinvite =)"

print("Testing guild recruitment message:")
print("=" .. string.rep("=", 80))
print("Original:", message)
print()

local translated, confidence, intent = WDTS_Engine.Translate(message, nil, "en", true)

print("Translation:", translated or "nil")
print("Confidence:", confidence or 0)
print("Intent:", intent or "nil")
print()

-- Check for specific issues
print("Checking for issues:")
local issues = {}

if translated then
    local transLower = translated:lower()
    
    -- Check for untranslated German words
    if transLower:find("zocken") then
        table.insert(issues, "❌ 'zocken' not translated (should be 'playing')")
    else
        print("  ✓ 'zocken' translated")
    end
    
    if transLower:find("chatten") then
        table.insert(issues, "❌ 'chatten' not translated (should be 'chatting')")
    else
        print("  ✓ 'chatten' translated")
    end
    
    -- Check for mistranslations
    if transLower:find("car invite") then
        table.insert(issues, "❌ 'autoinvite' mistranslated as 'car invite'")
    elseif transLower:find("autoinvite") or transLower:find("auto invite") then
        print("  ✓ 'autoinvite' correctly preserved")
    else
        print("  ? 'autoinvite' handling unclear")
    end
    
    -- Check expected words
    local expectedWords = {"guild", "looking", "members", "welcome", "beginner", "dungeons", "raiding", "leveling"}
    for _, word in ipairs(expectedWords) do
        if transLower:find(word:lower(), 1, true) then
            print(string.format("  ✓ Contains '%s'", word))
        else
            table.insert(issues, string.format("⚠️  Missing expected word: '%s'", word))
        end
    end
end

print()
if #issues > 0 then
    print("Issues found:")
    for _, issue in ipairs(issues) do
        print("  " .. issue)
    end
else
    print("✓ No major issues found")
end

-- Check individual word translations
print("\nChecking vocabulary:")
local langPack = WDTS_Engine.LoadLanguagePack("de")
local wordsToCheck = {"zocken", "chatten", "autoinvite", "mitglieder", "willkommen", "anfänger"}
for _, word in ipairs(wordsToCheck) do
    local trans = langPack.tokens[word:lower()]
    if trans then
        print(string.format("  '%s' -> '%s'", word, trans))
    else
        print(string.format("  '%s' -> (NOT FOUND)", word))
    end
end

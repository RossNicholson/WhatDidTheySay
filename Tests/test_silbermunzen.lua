#!/usr/bin/env lua5.1
-- Test for "Hat jemand einpaar Silbermünzen bitte übrig" translation

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

local message = "Hat jemand einpaar Silbermünzen bitte übrig"
print("Testing message:", message)
print()

local translated, confidence, intent = WDTS_Engine.Translate(message, nil, "en", true)

print("Translation:", translated or "nil")
print("Confidence:", confidence or 0)
print("Intent:", intent or "nil")

-- Check individual words
print("\nChecking individual word translations:")
local tokens, protected, protectedMap = WDTS_Tokenizer.Tokenize(message)
local langPack = WDTS_Engine.LoadLanguagePack("de")

for _, token in ipairs(tokens) do
    if token.type == "word" then
        local word = token.value:lower()
        local translation = langPack.tokens[word]
        if translation then
            print(string.format("  '%s' -> '%s'", word, translation))
        else
            print(string.format("  '%s' -> (NOT FOUND)", word))
        end
    end
end

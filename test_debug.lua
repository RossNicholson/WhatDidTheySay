#!/usr/bin/env lua5.1
-- Debug test to understand why translations aren't working

-- Mock WoW API
_G = _G or {}
_G.WhatDidTheySayDB = {
    enabledLanguagePacks = { de = true },
    channels = {
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

print("Initializing engine...")
WDTS_Engine.Initialize()

print("\n=== Debug Test ===")
local testMsg = arg[1] or "hallo"
print("Test message: " .. testMsg)

-- Check if engine is initialized
print("Engine initialized: " .. tostring(WDTS_Engine.initialized))

-- Check if language pack is loaded
local langPack = WDTS_Engine.languagePacks["de"]
print("German pack loaded: " .. tostring(langPack ~= nil))
if langPack then
    print("  Tokens: " .. (langPack.tokens and "yes" or "no"))
    print("  Phrases: " .. (langPack.phrases and "yes" or "no"))
    if langPack.tokens then
        print("  Token count: " .. (function()
            local count = 0
            for _ in pairs(langPack.tokens) do count = count + 1 end
            return count
        end)())
    end
end

-- Check language detection (using Tokenizer)
local tokensForDetect, _, _ = WDTS_Tokenizer.Tokenize(testMsg)
local detected, langConf = WDTS_LanguageDetect.Detect(tokensForDetect)
print("Detected language: " .. tostring(detected) .. " (confidence: " .. tostring(langConf) .. ")")

-- Check tokenization
local tokens, protected, protectedMap = WDTS_Tokenizer.Tokenize(testMsg)
print("Tokens: " .. #tokens)
for i, token in ipairs(tokens) do
    print("  " .. i .. ": " .. token.type .. " = " .. tostring(token.value))
end

-- Try translation
print("\nAttempting translation...")
local translated, confidence, intent = WDTS_Engine.Translate(testMsg, nil, "en")
print("Translated: " .. tostring(translated))
print("Confidence: " .. tostring(confidence))
print("Intent: " .. tostring(intent))

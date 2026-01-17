#!/usr/bin/env lua5.1
-- Quick test for "LF ENCHANTER" translation issue

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

local testMessages = {
    "LF ENCHANTER",
    "lf enchanter",
    "LF Enchanter",
}

print("Testing 'LF ENCHANTER' variants:")
print("=" .. string.rep("=", 60))

for _, msg in ipairs(testMessages) do
    local translated, confidence, intent = WDTS_Engine.Translate(msg, nil, "en", true)
    print(string.format("\nMessage: '%s'", msg))
    print(string.format("  Translated: %s", translated or "nil"))
    print(string.format("  Confidence: %.2f", confidence or 0))
    print(string.format("  Intent: %s", intent or "nil"))
end

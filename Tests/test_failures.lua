#!/usr/bin/env lua5.1
-- Analyze specific failures to identify patterns

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
    if not file then error("Could not open: " .. path) end
    local content = file:read("*all")
    file:close()
    local func = loadstring(content, path)
    if not func then error("Error compiling: " .. path) end
    setfenv(func, _G)
    func()
end

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

-- Failed or problematic test cases to analyze
local failures = {
    "komm hierher",
    "gehe in ruhe",
    "LF Mage für Gnomer",
    "brauche help",
    "ist gerade gestorben",
    "brauche startgeld",
    "komme in 5 minuten",
    "habe keine zeit mehr",
    "muss leider gehen",
    "WTS [Flammenschwert] 200g",
    "WTB [Verzauberte Glocke]",
    "verkaufe verschiedene items",
    "kaufe [Tuch] stapelweise",
    "ok",
    "kannst du mich einladen?",
    "kann jemand mich porten?",
    "wann starten wir?",
    "was muss ich tun?",
}

print("=" .. string.rep("=", 80))
print("Failure Analysis - Detailed Translation Debug")
print("=" .. string.rep("=", 80))
print()

for i, msg in ipairs(failures) do
    print(string.format("\n[%d] Input: %s", i, msg))
    
    -- Tokenize
    local tokens = WDTS_Tokenizer.Tokenize(msg)
    print("  Tokens:", #tokens)
    for j, token in ipairs(tokens) do
        print(string.format("    [%d] %s: '%s' (original: '%s')", 
            j, token.type, token.value, token.original))
    end
    
    -- Translate
    local translated, confidence, intent = WDTS_Engine.Translate(msg, nil, "en", true)
    
    if translated then
        print(string.format("  → %s", translated))
        print(string.format("  Confidence: %.2f", confidence))
        
        -- Check vocabulary
        local langPack = WDTS_Engine.LoadLanguagePack("de")
        local missing = {}
        for _, token in ipairs(tokens) do
            if token.type == "word" and not langPack.tokens[token.value] then
                table.insert(missing, token.value)
            end
        end
        if #missing > 0 then
            print(string.format("  ⚠ Missing vocabulary: %s", table.concat(missing, ", ")))
        end
    else
        print(string.format("  ❌ Failed: %s (conf: %.2f)", intent or "unknown", confidence or 0))
    end
end

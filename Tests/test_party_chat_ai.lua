#!/usr/bin/env lua5.1
-- Test AI-generated party chat messages

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

-- AI-generated party chat messages
local testMessages = {
    "ok alle drin?",
    "ja",
    "ready",
    "sec mana",
    "bin da",
    "pls langsam, HC run",
    "jaja",
    "kein YOLO pulls bitte",
    "versprochen 😇",
    "pull 1 mob",
    "marked skull",
    "sheep moon?",
    "ja pls",
    "oom nach pull",
    "ok wait",
    "pat kommt",
    "back back",
    "lag kurz 😐",
    "sag sowas nicht im HC",
    "pls no jinx",
    "next pull 2 mobs, cc ready?",
    "sheep up",
    "sap inc",
    "full mana",
    "pull",
    "skull down",
    "sheep resist",
    "taunt taunt",
    "heal spam",
    "blind 2nd",
    "nice save",
    "mana break",
    "drink",
    "ammo check",
    "mein Herz rast 😅",
    "patrol links, wait",
    "hab FD ready",
    "bitte nicht testen",
    "chest hier",
    "erst area clear",
    "ok ok",
    "grüner staff",
    "nice",
    "equip erst in town 😄",
    "superstition OP",
    "gleich Sneed",
    "CD bereit",
    "pet auf passiv",
    "sheep add?",
    "ja",
    "pull boss",
    "heal läuft",
    "kick",
    "add sheeped",
    "focus boss",
    "mana low",
    "def stance",
    "evasion",
    "boss down",
    "uff",
    "drop: blue chest",
    "grats",
    "danke",
    "screenshot machen 😄",
    "skippen wir Goblin pat?",
    "pls ja",
    "100%",
    "skip > risk",
    "DC?",
    "WAS",
    "nein Spaß",
    "😐",
    "mach das nie wieder",
    "VanCleef prep",
    "volle mana",
    "sheep adds",
    "kick chain",
    "trap ready",
    "pull",
    "big heal",
    "sheep break",
    "blind add",
    "trap 2nd",
    "CDs jetzt",
    "oom",
    "pot",
    "evocate",
    "vanish if needed",
    "boss 10%",
    "VAN CLEEF DOWN",
    "OMG",
    "gg",
    "holy shit",
    "HC clear 😎",
    "niemand gestorben",
    "biggest win",
    "hearth pls",
    "sofort",
}

print("=" .. string.rep("=", 80))
print("AI-Generated Party Chat Translation Test")
print("=" .. string.rep("=", 80))
print()

local passed = 0
local lowConf = 0
local failed = 0
local totalWords = 0
local translatedWords = 0

for i, msg in ipairs(testMessages) do
    local translated, confidence, intent = WDTS_Engine.Translate(msg, nil, "en", true)
    
    -- Count vocabulary coverage
    local tokens = WDTS_Tokenizer.Tokenize(msg)
    local langPack = WDTS_Engine.LoadLanguagePack("de")
    local words = 0
    local matched = 0
    for _, token in ipairs(tokens) do
        if token.type == "word" then
            words = words + 1
            totalWords = totalWords + 1
            if langPack and langPack.tokens and langPack.tokens[token.value:lower()] then
                matched = matched + 1
                translatedWords = translatedWords + 1
            end
        end
    end
    
    local coverage = words > 0 and (matched / words) or 0
    
    if translated then
        if confidence >= 0.50 then
            passed = passed + 1
            print(string.format("✓ [%.2f] %s", confidence, msg:sub(1, 60)))
            print(string.format("  → %s", translated:sub(1, 70)))
        else
            lowConf = lowConf + 1
            print(string.format("⚠ [%.2f] %s", confidence, msg:sub(1, 60)))
            print(string.format("  → %s", translated:sub(1, 70)))
        end
    else
        failed = failed + 1
        print(string.format("❌ [FAIL] %s", msg:sub(1, 60)))
        print(string.format("  Reason: %s", intent or "unknown"))
    end
end

print()
print("=" .. string.rep("=", 80))
print(string.format("Results: %d passed, %d low confidence, %d failed", passed, lowConf, failed))
print(string.format("Overall vocabulary coverage: %.1f%% (%d/%d words)", 
    totalWords > 0 and (translatedWords/totalWords)*100 or 0, translatedWords, totalWords))
print("=" .. string.rep("=", 80))

#!/usr/bin/env lua5.1
-- Test messages from real WoW chat log

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

-- German messages extracted from the log
local testCases = {
    -- Trading
    {msg = "Keine Halben Sachen ! Nice :D", desc = "No half measures"},
    {msg = "Ginn-su-Schwert 99g", desc = "Item with price"},
    {msg = "Steinhammer der StärkeorFelspulverisiereras pala dd?", desc = "Crafting request with item"},
    {msg = "Blanchards SchädelbrecherLord Alexanders StreitaxtWüstenring des Affen", desc = "Item names"},
    {msg = "suche vz für feurige waffe", desc = "Looking for enchantment"},
    {msg = "vk Waldmannsaxt der StärkeWaldmannsaxt des Bären je 30s", desc = "Selling items"},
    {msg = "verkaufeLeichentuch", desc = "Selling item"},
    {msg = "kann uns jemand mit einer spende für unseren gildenrock unterstützen bitte^^", desc = "Donation request"},
    {msg = "LF Aktive deutsche Gilde", desc = "LF Active German Guild"},
    {msg = "Suche Deutsche Levelgilde", desc = "Looking for German Leveling Guild"},
    {msg = "Suche auch deutsche Levelgilde <3", desc = "Also looking for German Leveling Guild"},
    {msg = "Suche Deutsche gilde", desc = "Looking for German guild"},
    {msg = "Suche Schurken der mir 2x Mit Eisenbeschlägen verschlossene Truhe öffnen kann :)", desc = "Looking for rogues to open chests"},
    {msg = "schneider der Small Silk Pack kann? /w", desc = "Tailor for bags"},
    {msg = "kann uns wer na Danasus von SW aus porten", desc = "Can someone port to Darnassus"},
    {msg = "brauche port nach stormwind", desc = "Need port to Stormwind"},
    
    -- LFG
    {msg = "Heal lfg Todesminen", desc = "Heal LFG Deadmines"},
    {msg = "LFM HDW (19+) 1 DD und Tank, wir porten dann", desc = "LFM HDW with roles and port"},
    {msg = "LFM HDW (19+) Tank, wir porten dann", desc = "LFM HDW Tank port"},
    {msg = "pala lvl 20 sucht gruppe für DM", desc = "Paladin looking for DM group"},
    {msg = "suche gruppe für DM", desc = "Looking for group for DM"},
    {msg = "1 DD Verlies", desc = "1 DPS Deadmines"},
    {msg = "+2 DD für rfd", desc = "+2 DPS for RFD"},
    {msg = "1 Tank für HDW für porten teilen alle quests", desc = "1 Tank for HDW for porting"},
    {msg = "Suchen einen Heiler füre DM", desc = "Looking for a healer for DM"},
    {msg = "Baerenfang: Suchen einen Heiler füre DM", desc = "Looking for healer"},
    
    -- Questions/Requests
    {msg = "jemand in sw der mir kurz ne qest helfen kann 30-40 bitte", desc = "Someone in SW to help with quest"},
    {msg = "Ein Hexenmeister Lust auf HDW? :D", desc = "Warlock interested in HDW"},
    {msg = "kann jemand in sw wollstofftaschen herstellen?", desc = "Can someone in SW make woolen bags"},
    {msg = "need port to sw kurwa pls help", desc = "Mixed language port request"},
    {msg = "kann uns wer na Danasus von SW aus porten, wollen ein bissel questen :/", desc = "Can someone port to Darnassus from SW"},
    
    -- Guild
    {msg = "Du suchst eine aktive, deutsche Gilde? Komm zu \"Legenden der Allianz\" und genieße täglich organisierte World Buffs, Innis & Quests!", desc = "Guild recruitment"},
    
    -- Status
    {msg = "Eisenschmiede is leer", desc = "Ironforge is empty"},
}

print("=" .. string.rep("=", 80))
print("Real Chat Log Messages - German Translation Testing")
print("=" .. string.rep("=", 80))
print()

local passed = 0
local failed = 0
local lowConf = 0

for i, test in ipairs(testCases) do
    local translated, confidence, intent = WDTS_Engine.Translate(test.msg, nil, "en", true)
    
    local status = ""
    if not translated then
        status = "❌ FAIL"
        failed = failed + 1
        print(string.format("%s [%d] %s", status, i, test.desc))
        print(string.format("   Input: %s", test.msg:sub(1, 70)))
        print(string.format("   Reason: %s (conf: %.2f)", intent or "unknown", confidence or 0))
    elseif confidence >= 0.50 then
        status = "✓ PASS"
        passed = passed + 1
    elseif confidence >= 0.30 then
        status = "⚠ LOW"
        lowConf = lowConf + 1
        print(string.format("%s [%d] %s", status, i, test.desc))
        print(string.format("   Input: %s", test.msg:sub(1, 70)))
        print(string.format("   Output: %s", translated:sub(1, 70)))
        print(string.format("   Confidence: %.2f", confidence))
    else
        status = "✗ FAIL"
        failed = failed + 1
        print(string.format("%s [%d] %s", status, i, test.desc))
        print(string.format("   Input: %s", test.msg:sub(1, 70)))
        if translated then
            print(string.format("   Output: %s", translated:sub(1, 70)))
        end
        print(string.format("   Confidence: %.2f", confidence))
    end
end

print("\n" .. string.rep("=", 80))
print(string.format("Results: %d passed, %d low confidence, %d failed", passed, lowConf, failed))
print(string.rep("=", 80))

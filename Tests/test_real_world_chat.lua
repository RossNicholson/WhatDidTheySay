#!/usr/bin/env lua5.1
-- Test with real-world chat log messages

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

-- Real-world chat messages (extracted from log)
local testMessages = {
    "SUCHE 1 HEILER SFK - High-Level Tank vorhanden",
    "SUCHE PORT NACH SW",
    "kleine legenden pls inv",
    "WTB Port nach Dar und danach wieder zurück nach SW",
    "Ist der Ony-Buff schon passiert?",
    "Verzaubere Handschuhe 15 Beweglichkeit / Waffe 15 Beweglichkeit / Armschiene 15 Ausdauer / Umhang 15 Resi / Stiefel: kleiner Lauftempo-Bonus, eure Mats!",
    "suche level Gilde",
    "Portal nach Darnassus nach dem Buff, flüstert mir \"inv\"! Trinkgeld gern gesehen! Danke :>",
    "ZG ist noch nicht geprocct?",
    "{Square}Verzauberer LFW{Square} FEURIG+TEMPO / Stiefel +5 AGI +7 Ausd / Armschiene +9 Str +9 Ausd +7 INT / Brust +3 Werte +100 HP und vieles mehr. Eure Mats, Trinkgeld gern gesehen",
    "LFM 1 Tank 1 DD Gnomeregan Q-Run",
    "Verzauberer hier?",
    "WTB Derwischschiftung des Falken",
    "{star} Öffne alle eure Schlosskisten in SW {star} Trinkgeld nicht nötig, aber gern gesehen {star}",
    "WTS 7 Transmutes 40g",
    "SUCHE SW-Port",
    "WTB BB Summon",
    "WTB: BB Port",
    "SUCHE GRUPPE DM DPS/TANK",
    "WTB Port nach BB JETZT",
    "SUCHE Port nach BB",
    "BB Summon pls",
    "WTS Elementar-Schärfstein + Stab des Jordan",
    "bb summon für niedliche Gnomin",
    "SUCHE Hexer für Summon, wir haben Klicker :)",
    "{diamond} Booty Bay Summon 2g /w \"inv\" für Summon {diamond}",
    "LFM DM Heiler Tank DPS",
    "SUCHE Kreuzfahrer-Verzauberer",
    "SUCHE GRUPPE RFK oder Gnome als DPS oder Tank",
    "SUCHE Verzauberer für Kreuzfahrer",
    "Magier LFW. Hauptstadt-Portale je 1g.",
    "WTB Dar-Port und danach wieder zurück nach SW",
    "WTB Port nach SW für mich und meinen Freund 1g, von Darnassus",
    "WTB BB PORT",
    "SUCHE BB-Port",
    "WTB BB Summon",
    "SUCHE Port nach BB, zahle 1g",
    "SUCHE Port nach BB pls",
    "WTS BB PORT ZG BUFF UM 23 CET - /w me",
    "WTB BB Port",
    "SUCHE Verzauberer für Waffe verzaubern - Geringes Schlagen",
    "Worldbuff schon durch?",
    "Wenn BB Summon, dann bitte nicht die kapitalistischen ;)",
    "{Circle} Verkaufe BB Summon 1g {circle}",
    "SUCHE Schmied zum Anbringen von Eisengegengewicht",
    "SUCHE Hexer für Summon :)",
    "WTS Verzauberte Runenstofftasche",
    "Der Tod ist permanent, bleibt am Leben. Stiefel +7 AGI / kleiner Lauftempo-Bonus / +5 Ausd, Armschienen +7 Str, Brust +3 alle Werte oder Überragendes Mana & Leben, Handschuhe +1% AS oder +5 Leben, Waffe +4 Schaden, Schild +7 Willenskraft und mehr. Schnell, Trinkgeld gern gesehen. /w me",
    "SUCHE BB Summon",
    "SUCHE Port nach BB pls",
    "SUCHE 1 (Heiler) für SFK",
    "SUCHE BB Port",
    "LFM DM Heiler DPS oder Tank",
    "WTB BB SUM",
    "WTB BB Summon 1g",
    "{star} Öffne alle eure Schlosskisten in SW {star} Trinkgeld nicht nötig, aber gern gesehen {star}",
    "WTB BB SUMM!",
    "WTB SUM BB !!!",
    "irgendwelche BB Summons?",
    "WTB BB SUM",
    "WTB BB Summon",
    "WTB Summon BB 1 Gold",
    "LFM BFD, flüster mir",
    "WTB BB Summon",
    "WTB BB Port 1g",
    "SUCHE BB Port",
    "SUCHE Hexer für Summon nach SW :)",
    "SUCHE Portal nach Darnassus",
    "SUCHE Port nach BB",
    "jemand ne kollekte für verdreckte ?",
    "SUCHE Port nach SW von Darnassus, zahle 1 Gold",
    "SUCHE 1 HEILER ST High-Level Gruppe",
    "WTS Teufelssauriergamaschen - flüster mich an",
    "WTS Teufelssaurierstulpen - flüster mich an",
    "WTS Verzauberte Runenstofftasche",
    "SUCHE Portal in Darnassus",
    "WTB Port nach BB",
    "BB Summon 1g",
    "BRAUCHE TP BB",
    "WTB BB Summon 1 Gold",
    "Magier LFW. Hauptstadt-Portale je 1g.",
    "WTB BB Summon",
    "WTB Summon BB",
    "WTB Port nach SW nach dem Buff",
    "LFM 1 Tank ZF, wir haben den Hammer",
    "SUCHE Verzauberer für Formel: Umhang verzaubern (Verstohlenheit), hab Mats + Trinkgeld",
    "WTB Summon nach BB",
    "WTS Arkanitbarren CD 5g",
    "WTB Arkanit-CD",
    "WTB BB Summon 1g",
    "SUCHE Verzauberer für Waffe verzaubern - Geringes Schlagen",
    "WTB BB Summon",
    "Kann ich mir von jemanden eine Tasche schnorren?",
    "War Ony früh dran?",
    "Suche deutsche aktive Gilde gerne /w",
    "WTB BB Summon, zahle 1g",
    "SUCHE Portal von Darn nach SW :s",
    "WTS Verzauberte Runenstofftasche",
    "SUCHE 1 HEILER ST High-Level Gruppe",
    "WTS BB PORT ZG BUFF UM 23 CET - /w me",
    "SUCHE Hexer für Summon nach SW :) wir haben Klicker",
    "Kann mir jemand eine Tasche geben?",
    "WTS Teufelssaurierstulpen - flüster mich an",
    "LFM BSF",
    "WTS BB Summon 2g /w inv",
    "WTS Teufelssauriergamaschen - flüster mich an",
    "SUCHE 1 Tank DM",
    "SUCHE VZ für Minor Speed auf Stiefel, hab Mats + TG",
    "SUCHE Port nach BB",
    "Verzaubere eure Armschienen +5 Stärke für 10 Silber, kommt nach SW",
    "SUCHE BB Port",
    "WTB Port von SW nach DN",
    "SUCHE Port BB",
    "IRGENDWELCHE SCHMIEDE?",
    "SW Port invite pls",
    "wtf ist VZ",
    "SUCHE Schneider für 6-Slot Taschen in SW (hab Mats)",
    "SUCHE Tank Strat live",
    "SUCHE Tank DM, dann weiter 4/5",
    "SUCHE 1 HEILER Stockades",
    "SUCHE +55 Heilung Verzauberer",
    "SUCHE SW Portal nach dem Buff - gebe Trinkgeld",
    "LFM Heiler für Kral",
    "SUCHE BB Port, zahle!",
    "kann mir jemand kl. Taschen spendieren/besorgen?",
    "Schurke SUCHE GRUPPE Stockades",
    "LFM Stockades Heiler und Add 3/5",
    "wo ist der Buff",
    "WTS BB PORT ZG BUFF UM 23 CET - /w me",
    "SUCHE BB Port, zahle!",
    "LFM HEILER FÜR STOCKADES",
    "SUCHE Port BB 60s",
    "Verkaufe Umhang - Große Verteidigung",
    "SUCHE Port nach BB",
    "SUCHE BB Port pls",
    "SUCHE Tank und Heiler und 1 Leder-DD für SM Lib und Armory",
    "schnell",
    "BB Port, ich zahl",
    "Wie bekommt man das als Ally? Muster: Kodobalgtasche",
    "SUCHE Heiler [Crushridge-Kriegstreiber (504)]",
    "LFM letzter Spot Tank Lib, Armory und Cath",
    "SUCHE Heiler für Stockades, dann weiter",
    "SUCHE BB Port pls",
    "Magier LFW. Hauptstadt-Portale je 1g.",
    "irgendein Heiler für Stockades? letzter Spot",
    "wtf Port oder Summon nach SW von Darnassus, zahle 1g",
    "Kann mir jemand bei der Krieger-Quest in Elwynn helfen?",
    "kann jmd steel weapon chain für mich craften und anwenden?",
    "LFM BFD / Blackfathom",
    "SUCHE DPS oder Tank DM, dann weiter 4/5",
    "LFM noch ein DD für Stockades",
    "WTB SW Port, pm pls",
    "SUCHE GRUPPE DPS DM",
    "LFM [Beschwören der Prinzessin (656)]",
    "+55 Heilung Waffe Verzauberer",
    "Ony um 23:15",
    "SUCHE TANK + Heiler für Stockades",
    "LFM 1 Tank ZF, wir haben den Hammer",
    "jemand [GESUCHT: Vorarbeiter Maltorius (7701)]?",
    "DPS SUCHE GRUPPE Stockades",
    "WTS Elementar-Magierstab",
    "{Square}Verzauberer LFW{Square} FEURIG+TEMPO / Stiefel +5 AGI +7 Ausd / Armschiene +9 Str +9 Ausd +7 INT / Brust +3 Werte +100 HP und vieles mehr. Eure Mats, Trinkgeld gern gesehen",
    "LFM BFD / Blackfathom",
    "Suche Schneider für 6 Slot Bags in SW (hab Mats + kleines TG)",
    "Suche nette gilde :)",
    "SUCHE TANK + Heiler für Stockades",
    "SUCHE Tank für DM /w me :)",
    "Stelle her/verkaufe Titanic Leggings, Demon Forged Breastplate",
    "WTS Whirlwind Axe Quest Boost",
    "LFM 1 DD für Stockades",
    "Falls jmd Linen Cloth im Inventar stört, ich würds nehmen xD",
    "SUCHE GRUPPE [Mercenaries (255)] [WANTED: Chok'sul (256)]",
    "kommt ein Ony-Buff?",
    "WTS choco boxes. 50g wach",
    "SUCHE Verzauberer für Formel: Umhang verzaubern (Verstohlenheit), hab Mats + Trinkgeld",
    "SUCHE TANK + Heiler für Stockades",
}

print("=" .. string.rep("=", 80))
print("Real-World Chat Log Translation Test")
print("=" .. string.rep("=", 80))
print()

local translated = 0
local skipped = 0
local failed = 0
local lowConf = 0

for i, msg in ipairs(testMessages) do
    local result, confidence, reason = WDTS_Engine.Translate(msg, nil, "en", true)
    
    if result then
        if confidence >= 0.50 then
            translated = translated + 1
            print(string.format("✓ [%.2f] %s", confidence, msg:sub(1, 65)))
            print(string.format("  → %s", result:sub(1, 75)))
        else
            lowConf = lowConf + 1
            print(string.format("⚠ [%.2f] %s", confidence, msg:sub(1, 65)))
            print(string.format("  → %s", result:sub(1, 75)))
        end
    else
        skipped = skipped + 1
        -- Only show skipped if it's not obviously English
        if reason ~= "already_english" and reason ~= "english_greeting" then
            print(string.format("❌ [SKIP] %s (reason: %s)", msg:sub(1, 65), reason or "unknown"))
        end
    end
end

print()
print("=" .. string.rep("=", 80))
print(string.format("Results: %d translated (≥0.50), %d low confidence (<0.50), %d skipped", 
    translated, lowConf, skipped))
print(string.format("Success rate: %.1f%% translated", (translated / #testMessages) * 100))
print("=" .. string.rep("=", 80))

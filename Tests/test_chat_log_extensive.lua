#!/usr/bin/env lua5.1
-- Test extensive chat log messages

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

-- German messages from chat log
local testMessages = {
    "suche level Gilde",
    "Worldbuff schon durch?",
    "lf blacksmith to apply Eisengegengewicht",
    "jemand ne kollekte für verdreckte ?",
    "Kann ich mir von jemanden eine Tasche schnorren?",
    "Suche deutsche aktive Gilde gerne /w",
    "kann mir jemand kl. Taschen spendieren/besorgen?",
    "Suche Schneider für 6 Slot Bags in SW (hab Mats + kleines TG)",
    "Suche nette gilde :)",
    "Lf Tank für DM /w me :)",
    "Falls jmd Linen Cloth im Inventar stört, ich würds nehmen xD",
    "ist Ogermagierstab brauchbar oder kann ich das einfach beim händler verkaufen?",
    "Könnte 10er taschen machen",
    "kann mich gleich einer von Westfall strand begleiten nach sturmwind bin lvl 1 Priest würde auch Gold zahlen",
    "was hast denn vor? :D",
    "VZ in SW > Waffe: KREUZ /FEURIGE /+55HP /25agi-2H | Brust: 3stats, 100hp/mana | Handgelenk: 24heal, 7int, 9str/sta | Hände: 7str/agi, Reitfertigkeit | Füße: Geschwindigkeit, 7agi/sta | Schild: 2%blk, 7sta | Rücken: 5allres, 3agi (mat mitbringen)",
    "jemand da zum öffnen von 8xThoriumschließkassette ?",
    "Selling Umhang - Große Verteidigung",
    "WTS Beinschützer des Traumsängers4g",
    "WTS Mur des morts",
    "WTS Feurige Kriegsaxt 100g",
    "WTS Moorring des Tigers",
    "LFM [Beschwören der Prinzessin (656)]",
    "lfm [[48] Die Erlösung von Scrimshank (10)] / Escort Q in Tanaris",
    "lfm/lfg [[40] Colonel Kurzen (202)]",
}

print("=" .. string.rep("=", 80))
print("Extensive Chat Log Translation Test")
print("=" .. string.rep("=", 80))
print()

local translated = 0
local lowConf = 0
local skipped = 0

for i, msg in ipairs(testMessages) do
    local result, confidence, reason = WDTS_Engine.Translate(msg, nil, "en", true)
    
    print(string.format("Test %d/%d: %s", i, #testMessages, msg:sub(1, 70)))
    
    if result then
        if confidence >= 0.50 then
            translated = translated + 1
            print(string.format("  ✓ [%.2f] %s", confidence, result:sub(1, 75)))
        else
            lowConf = lowConf + 1
            print(string.format("  ⚠ [%.2f] %s", confidence, result:sub(1, 75)))
        end
    else
        skipped = skipped + 1
        if reason ~= "already_english" and reason ~= "english_greeting" then
            print(string.format("  ❌ [SKIP] Reason: %s", reason or "unknown"))
        end
    end
    print()
end

print("=" .. string.rep("=", 80))
print(string.format("Results: %d translated (≥0.50), %d low confidence (<0.50), %d skipped", 
    translated, lowConf, skipped))
print(string.format("Success rate: %.1f%% translated", (translated / #testMessages) * 100))
print("=" .. string.rep("=", 80))

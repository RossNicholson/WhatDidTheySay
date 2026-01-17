#!/usr/bin/env lua5.1
-- Test AI-generated guild chat messages

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

-- AI-generated guild chat messages
local testMessages = {
    "jmd grad Lag gehabt?",
    "pls sag nein, bin im cave",
    "rip",
    "lebt noch, HS inc",
    "ding 24 💪",
    "gz",
    "danke, nur grüne mobs 😂",
    "reminder: KEIN AFK in Duskwood",
    "zu spät",
    "…",
    "Worgen respawn 😐",
    "weiß jmd ob VanCleef cleaves?",
    "ja",
    "ok dann lieber später 😅",
    "mein Mage ist gestern bei 29 gestorben",
    "wie?",
    "2 pulls statt 1",
    "Klassiker",
    "LFM DM HC, need Heal + DPS",
    "welches lvl?",
    "18-22, bitte brain benutzen",
    "ich hasse Höhlen",
    "alle hassen Höhlen",
    "mobs kommen einfach aus der Wand",
    "ja",
    "DM Run heute Abend?",
    "only wenn alle target dummies haben",
    "fair",
    "Tipp: immer Swiftness Pots dabei",
    "oder Dummy",
    "oder beides",
    "oder logout 😄",
    "HC macht mich paranoid",
    "same",
    "hab 10 min auf respawn gewartet",
    "good play",
    "RIP Krag lvl 17",
    "F",
    "murlocs",
    "immer murlocs",
    "warum hitten Gnolle so hart",
    "because HC",
    "überzeugend",
    "chest gelootet, grüne Schultern",
    "erst in Town equippen",
    "stimmt, sonst RIP",
    "skippe grad 3 quests",
    "wise choice",
    "cave + escort = nope",
    "wieder einer bei Hogger gestorben",
    "Hogger > Spieler",
    "ist Schwimmen risky?",
    "ja",
    "warum",
    "DC + Ertrinken",
    "hyperspawn fast RIP",
    "wo?",
    "überall, Barrens",
    "WTS 6 Slot Bags",
    "nehme",
    "inv voll macht nervös",
    "Quest geskippt wegen Elite",
    "HC approved",
    "hab mehr Angst vor DC als vor Mobs",
    "DC ist Endboss",
    "duelliert hier eig noch jmd?",
    "niemals",
    "dachte ich mir",
    "ist hearth bei 30% lame?",
    "nein",
    "das ist leben wollen",
    "vermisse YOLO pulls",
    "die vermissen dich nicht",
    "hab endlich nen blauen gecraftet",
    "gz",
    "screenshot machen",
    "stimmt 😄",
    "jedes Mal wenn ich chest loote, dreh ich die Kamera",
    "richtig so",
    "rerolle heute",
    "welche Klasse?",
    "wieder Mage",
    "mutig",
    "nicht autorun + chatten",
    "wer?",
    "ich 😐",
    "HC hat mir normales WoW kaputt gemacht",
    "same",
    "ohne Risiko fühlt sich alles egal an",
}

print("=" .. string.rep("=", 80))
print("AI-Generated Guild Chat Translation Test")
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

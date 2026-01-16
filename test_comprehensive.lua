#!/usr/bin/env lua5.1
-- Comprehensive test suite - real-world WoW chat scenarios

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
loadFile("Languages/de/tokens.lua")
loadFile("Languages/de/intents.lua")
loadFile("Languages/de/patterns.lua")
loadFile("Languages/de/grammar.lua")
loadFile("Languages/de/phrases.lua")

WDTS_Engine.Initialize()

-- Comprehensive test cases based on real WoW chat
local testCases = {
    -- === LFG / Group Finding ===
    {msg = "suche gruppe für DM", desc = "Basic LFG - Deadmines", expect = "looking for group for"},
    {msg = "LFM Tank für SFK", desc = "LFM with role and dungeon", expect = "tank"},
    {msg = "LF1M Heal für Gnomer", desc = "LF1M with role", expect = "heal"},
    {msg = "brauche noch 2 für Mara", desc = "Need more members", expect = "need"},
    {msg = "suche tank und heal für BRD", desc = "Multiple roles", expect = "tank"},
    {msg = "LFG UBRS", desc = "Simple LFG abbreviation", expect = "lfg"},
    {msg = "LF Tank für ST", desc = "LFG mixed language", expect = "tank"},
    {msg = "Heal Ifg Todesminen", desc = "Mixed language LFG", expect = "heal"},
    {msg = "sucht für LBRS", desc = "Short LFG", expect = "looking for"},
    {msg = "If tank heal dm dann abfahrt", desc = "Mixed language with timing", expect = "tank"},
    
    -- === Trading / Crafting ===
    {msg = "schmied gesucht für Eisenschildstachel", desc = "Blacksmith crafting request", expect = "blacksmith"},
    {msg = "schneider der [Small Silk Pack] kann? /w", desc = "Tailor with item link", expect = "tailor"},
    {msg = "brauch alchemist für [Heiltrank]", desc = "Alchemist request", expect = "alchemist"},
    {msg = "sucht verzauberer für [Waffe]", desc = "Enchanter request", expect = "enchanter"},
    {msg = "suche vz für feurige waffe", desc = "Enchantment abbreviation", expect = "enchantment"},
    {msg = "WTS [Blanchard Schädelbrecher]", desc = "WTS item", expect = "wtb"},
    {msg = "was kostet [Item]?", desc = "Price question", expect = "what"},
    {msg = "verkaufe [Item] für 50g", desc = "Selling item", expect = "selling"},
    {msg = "kaufe [Item] für 20g", desc = "Buying item", expect = "buying"},
    
    -- === Guild / Social ===
    {msg = "Du suchst eine aktive, deutsche Gilde?", desc = "Guild recruitment question", expect = "you"},
    {msg = "suche deutsche gilde", desc = "Looking for German guild", expect = "german guild"},
    {msg = "gilde sucht aktive spieler", desc = "Guild recruiting", expect = "guild"},
    {msg = "kann uns jemand mit einer spende für unseren gildenrock unterstützen bitte", desc = "Donation request", expect = "donation"},
    {msg = "suche deutsche levelgilde", desc = "Looking for leveling guild", expect = "leveling guild"},
    
    -- === Questions / Requests ===
    {msg = "kannst du mir helfen?", desc = "Help request", expect = "can you"},
    {msg = "wer kann mir helfen?", desc = "Who can help", expect = "who"},
    {msg = "wo treffen wir uns?", desc = "Where to meet", expect = "where"},
    {msg = "wann kommt der nächste worldbuff?", desc = "When question", expect = "when"},
    {msg = "kannst du mich einladen?", desc = "Invite request", expect = "invite"},
    {msg = "kannst du mich rufen?", desc = "Summon request", expect = "summon"},
    
    -- === Status / Ready ===
    {msg = "bin bereit", desc = "Ready status", expect = "ready"},
    {msg = "r", desc = "Short ready", expect = "ready"},
    {msg = "fertig", desc = "Finished/ready", expect = "ready"},
    {msg = "warte bitte", desc = "Wait request", expect = "wait"},
    {msg = "komm hier", desc = "Come here", expect = "come"},
    
    -- === Character Death / Hardcore ===
    {msg = "meine Jägerin ist gestorben", desc = "Character death", expect = "huntress"},
    {msg = "ist eben gestorben", desc = "Just died", expect = "just died"},
    {msg = "benötige Gold oder Taschen", desc = "Need gold/bags", expect = "need"},
    
    -- === Bank / Storage ===
    {msg = "einfach nen bank char machen", desc = "Bank character advice", expect = "bank character"},
    {msg = "lagere gold und mats", desc = "Storing items", expect = "store"},
    
    -- === Mixed Language ===
    {msg = "Kann man als Alli HDW gehen?", desc = "Can Alliance go to dungeon", expect = "alliance"},
    {msg = "LF Tank für ST", desc = "Mixed LFG", expect = "tank"},
    {msg = "If tank heal dm dann abfahrt", desc = "Mixed with German", expect = "tank"},
    
    -- === Common Phrases ===
    {msg = "danke dir", desc = "Thank you", expect = "thank"},
    {msg = "bitte schön", desc = "You're welcome", expect = "please"},
    {msg = "kein problem", desc = "No problem", expect = "no problem"},
    {msg = "viel glück", desc = "Good luck", expect = "good luck"},
    
    -- === Typo / Colloquial ===
    {msg = "schmied gesucht cht für item", desc = "Typo in message", expect = "blacksmith"},
    {msg = "bitti", desc = "Typo for bitte", expect = "please"},
    {msg = "brauch", desc = "Colloquial brauche", expect = "need"},
    
    -- === Complex Sentences ===
    {msg = "Huhu, meine Jägerin (34) ist eben gestorben:(, und benötige nun als zukünftige Priesterin etwas Gold oder Taschen.", desc = "Long death message", expect = "huntress"},
    {msg = 'Du suchst eine aktive, deutsche Gilde? Komm zu "Legenden der Allianz" und genieße täglich organisierte World Buffs, Innis & Quests!', desc = "Full guild recruitment", expect = "you"},
}

print("=" .. string.rep("=", 80))
print("Comprehensive Translation Testing - Real WoW Chat Scenarios")
print("=" .. string.rep("=", 80))
print()

local passed = 0
local failed = 0
local lowConf = 0
local totalWords = 0
local translatedWords = 0

for i, test in ipairs(testCases) do
    local translated, confidence, intent = WDTS_Engine.Translate(test.msg, nil, "en", true)
    
    -- Count vocabulary coverage
    local tokens = WDTS_Tokenizer.Tokenize(test.msg)
    local langPack = WDTS_Engine.LoadLanguagePack("de")
    local words = 0
    local matched = 0
    for _, token in ipairs(tokens) do
        if token.type == "word" then
            words = words + 1
            if langPack.tokens[token.value] then
                matched = matched + 1
            end
        end
    end
    totalWords = totalWords + words
    translatedWords = translatedWords + matched
    
    local coverage = words > 0 and (matched / words) or 0
    local status = ""
    local passed_test = false
    
    if not translated then
        status = "❌ FAIL - No translation"
        failed = failed + 1
    elseif translated:lower():find(test.expect:lower(), 1, true) then
        if confidence >= 0.45 then
            status = "✓ PASS"
            passed = passed + 1
            passed_test = true
        else
            status = string.format("⚠ LOW CONF (%.2f)", confidence)
            lowConf = lowConf + 1
        end
    else
        status = string.format("✗ WRONG (expected '%s')", test.expect)
        failed = failed + 1
    end
    
    if not passed_test and (confidence or 0) < 0.45 then
        -- Show details for failures
        print(string.format("%s Test %d/%d: %s", status, i, #testCases, test.desc))
        print(string.format("   Input: %s", test.msg:sub(1, 60) .. (#test.msg > 60 and "..." or "")))
        if translated then
            print(string.format("   Output: %s", translated:sub(1, 60) .. (#translated > 60 and "..." or "")))
            print(string.format("   Confidence: %.2f | Coverage: %.0f%% (%d/%d words)", confidence, coverage*100, matched, words))
        else
            print(string.format("   Reason: %s", intent or "unknown"))
        end
        print()
    end
end

print("=" .. string.rep("=", 80))
print(string.format("Results: %d passed, %d low confidence, %d failed", passed, lowConf, failed))
print(string.format("Overall vocabulary coverage: %.1f%% (%d/%d words)", 
    totalWords > 0 and (translatedWords/totalWords)*100 or 0, translatedWords, totalWords))
print("=" .. string.rep("=", 80))

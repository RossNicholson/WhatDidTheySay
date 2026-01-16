#!/usr/bin/env lua5.1
-- Real-world WoW chat testing - edge cases and common player messages

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

-- Real-world scenarios players actually type
local testCases = {
    -- === Common LFG Variations ===
    {msg = "LFM 2 DPS für BRD", desc = "LFM with number and role", category = "LFG"},
    {msg = "suche noch tank und heal", desc = "Need specific roles", category = "LFG"},
    {msg = "brauche noch einen heiler", desc = "Need one healer", category = "LFG"},
    {msg = "LF1M Tank für DM", desc = "LF1M format", category = "LFG"},
    {msg = "suche gruppe für UBRS (60)", desc = "LFG with level requirement", category = "LFG"},
    {msg = "sucht jemand für SFK?", desc = "LFG question format", category = "LFG"},
    {msg = "wer kann mit zu DM?", desc = "Who can come to dungeon", category = "LFG"},
    {msg = "brauch noch 3 für Strat", desc = "Need more members", category = "LFG"},
    
    -- === Trading / Crafting Real-World ===
    {msg = "WTS [Flammenschwert] 200g", desc = "WTS with price", category = "Trading"},
    {msg = "WTB [Verzauberte Glocke]", desc = "WTB item", category = "Trading"},
    {msg = "verkaufe verschiedene items", desc = "Selling various items", category = "Trading"},
    {msg = "kaufe [Tuch] stapelweise", desc = "Buying in bulk", category = "Trading"},
    {msg = "schneider gesucht für taschen", desc = "Tailor for bags", category = "Trading"},
    {msg = "brauche jemand der mir ein item enchanten kann", desc = "Need enchanter", category = "Trading"},
    {msg = "kann mir jemand [Item] craften?", desc = "Can someone craft item", category = "Trading"},
    {msg = "was kostet das?", desc = "What does it cost", category = "Trading"},
    {msg = "preis für [Item]?", desc = "Price for item", category = "Trading"},
    
    -- === Guild / Social Real-World ===
    {msg = "gilde sucht aktive mitglieder", desc = "Guild recruiting members", category = "Guild"},
    {msg = "wer sucht eine gilde?", desc = "Who is looking for guild", category = "Guild"},
    {msg = "wir suchen neue leute für unsere gilde", desc = "We're looking for new people", category = "Guild"},
    {msg = "aktive deutsche gilde sucht dich", desc = "Active German guild wants you", category = "Guild"},
    {msg = "komm in unsere gilde", desc = "Come to our guild", category = "Guild"},
    
    -- === Questions / Help Requests ===
    {msg = "wo ist [Ort]?", desc = "Where is location", category = "Questions"},
    {msg = "kannst du mich einladen?", desc = "Can you invite me", category = "Questions"},
    {msg = "kann jemand mich porten?", desc = "Can someone port me", category = "Questions"},
    {msg = "wer kann mir helfen?", desc = "Who can help me", category = "Questions"},
    {msg = "brauche hilfe bei quest", desc = "Need help with quest", category = "Questions"},
    {msg = "wo treffen wir uns?", desc = "Where do we meet", category = "Questions"},
    {msg = "wann starten wir?", desc = "When do we start", category = "Questions"},
    {msg = "was muss ich tun?", desc = "What do I need to do", category = "Questions"},
    
    -- === Status / Coordination ===
    {msg = "bin gleich da", desc = "I'll be right there", category = "Status"},
    {msg = "komme in 5 minuten", desc = "Coming in 5 minutes", category = "Status"},
    {msg = "warte auf mich", desc = "Wait for me", category = "Status"},
    {msg = "bin fast fertig", desc = "Almost done", category = "Status"},
    {msg = "habe keine zeit mehr", desc = "Don't have time anymore", category = "Status"},
    {msg = "muss leider gehen", desc = "Unfortunately have to go", category = "Status"},
    
    -- === Combat / Raid Coordination ===
    {msg = "geh nach links", desc = "Go left", category = "Combat"},
    {msg = "komm hierher", desc = "Come here", category = "Combat"},
    {msg = "warte bitte", desc = "Wait please", category = "Combat"},
    {msg = "bin bereit", desc = "I'm ready", category = "Combat"},
    {msg = "habe kein mana mehr", desc = "Out of mana", category = "Combat"},
    {msg = "gehe in ruhe", desc = "Going AFK", category = "Combat"},
    
    -- === Common Short Phrases ===
    {msg = "danke", desc = "Thanks", category = "Social"},
    {msg = "bitte", desc = "Please", category = "Social"},
    {msg = "gerne", desc = "Gladly/You're welcome", category = "Social"},
    {msg = "tschüss", desc = "Bye", category = "Social"},
    {msg = "bis später", desc = "See you later", category = "Social"},
    {msg = "bis gleich", desc = "See you soon", category = "Social"},
    
    -- === Typos / Informal ===
    {msg = "tschau", desc = "Bye (informal)", category = "Informal"},
    {msg = "yo", desc = "Yo (greeting)", category = "Informal"},
    {msg = "hey", desc = "Hey", category = "Informal"},
    {msg = "hi", desc = "Hi", category = "Informal"},
    {msg = "ok", desc = "OK", category = "Informal"},
    {msg = "okay", desc = "Okay", category = "Informal"},
    
    -- === Mixed Language Variations ===
    {msg = "LF Mage für Gnomer", desc = "LF with class", category = "Mixed"},
    {msg = "brauche help", desc = "Need help (mixed)", category = "Mixed"},
    {msg = "kommst du mit zu DM?", desc = "Are you coming to DM", category = "Mixed"},
    {msg = "wann gehts los?", desc = "When does it start", category = "Mixed"},
    
    -- === Hardcore / Death Related ===
    {msg = "mein char ist tot", desc = "My character is dead", category = "Hardcore"},
    {msg = "ist gerade gestorben", desc = "Just died", category = "Hardcore"},
    {msg = "brauche startgeld", desc = "Need starting gold", category = "Hardcore"},
    {msg = "kann mir jemand gold leihen?", desc = "Can someone lend me gold", category = "Hardcore"},
    
    -- === Quest / World ===
    {msg = "mache gerade quest", desc = "Doing quest right now", category = "Quest"},
    {msg = "suche gruppe für quest", desc = "Looking for quest group", category = "Quest"},
    {msg = "brauche noch item für quest", desc = "Still need item for quest", category = "Quest"},
}

print("=" .. string.rep("=", 80))
print("Real-World WoW Chat Testing - Edge Cases & Common Messages")
print("=" .. string.rep("=", 80))
print()

local passed = 0
local failed = 0
local lowConf = 0
local totalWords = 0
local translatedWords = 0

-- Group by category
local byCategory = {}
for _, test in ipairs(testCases) do
    if not byCategory[test.category] then
        byCategory[test.category] = {}
    end
    table.insert(byCategory[test.category], test)
end

for category, tests in pairs(byCategory) do
    print(string.format("\n=== %s (%d tests) ===", category, #tests))
    
    for i, test in ipairs(tests) do
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
        
        if not translated then
            status = "❌"
            failed = failed + 1
        elseif confidence >= 0.50 then
            status = "✓"
            passed = passed + 1
        elseif confidence >= 0.30 then
            status = "⚠"
            lowConf = lowConf + 1
        else
            status = "✗"
            failed = failed + 1
        end
        
        -- Only show failures and low confidence
        if not translated or confidence < 0.50 then
            print(string.format("  %s %s (conf: %.2f, cov: %.0f%%)", 
                status, test.desc, confidence or 0, coverage * 100))
            if translated then
                print(string.format("     → %s", translated:sub(1, 60) .. (#translated > 60 and "..." or "")))
            end
        end
    end
end

print("\n" .. string.rep("=", 80))
print(string.format("Results: %d passed, %d low confidence, %d failed", passed, lowConf, failed))
print(string.format("Overall vocabulary coverage: %.1f%% (%d/%d words)", 
    totalWords > 0 and (translatedWords/totalWords)*100 or 0, translatedWords, totalWords))
print(string.rep("=", 80))

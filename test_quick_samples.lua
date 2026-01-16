#!/usr/bin/env lua5.1
-- Quick sample tests from the chat log

local function loadAll()
    _G = _G or {}
    _G.WhatDidTheySayDB = { enabledLanguagePacks = { de = true } }
    _G.GetTime = function() return os.time() end
    _G.GetChannelList = function() return end
    _G.IsInRaid = function() return false end
    _G.select = select
    
    local function loadFile(path)
        local file = io.open(path, "r")
        local content = file:read("*all")
        file:close()
        local func = loadstring(content, path)
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
end

loadAll()

-- Key messages from the log
local samples = {
    "LFM HDW (19+) 1 DD und Tank, wir porten dann",
    "suche vz für feurige waffe",
    "pala lvl 20 sucht gruppe für DM",
    "Suche Deutsche Levelgilde",
    "kann uns jemand mit einer spende für unseren gildenrock unterstützen bitte",
    "1 DD Verlies",
    "Ein Hexenmeister Lust auf HDW?",
    "jemand in sw der mir kurz ne qest helfen kann 30-40 bitte",
}

print("Quick Sample Tests from Chat Log:\n")
for i, msg in ipairs(samples) do
    local trans, conf, intent = WDTS_Engine.Translate(msg, nil, "en", true)
    if trans then
        local status = conf >= 0.50 and "✓" or conf >= 0.30 and "⚠" or "✗"
        print(string.format("%s [%.2f] %s", status, conf, msg))
        print(string.format("   → %s\n", trans:sub(1, 70)))
    else
        print(string.format("✗ [%.2f] %s", conf or 0, msg))
        print(string.format("   Reason: %s\n", intent or "unknown"))
    end
end

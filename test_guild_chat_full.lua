#!/usr/bin/env lua5.1
-- Test all German messages from the full guild chat log

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
    if io.open("Languages/de/phrases.lua") then
        loadFile("Languages/de/phrases.lua")
    end
    WDTS_Engine.Initialize()
end

loadAll()

-- Messages from the chat log
local messages = {
    "erstes Haus links in SW",
    "wenn du in sw reinkommst erste haus links",
    "bin da, aber seh euch nicht",
    "veileicht anderes Layer",
    "kleri...inv mal pls",
    "braucht ihr die 8er taschen? pipe und belwar ?",
    "danke ich hab 8er und 10er",
    "geb dir gleich was zum verteilen",
    "Nephilim, brauchst du 8er taschen ?",
    "Ich könnte zwei 8er Taschen gut gebrauchen",
}

print("Full Guild Chat Review:\n")
print("=" .. string.rep("=", 70))

for i, msg in ipairs(messages) do
    print("\nMessage " .. i .. ":")
    print("  Original: " .. msg)
    
    local translated, confidence, reason = WDTS_Engine.Translate(msg, nil, "en", true)
    if translated then
        local status = confidence >= 0.50 and "✓" or confidence >= 0.30 and "⚠" or "✗"
        print("  " .. status .. " Translation: " .. translated)
        print("  Confidence: " .. string.format("%.2f", confidence))
        if reason then
            print("  Intent: " .. reason)
        end
    else
        print("  ✗ No translation")
        print("  Confidence: " .. string.format("%.2f", confidence or 0))
        if reason then
            print("  Reason: " .. reason)
        end
    end
    print("")
end

print("=" .. string.rep("=", 70))

#!/usr/bin/env lua5.1
-- Test relevant messages from the chat log

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

-- Relevant German messages from chat log
local messages = {
    "[Lhiandra]: Möchte wer Verlies gehen?",
    "[Porzelank]: Die deutsche Gilde <Paragon> rekrutiert Mitstreiter ab Mindest Lvl 20 für gemeinsame Unternehmungen, wie Leveln, Dungeons und zukünftig raiden /w me",
    "[Niightty]: noch nicht mal angefangen xd",
}

print("Chat Log Review - German Messages:\n")
print("=" .. string.rep("=", 70))

for i, msg in ipairs(messages) do
    -- Extract just the message part (after the player name)
    local messageOnly = msg:match("%]:%s*(.+)$") or msg
    print("\nMessage " .. i .. ":")
    print("  Original: " .. messageOnly)
    
    local translated, confidence, reason = WDTS_Engine.Translate(messageOnly, nil, "en", true)
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

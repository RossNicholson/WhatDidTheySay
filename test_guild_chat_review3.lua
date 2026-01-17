#!/usr/bin/env lua5.1
-- Test all German messages from the third guild chat log review

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
    "Loch Modan warst du schon?",
    "in 4 min bin ich am flugplatz von if",
    "oh ich versuche es mal in westfall.. bin jetzt fast da. wenn was passiert seht ihr es ja x)",
    "einfach safe spielen und nicht zuuuu viel wollen",
    "lochmodan hab ich nur 2-3 quests machen können",
    "lieber langsamer aber dafür safe",
    "einfach nicht südlich der Base in Westfall gehen, und vorsicht am wasser xD",
    "und vorsicht vor trappern und pillagern ^^",
    "also vorsicht vor allem eigentlich haha",
    "ne die besonders xD",
}

print("Guild Chat Review 3:\n")
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

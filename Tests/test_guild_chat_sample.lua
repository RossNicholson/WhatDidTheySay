#!/usr/bin/env lua5.1
-- Test guild chat messages from screenshot

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

-- Guild chat messages from screenshot
local testMessages = {
    "von schon bald da :D",
    "ich flieg schonmal nach westfall",
    "oki :)",
    "Danke schicke dir dann mit meinem hohen char etwas Taschengeld :D",
    "bin auch eben in westfall angekommen falls mehr guards benötigt werden^^",
    "ach das schaff ich schon^^",
    ":D",
    "oh jo ich seh gerade^^+",
}

print("=" .. string.rep("=", 80))
print("Guild Chat Translation Test")
print("=" .. string.rep("=", 80))
print()

for i, msg in ipairs(testMessages) do
    local result, confidence, reason = WDTS_Engine.Translate(msg, nil, "en", true)
    
    print(string.format("Test %d/%d: %s", i, #testMessages, msg))
    
    if result then
        if confidence >= 0.50 then
            print(string.format("  ✓ [%.2f] %s", confidence, result))
        else
            print(string.format("  ⚠ [%.2f] %s", confidence, result))
        end
    else
        print(string.format("  ❌ [SKIP] Reason: %s", reason or "unknown"))
    end
    print()
end

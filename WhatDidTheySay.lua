-- WhatDidTheySay - Main entry point
-- Offline chat translation for World of Warcraft Classic

local WDTS = {}
WhatDidTheySay = WDTS

-- Initialize default configuration
if not WhatDidTheySayDB then
    WhatDidTheySayDB = {
        channels = {
            WHISPER = true,
            SAY = true,
            PARTY = true,
            RAID = false,
            GENERAL = false,
            TRADE = false,
            WORLD = false,
            LFG = false,
        },
        autoTranslate = true,
        showOriginal = true,
        minConfidence = 0.70,
        firstRun = true,
        enabledLanguages = {
            ["de"] = true, -- German enabled by default
            ["en"] = false, -- English is target, not source
        },
    }
end

-- Initialize addon after variables are loaded
local function InitializeAddon()
    -- Load core modules
    WDTS.Engine = WDTS_Engine
    WDTS.ChatHooks = WDTS_ChatHooks
    WDTS.Config = WDTS_Config
    
    -- Initialize modules
    WDTS.Engine.Initialize()
    WDTS.ChatHooks.Initialize()
    
    -- Initialize slash commands (always needed)
    WDTS.Config.Initialize()
    
    -- Display startup message with slash commands
    local addonColor = "|cff00ff00" -- Green
    local cmdColor = "|cffffff00" -- Yellow
    
    DEFAULT_CHAT_FRAME:AddMessage(
        string.format("%sWhat Did They Say?|r v%s loaded. Type %s/wdts|r or %s/whatdidtheysay|r to configure.",
            addonColor,
            "1.0.0",
            cmdColor,
            cmdColor
        )
    )
    
    -- Show config page on first run
    if WhatDidTheySayDB.firstRun then
        WhatDidTheySayDB.firstRun = false
        WDTS.Config.Show()
    end
end

-- Frame to delay initialization until after ADDON_LOADED
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "WhatDidTheySay" then
        InitializeAddon()
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

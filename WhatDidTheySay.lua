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
    }
end

-- Initialize addon after variables are loaded
local function InitializeAddon()
    -- Load core modules
    WDTS.Engine = WDTS_Engine
    WDTS.ChatHooks = WDTS_ChatHooks
    WDTS.Config = WDTS_Config
    WDTS.FirstRun = WDTS_FirstRun
    
    -- Initialize modules
    WDTS.Engine:Initialize()
    WDTS.ChatHooks:Initialize()
    
    -- Show first-run dialog if needed
    if WhatDidTheySayDB.firstRun then
        WDTS.FirstRun:Show()
    else
        WDTS.Config:Initialize()
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

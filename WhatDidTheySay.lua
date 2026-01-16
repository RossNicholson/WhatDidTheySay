-- WhatDidTheySay - Main entry point
-- Offline chat translation for World of Warcraft Classic

local WDTS = {}
WhatDidTheySay = WDTS

-- Detect which channels the player has joined
local function DetectJoinedChannels()
    local joinedChannels = {}
    
    -- Always-enabled channels (don't need detection)
    joinedChannels.WHISPER = true
    joinedChannels.SAY = true
    joinedChannels.PARTY = true
    
    -- Try to detect joined custom channels
    -- GetChannelList() returns pairs of (name, id, ...) but format varies
    -- Safely iterate through the list
    local channelList = {GetChannelList()}
    
    for i = 1, #channelList, 2 do
        local channelName = channelList[i]
        -- Ensure channelName is a string before processing
        if channelName and type(channelName) == "string" then
            -- Normalize channel name (remove numbers like "2. Trade - City")
            local normalized = channelName:match("[^%.]+$") or channelName
            normalized = normalized:match("^%s*(.-)%s*$") -- Trim
            
            -- Map channel names to our channel types
            if normalized:find("Trade", 1, true) then
                joinedChannels.TRADE = true
            elseif normalized:find("General", 1, true) then
                joinedChannels.GENERAL = true
            elseif normalized:find("LookingForGroup", 1, true) or normalized:find("LFG", 1, true) then
                joinedChannels.LFG = true
            elseif normalized:find("World", 1, true) then
                joinedChannels.WORLD = true
            end
        end
    end
    
    -- Enable RAID if player is in a raid group
    if IsInRaid() then
        joinedChannels.RAID = true
    end
    
    return joinedChannels
end

-- Initialize default configuration
if not WhatDidTheySayDB then
    -- Detect joined channels for first-time setup
    local joinedChannels = DetectJoinedChannels()
    
    WhatDidTheySayDB = {
        channels = {
            WHISPER = true,
            SAY = true,
            PARTY = true,
            RAID = joinedChannels.RAID or true, -- Enable by default, or if in raid
            GUILD = true, -- Enable by default if in guild
            GENERAL = joinedChannels.GENERAL or true, -- Enable if joined, otherwise true
            TRADE = joinedChannels.TRADE or true, -- Enable if joined, otherwise true
            WORLD = joinedChannels.WORLD or true, -- Enable if joined, otherwise true
            LFG = joinedChannels.LFG or true, -- Enable if joined, otherwise true
        },
        autoTranslate = true,
        showOriginal = true,
        minConfidence = 0.70,
        firstRun = true,
        showTranslationIndicator = "color", -- "none" = no indicator, "color" = subtle color tint only
        enabledLanguagePacks = {
            de = true, -- German enabled by default
        },
    }
else
    -- Migration: ensure new settings exist
    if WhatDidTheySayDB.showTranslationIndicator == nil then
        WhatDidTheySayDB.showTranslationIndicator = "color"
    end
    
    -- Migration: convert enabledLanguages to enabledLanguagePacks if needed
    if WhatDidTheySayDB.enabledLanguages and not WhatDidTheySayDB.enabledLanguagePacks then
        WhatDidTheySayDB.enabledLanguagePacks = {}
        for lang, enabled in pairs(WhatDidTheySayDB.enabledLanguages) do
            if lang ~= "en" then -- Skip English as it's the target language
                WhatDidTheySayDB.enabledLanguagePacks[lang] = enabled
            end
        end
        WhatDidTheySayDB.enabledLanguages = nil
    end
    
    -- Migration: Enable all channels that player has joined (if not already configured)
    -- This ensures existing users get the new default behavior
    if not WhatDidTheySayDB.channelsAutoEnabled then
        local joinedChannels = DetectJoinedChannels()
        for channelType, _ in pairs(joinedChannels) do
            if WhatDidTheySayDB.channels[channelType] == nil then
                WhatDidTheySayDB.channels[channelType] = true
            end
        end
        -- Also enable common channels by default if not explicitly disabled
        local commonChannels = {"RAID", "GUILD", "GENERAL", "TRADE", "WORLD", "LFG"}
        for _, channelType in ipairs(commonChannels) do
            if WhatDidTheySayDB.channels[channelType] == nil then
                WhatDidTheySayDB.channels[channelType] = true
            end
        end
        WhatDidTheySayDB.channelsAutoEnabled = true -- Mark migration complete
    end
end

-- Initialize addon after variables are loaded
local function InitializeAddon()
    -- Update channel settings based on current state (channels may have been joined since last load)
    -- Only update if auto-enable is still active (first run or migration period)
    if WhatDidTheySayDB.channelsAutoEnabled ~= false then
        local joinedChannels = DetectJoinedChannels()
        -- Enable any newly joined channels
        for channelType, _ in pairs(joinedChannels) do
            if WhatDidTheySayDB.channels[channelType] == nil then
                WhatDidTheySayDB.channels[channelType] = true
            end
        end
        -- Update RAID status based on current group
        if IsInRaid() then
            WhatDidTheySayDB.channels.RAID = true
        end
    end
    
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
        string.format("%sWhat Did They Say?|r v%s by Ross Nicholson loaded. Type %s/wdts|r or %s/whatdidtheysay|r to configure.",
            addonColor,
            "0.3.0",
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

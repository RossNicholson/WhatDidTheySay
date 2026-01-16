-- WhatDidTheySay - Titan Panel Integration
-- Adds support for displaying translation status in Titan Panel

local WDTS_TitanPanel = {}

-- Check if Titan Panel is loaded
local function IsTitanPanelLoaded()
    return TitanPanelButton_OnLoad ~= nil or TitanUtils_RegisterPlugin ~= nil
end

-- Button text function (must be global)
function TitanPanelWDTSButton_GetButtonText(self)
    if not WhatDidTheySayDB or not WhatDidTheySayDB.autoTranslate then
        return "WDTS: Off"
    end
    
    -- Count enabled language packs
    local enabledCount = 0
    if LanguagePackManager then
        local packs = LanguagePackManager.GetAvailablePacks()
        if packs then
            for _, pack in ipairs(packs) do
                if LanguagePackManager.IsEnabled(pack.id) then
                    enabledCount = enabledCount + 1
                end
            end
        end
    end
    
    local status = enabledCount > 0 and "Active" or "Ready"
    return "WDTS: " .. status
end

-- Tooltip text function (must be global)
function TitanPanelWDTSButton_GetTooltipText()
    local lines = {}
    table.insert(lines, "|cffffffffWhat Did They Say?|r")
    table.insert(lines, "|cffffd700Version:|r 0.2.0")
    table.insert(lines, "")
    
    if WhatDidTheySayDB and WhatDidTheySayDB.autoTranslate then
        table.insert(lines, "|cff00ff00Auto-translate:|r Enabled")
        
        -- Show enabled language packs
        if LanguagePackManager then
            local packs = LanguagePackManager.GetAvailablePacks()
            if packs and #packs > 0 then
                table.insert(lines, "")
                table.insert(lines, "|cffffd700Languages:|r")
                for _, pack in ipairs(packs) do
                    if LanguagePackManager.IsEnabled(pack.id) then
                        local langName = pack.name or pack.id:upper()
                        table.insert(lines, "  |cff00ff00" .. langName .. "|r")
                    end
                end
            end
        end
    else
        table.insert(lines, "|cffff0000Auto-translate:|r Disabled")
    end
    
    table.insert(lines, "")
    table.insert(lines, "|cffffd700Commands:|r")
    table.insert(lines, "  |cffffff00/wdts|r - Open config")
    table.insert(lines, "  |cffffff00/wdts test <msg>|r - Test translation")
    
    table.insert(lines, "")
    table.insert(lines, "|cff808080Click:|r Open configuration")
    
    return table.concat(lines, "\n")
end

-- OnClick handler (must be global)
function TitanPanelWDTSButton_OnClick(self, button)
    if button == "LeftButton" then
        -- Open config
        if WDTS_Config and WDTS_Config.Show then
            WDTS_Config.Show()
        end
    elseif button == "RightButton" then
        -- Toggle auto-translate
        if WhatDidTheySayDB then
            WhatDidTheySayDB.autoTranslate = not WhatDidTheySayDB.autoTranslate
            if TitanPanelButton_UpdateButton then
                TitanPanelButton_UpdateButton("WDTS")
            end
        end
    end
end

-- Register with Titan Panel
function WDTS_TitanPanel.Register()
    if not IsTitanPanelLoaded() then
        return false
    end
    
    -- PRIMARY CHECK: If button frame already exists AND has a registry, we're registered
    -- Check both existence and whether it's been properly set up
    local existingButton = _G["TitanPanelWDTSButton"]
    if existingButton and existingButton.registry and existingButton.registry.id == "WDTS" then
        return true
    end
    
    -- SECONDARY CHECK: If button exists but no registry, something went wrong
    -- Don't try to re-register, just return false
    if existingButton then
        return false
    end
    
    -- Create the button frame FIRST (Titan needs the frame to exist)
    local button = CreateFrame("Button", "TitanPanelWDTSButton", UIParent, "TitanPanelComboTemplate")
    if not button then
        -- If template doesn't exist, try without template
        button = CreateFrame("Button", "TitanPanelWDTSButton", UIParent)
        if not button then
            return false
        end
    end
    
    -- Set up the registry on the button BEFORE calling OnLoad
    -- Titan Panel Classic uses "cat" for category
    button.registry = {
        id = "WDTS",
        menuText = "What Did They Say?",
        buttonTextFunction = "TitanPanelWDTSButton_GetButtonText",
        tooltipTitle = "What Did They Say?",
        tooltipTextFunction = "TitanPanelWDTSButton_GetTooltipText",
        onClick = "TitanPanelWDTSButton_OnClick", -- Register click handler in registry
        cat = "Information", -- Use string literal, not variable
        version = "0.2.0",
        icon = "Interface\\Icons\\INV_Letter_01",
        iconWidth = 16,
        savedVariables = {
            ShowLabelText = false,
            ShowIcon = true,
        },
    }
    
    -- Also set up click handler directly on the button (some Titan versions need both)
    button:SetScript("OnClick", TitanPanelWDTSButton_OnClick)
    
    -- Register the plugin using Titan's function
    -- This must be called during ADDON_LOADED for Titan to collect it
    if TitanPanelButton_OnLoad then
        local success, err = pcall(function()
            TitanPanelButton_OnLoad(button)
        end)
        if not success then
            -- Log error if possible
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000WDTS Titan Panel registration error: " .. tostring(err) .. "|r")
            return false
        end
        return true
    end
    
    return false
end

-- Initialize registered flag
WDTS_TitanPanel.registered = false

-- Try to register when Titan Panel is ready
local function TryRegister()
    if not IsTitanPanelLoaded() or not WhatDidTheySayDB then
        return false
    end
    
    -- PRIMARY CHECK: Use Titan Panel's own API to check if already registered
    -- This is the most reliable method - Titan Panel knows its own state
    if TitanUtils_IsPluginRegistered and TitanUtils_IsPluginRegistered("WDTS") then
        WDTS_TitanPanel.registered = true
        return true
    end
    
    -- SECONDARY CHECK: If button frame already exists, we're already registered
    if _G["TitanPanelWDTSButton"] then
        WDTS_TitanPanel.registered = true
        return true
    end
    
    -- TERTIARY CHECK: If flag is set, don't attempt again
    if WDTS_TitanPanel.registered then
        return false
    end
    
    -- Set flag IMMEDIATELY to prevent race conditions
    -- If both events fire simultaneously, only the first will proceed
    WDTS_TitanPanel.registered = true
    
    local success = WDTS_TitanPanel.Register()
    if not success then
        -- Registration failed, reset flag so we can try again later
        -- But only if Titan Panel doesn't think it's registered
        if not (TitanUtils_IsPluginRegistered and TitanUtils_IsPluginRegistered("WDTS")) then
            if not _G["TitanPanelWDTSButton"] then
                WDTS_TitanPanel.registered = false
            end
        else
            -- Titan Panel thinks it's registered, so mark our flag
            WDTS_TitanPanel.registered = true
        end
        return false
    end
    return true
end

-- Wait for Titan Panel to load
-- Titan Panel collects plugins during ADDON_LOADED events (before PLAYER_ENTERING_WORLD)
-- We must register synchronously during ADDON_LOADED, not with timers
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" then
        -- Check if already registered - check button existence FIRST (most reliable)
        local btn = _G["TitanPanelWDTSButton"]
        if btn and btn.registry and btn.registry.id == "WDTS" then
            WDTS_TitanPanel.registered = true
            return
        end
        
        -- Also check our flag
        if WDTS_TitanPanel.registered then
            return
        end
        
        -- Try to register when either addon loads, as long as BOTH are ready
        -- This handles cases where Titan loads before or after our addon
        local shouldTry = false
        if addonName == "Titan" then
            -- Titan just loaded, check if our addon is ready
            shouldTry = (WhatDidTheySayDB ~= nil)
        elseif addonName == "WhatDidTheySay" then
            -- Our addon just loaded, check if Titan is ready
            shouldTry = IsTitanPanelLoaded()
        end
        
        -- Only attempt registration if both addons are loaded
        if shouldTry and IsTitanPanelLoaded() and WhatDidTheySayDB then
            TryRegister()
        end
    end
end)

WDTS_TitanPanel = WDTS_TitanPanel

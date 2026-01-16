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
    -- Prevent duplicate registration
    if WDTS_TitanPanel.registered then
        return false
    end
    
    if IsTitanPanelLoaded() and WhatDidTheySayDB then
        local success = WDTS_TitanPanel.Register()
        if success then
            WDTS_TitanPanel.registered = true
            return true
        end
    end
    return false
end

-- Wait for Titan Panel to load
-- Titan Panel collects plugins during ADDON_LOADED events (before PLAYER_ENTERING_WORLD)
-- We must register synchronously during ADDON_LOADED, not with timers
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" then
        -- Only register once, when both Titan and our addon are loaded
        -- Check if already registered to prevent duplicates
        if WDTS_TitanPanel.registered then
            return
        end
        
        -- Only register when Titan loads (it needs to be loaded first)
        -- OR when our addon loads if Titan is already loaded
        if addonName == "Titan" then
            -- Titan just loaded, try to register immediately
            -- WhatDidTheySayDB should exist by now (our addon loads before Titan due to OptionalDeps)
            if WhatDidTheySayDB then
                TryRegister()
            end
        elseif addonName == "WhatDidTheySay" then
            -- Our addon loaded, check if Titan is already available
            -- This handles the case where Titan loaded before our addon
            if IsTitanPanelLoaded() and WhatDidTheySayDB then
                TryRegister()
            end
        end
    end
end)

WDTS_TitanPanel = WDTS_TitanPanel

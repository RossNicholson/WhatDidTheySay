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
        if Config and Config.Show then
            Config.Show()
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
    
    -- Try using TitanUtils_RegisterPlugin if available (newer method)
    if TitanUtils_RegisterPlugin then
        local success, err = pcall(function()
            TitanUtils_RegisterPlugin({
                id = "WDTS",
                name = "What Did They Say?",
                menuText = "What Did They Say?",
                buttonTextFunction = "TitanPanelWDTSButton_GetButtonText",
                tooltipTitle = "What Did They Say?",
                tooltipTextFunction = "TitanPanelWDTSButton_GetTooltipText",
                cat = TITAN_PANEL_CATEGORY_INFORMATION or "Information",
                version = "0.2.0",
                icon = "Interface\\Icons\\INV_Letter_01",
                iconWidth = 16,
                savedVariables = {
                    ShowLabelText = false,
                    ShowIcon = true,
                },
            })
        end)
        if success then
            return true
        end
    end
    
    -- Fallback to traditional method: Create frame and use TitanPanelButton_OnLoad
    local button = CreateFrame("Button", "TitanPanelWDTSButton", UIParent, "TitanPanelComboTemplate")
    if not button then
        return false
    end
    
    -- Set up the registry on the button
    -- Use "cat" instead of "category" (Titan Panel uses "cat")
    button.registry = {
        id = "WDTS",
        menuText = "What Did They Say?",
        buttonTextFunction = "TitanPanelWDTSButton_GetButtonText",
        tooltipTitle = "What Did They Say?",
        tooltipTextFunction = "TitanPanelWDTSButton_GetTooltipText",
        cat = TITAN_PANEL_CATEGORY_INFORMATION or "Information", -- Use "cat" not "category"
        version = "0.2.0",
        icon = "Interface\\Icons\\INV_Letter_01",
        iconWidth = 16,
        savedVariables = {
            ShowLabelText = false,
            ShowIcon = true,
        },
    }
    
    -- Set up click handler
    button:SetScript("OnClick", TitanPanelWDTSButton_OnClick)
    
    -- Register the plugin using Titan's function
    if TitanPanelButton_OnLoad then
        local success, err = pcall(function()
            TitanPanelButton_OnLoad(button)
        end)
        if not success then
            -- Registration failed, but don't error out
            return false
        end
        return true
    end
    
    return false
end

-- Try to register when Titan Panel is ready
local function TryRegister()
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
-- Titan Panel collects plugins during ADDON_LOADED events and registers them at PLAYER_ENTERING_WORLD
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

local registrationAttempted = false

frame:SetScript("OnEvent", function(self, event, addonName)
    -- Don't attempt registration more than once
    if registrationAttempted then
        return
    end
    
    if event == "ADDON_LOADED" then
        -- Register when Titan loads, or when our addon loads (if Titan is already loaded)
        if addonName == "Titan" then
            -- Titan just loaded, register immediately (Titan collects plugins during ADDON_LOADED)
            if WhatDidTheySayDB then
                registrationAttempted = true
                TryRegister()
            end
        elseif addonName == "WhatDidTheySay" then
            -- Our addon loaded, check if Titan is already available
            if IsTitanPanelLoaded() and WhatDidTheySayDB then
                registrationAttempted = true
                TryRegister()
            end
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- Final attempt - Titan Panel processes registrations at this point
        if not registrationAttempted and IsTitanPanelLoaded() and WhatDidTheySayDB then
            registrationAttempted = true
            TryRegister()
        end
    end
end)

WDTS_TitanPanel = WDTS_TitanPanel

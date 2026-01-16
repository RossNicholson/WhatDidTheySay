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
    -- Prevent duplicate registration - but note: flag should already be set by TryRegister()
    -- This check prevents Register() from being called if flag wasn't set
    if not WDTS_TitanPanel.registered then
        -- This shouldn't happen if called from TryRegister(), but guard against direct calls
        return false
    end
    
    if not IsTitanPanelLoaded() then
        return false
    end
    
    -- Check if button already exists (prevent duplicate frame creation)
    -- If it exists, Titan Panel already registered this plugin - return success
    if _G["TitanPanelWDTSButton"] then
        -- Button already exists, registration was already successful
        return true
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
    -- PRIMARY CHECK: If button frame already exists, we're already registered
    -- This is the most reliable check - Titan Panel creates the button when registered
    if _G["TitanPanelWDTSButton"] then
        WDTS_TitanPanel.registered = true
        return true
    end
    
    -- SECONDARY CHECK: If flag is set, don't attempt again
    if WDTS_TitanPanel.registered then
        return false
    end
    
    if IsTitanPanelLoaded() and WhatDidTheySayDB then
        -- Set flag IMMEDIATELY to prevent race conditions
        -- If both events fire simultaneously, only the first will proceed
        WDTS_TitanPanel.registered = true
        
        local success = WDTS_TitanPanel.Register()
        if not success then
            -- Registration failed, reset flag so we can try again later
            -- But only if button doesn't exist (might have been created elsewhere)
            if not _G["TitanPanelWDTSButton"] then
                WDTS_TitanPanel.registered = false
            end
            return false
        end
        return true
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
        
        -- Try to register when either addon loads, as long as both are ready
        -- This handles cases where Titan loads before or after our addon
        if addonName == "Titan" or addonName == "WhatDidTheySay" then
            -- Both must be loaded before we can register
            if IsTitanPanelLoaded() and WhatDidTheySayDB then
                TryRegister()
            end
        end
    end
end)

WDTS_TitanPanel = WDTS_TitanPanel

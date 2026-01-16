-- WhatDidTheySay - Configuration UI
-- Main configuration interface

local Widgets = WDTS_Widgets
local Config = {}
Config.frame = nil

-- Create configuration frame
function Config.CreateFrame()
    if Config.frame then
        return Config.frame
    end
    
    local frame = CreateFrame("Frame", "WDTSConfigFrame", UIParent)
    frame:SetSize(420, 520)
    frame:SetPoint("CENTER", UIParent, "CENTER")
    
    -- Create backdrop with better appearance
    local backdrop = frame:CreateTexture(nil, "BACKGROUND")
    backdrop:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
    backdrop:SetAllPoints(frame)
    backdrop:SetVertexColor(0.1, 0.1, 0.1, 0.95)
    
    -- Title bar background
    local titleBar = frame:CreateTexture(nil, "BORDER")
    titleBar:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
    titleBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 8)
    titleBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 8)
    titleBar:SetHeight(40)
    titleBar:SetTexCoord(0, 1, 0, 0.25)
    
    -- Simple clean border using thin lines
    local borderThickness = 2
    
    -- Top border
    local borderTop = frame:CreateTexture(nil, "BORDER")
    borderTop:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    borderTop:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    borderTop:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    borderTop:SetHeight(borderThickness)
    borderTop:SetVertexColor(0.6, 0.6, 0.6, 0.8)
    
    -- Bottom border
    local borderBottom = frame:CreateTexture(nil, "BORDER")
    borderBottom:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    borderBottom:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
    borderBottom:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    borderBottom:SetHeight(borderThickness)
    borderBottom:SetVertexColor(0.6, 0.6, 0.6, 0.8)
    
    -- Left border
    local borderLeft = frame:CreateTexture(nil, "BORDER")
    borderLeft:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    borderLeft:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    borderLeft:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
    borderLeft:SetWidth(borderThickness)
    borderLeft:SetVertexColor(0.6, 0.6, 0.6, 0.8)
    
    -- Right border
    local borderRight = frame:CreateTexture(nil, "BORDER")
    borderRight:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    borderRight:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    borderRight:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    borderRight:SetWidth(borderThickness)
    borderRight:SetVertexColor(0.6, 0.6, 0.6, 0.8)
    
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:Hide()
    
    -- Title with better styling
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", frame, "TOP", 0, -15)
    title:SetText("|cffffd700What Did They Say?|r")
    title:SetTextColor(1, 0.84, 0, 1) -- Gold color
    
    -- Subtitle
    local subtitle = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    subtitle:SetPoint("TOP", title, "BOTTOM", 0, -5)
    subtitle:SetText("Configuration")
    subtitle:SetTextColor(0.8, 0.8, 0.8, 1)
    
    -- Divider line
    local divider1 = frame:CreateTexture(nil, "ARTWORK")
    divider1:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    divider1:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -65)
    divider1:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -20, -65)
    divider1:SetHeight(16)
    divider1:SetTexCoord(0, 1, 0.5, 0.75)
    
    -- Info text (improved styling)
    local infoText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    infoText:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -85)
    infoText:SetSize(370, 50)
    infoText:SetJustifyH("LEFT")
    infoText:SetJustifyV("TOP")
    infoText:SetText("|cffffffffIn-game translation for whispers, party chat, and group coordination.|r\nSelect which channels to translate:")
    infoText:SetTextColor(0.9, 0.9, 0.9, 1)
    
    -- Channel settings section
    local channelLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    channelLabel:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -145)
    channelLabel:SetText("|cffffffffEnabled Channels:|r")
    channelLabel:SetTextColor(1, 1, 0.8, 1)
    
    local yOffset = -170
    local checkboxes = {}
    
    -- Group channels logically
    local primaryChannels = { "WHISPER", "SAY", "PARTY", "RAID" }
    local globalChannels = { "GENERAL", "TRADE", "WORLD", "LFG" }
    
    -- Primary channels
    for i, channel in ipairs(primaryChannels) do
        local check, label = Widgets.CreateCheckbox(frame, channel, 35, yOffset, function(checked)
            WhatDidTheySayDB.channels[channel] = checked
        end)
        check:SetChecked(WhatDidTheySayDB.channels[channel] or false)
        checkboxes[channel] = check
        yOffset = yOffset - 25
    end
    
    -- Divider for global channels
    yOffset = yOffset - 10
    local divider2 = frame:CreateTexture(nil, "ARTWORK")
    divider2:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    divider2:SetPoint("TOPLEFT", frame, "TOPLEFT", 35, yOffset)
    divider2:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -35, yOffset)
    divider2:SetHeight(8)
    divider2:SetTexCoord(0, 1, 0.25, 0.5)
    divider2:SetVertexColor(0.5, 0.5, 0.5, 0.5)
    
    yOffset = yOffset - 15
    
    -- Global channels label
    local globalLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    globalLabel:SetPoint("TOPLEFT", frame, "TOPLEFT", 35, yOffset)
    globalLabel:SetText("|cffaaaaaaGlobal Channels (disabled by default):|r")
    globalLabel:SetTextColor(0.7, 0.7, 0.7, 1)
    
    yOffset = yOffset - 20
    
    -- Global channels
    for i, channel in ipairs(globalChannels) do
        local check, label = Widgets.CreateCheckbox(frame, channel, 35, yOffset, function(checked)
            WhatDidTheySayDB.channels[channel] = checked
        end)
        check:SetChecked(WhatDidTheySayDB.channels[channel] or false)
        -- Make labels slightly dimmer for global channels
        label:SetTextColor(0.85, 0.85, 0.85, 1)
        checkboxes[channel] = check
        yOffset = yOffset - 25
    end
    
    -- Divider before settings
    yOffset = yOffset - 10
    local divider3 = frame:CreateTexture(nil, "ARTWORK")
    divider3:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    divider3:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, yOffset)
    divider3:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -20, yOffset)
    divider3:SetHeight(16)
    divider3:SetTexCoord(0, 1, 0.5, 0.75)
    
    -- Settings section
    yOffset = yOffset - 15
    local settingsLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    settingsLabel:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, yOffset)
    settingsLabel:SetText("|cffffffffSettings:|r")
    settingsLabel:SetTextColor(1, 1, 0.8, 1)
    
    yOffset = yOffset - 25
    
    local autoCheck, autoLabelText = Widgets.CreateCheckbox(frame, "Auto-translate messages", 35, yOffset, function(checked)
        WhatDidTheySayDB.autoTranslate = checked
    end)
    autoCheck:SetChecked(WhatDidTheySayDB.autoTranslate or true)
    
    -- Close button (centered, better positioned)
    local closeBtn = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
    closeBtn:SetSize(120, 32)
    closeBtn:SetPoint("BOTTOM", frame, "BOTTOM", 0, 15)
    closeBtn:SetText("Close")
    closeBtn:SetScript("OnClick", function()
        frame:Hide()
    end)
    
    Config.frame = frame
    Config.checkboxes = checkboxes
    return frame
end

-- Show configuration frame
function Config.Show()
    if not Config.frame then
        Config.CreateFrame()
    end
    Config.frame:Show()
end

-- Toggle configuration frame
function Config.Toggle()
    if not Config.frame then
        Config.CreateFrame()
    end
    if Config.frame:IsVisible() then
        Config.frame:Hide()
    else
        Config.frame:Show()
    end
end

-- Initialize configuration (create slash command)
function Config.Initialize()
    SLASH_WHATDIDTHESAY1 = "/wdts"
    SLASH_WHATDIDTHESAY2 = "/whatdidtheysay"
    SlashCmdList["WHATDIDTHESAY"] = function(msg)
        Config.Toggle()
    end
end

WDTS_Config = Config

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
    frame:SetSize(400, 500)
    frame:SetPoint("CENTER", UIParent, "CENTER")
    
    -- Create backdrop manually for Classic compatibility
    local backdrop = frame:CreateTexture(nil, "BACKGROUND")
    backdrop:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
    backdrop:SetAllPoints(frame)
    backdrop:SetVertexColor(0, 0, 0, 0.9)
    
    -- Simple border using a solid color frame
    local border = CreateFrame("Frame", nil, frame)
    border:SetPoint("TOPLEFT", frame, "TOPLEFT", -2, 2)
    border:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 2, -2)
    border:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
    
    -- Create border lines manually
    local borderTop = frame:CreateTexture(nil, "BORDER")
    borderTop:SetColorTexture(0.5, 0.5, 0.5, 1)
    borderTop:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    borderTop:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    borderTop:SetHeight(2)
    
    local borderBottom = frame:CreateTexture(nil, "BORDER")
    borderBottom:SetColorTexture(0.5, 0.5, 0.5, 1)
    borderBottom:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
    borderBottom:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    borderBottom:SetHeight(2)
    
    local borderLeft = frame:CreateTexture(nil, "BORDER")
    borderLeft:SetColorTexture(0.5, 0.5, 0.5, 1)
    borderLeft:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    borderLeft:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
    borderLeft:SetWidth(2)
    
    local borderRight = frame:CreateTexture(nil, "BORDER")
    borderRight:SetColorTexture(0.5, 0.5, 0.5, 1)
    borderRight:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    borderRight:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    borderRight:SetWidth(2)
    
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:Hide()
    
    -- Title
    local title = Widgets.CreateLabel(frame, "What Did They Say? Configuration", 20, -20, 14)
    title:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    
    -- Welcome/info text (subtle, not too prominent)
    local infoText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    infoText:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -45)
    infoText:SetSize(360, 40)
    infoText:SetJustifyH("LEFT")
    infoText:SetText("Offline translation for whispers, party chat, and group coordination. Select which channels to translate:")
    
    -- Channel settings
    local channelLabel = Widgets.CreateLabel(frame, "Enabled Channels:", 20, -90)
    
    local yOffset = -115
    local checkboxes = {}
    
    local channels = {
        "WHISPER", "SAY", "PARTY", "RAID",
        "GENERAL", "TRADE", "WORLD", "LFG",
    }
    
    for i, channel in ipairs(channels) do
        local check, label = Widgets.CreateCheckbox(frame, channel, 30, yOffset, function(checked)
            WhatDidTheySayDB.channels[channel] = checked
        end)
        check:SetChecked(WhatDidTheySayDB.channels[channel] or false)
        checkboxes[channel] = check
        yOffset = yOffset - 25
    end
    
    -- Auto-translate setting
    yOffset = yOffset - 20
    local autoLabel = Widgets.CreateLabel(frame, "Settings:", 20, yOffset)
    yOffset = yOffset - 25
    
    local autoCheck, autoLabelText = Widgets.CreateCheckbox(frame, "Auto-translate messages", 30, yOffset, function(checked)
        WhatDidTheySayDB.autoTranslate = checked
    end)
    autoCheck:SetChecked(WhatDidTheySayDB.autoTranslate or true)
    
    -- Close button
    local closeBtn = Widgets.CreateButton(frame, "Close", 150, -450, 100, 30, function()
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

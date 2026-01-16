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
    frame:SetSize(450, 580)
    frame:SetPoint("CENTER", UIParent, "CENTER")
    
    -- Create backdrop - simple solid background
    local backdrop = frame:CreateTexture(nil, "BACKGROUND")
    backdrop:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
    backdrop:SetAllPoints(frame)
    backdrop:SetVertexColor(0.15, 0.15, 0.15, 0.98)
    
    -- Title bar background - simple solid color
    local titleBar = frame:CreateTexture(nil, "BORDER")
    titleBar:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
    titleBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    titleBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    titleBar:SetHeight(48)
    titleBar:SetVertexColor(0.2, 0.2, 0.25, 1)
    
    -- Simple solid color border (no texture coordinates)
    local borderThickness = 1
    
    -- Top border - solid color
    local borderTop = frame:CreateTexture(nil, "ARTWORK")
    borderTop:SetTexture("Interface\\Buttons\\WHITE8X8")
    borderTop:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    borderTop:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    borderTop:SetHeight(borderThickness)
    borderTop:SetVertexColor(0.8, 0.8, 0.8, 1)
    
    -- Bottom border
    local borderBottom = frame:CreateTexture(nil, "ARTWORK")
    borderBottom:SetTexture("Interface\\Buttons\\WHITE8X8")
    borderBottom:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
    borderBottom:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    borderBottom:SetHeight(borderThickness)
    borderBottom:SetVertexColor(0.8, 0.8, 0.8, 1)
    
    -- Left border
    local borderLeft = frame:CreateTexture(nil, "ARTWORK")
    borderLeft:SetTexture("Interface\\Buttons\\WHITE8X8")
    borderLeft:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    borderLeft:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
    borderLeft:SetWidth(borderThickness)
    borderLeft:SetVertexColor(0.8, 0.8, 0.8, 1)
    
    -- Right border
    local borderRight = frame:CreateTexture(nil, "ARTWORK")
    borderRight:SetTexture("Interface\\Buttons\\WHITE8X8")
    borderRight:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    borderRight:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    borderRight:SetWidth(borderThickness)
    borderRight:SetVertexColor(0.8, 0.8, 0.8, 1)
    
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
    
    -- Information text area with scrolling
    local infoFrame = CreateFrame("ScrollFrame", nil, frame)
    infoFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -85)
    infoFrame:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", -25, -140)
    infoFrame:SetWidth(370)
    
    local infoContent = CreateFrame("Frame", nil, infoFrame)
    infoContent:SetWidth(370)
    infoContent:SetHeight(200)
    infoFrame:SetScrollChild(infoContent)
    
    local infoText = infoContent:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    infoText:SetPoint("TOPLEFT", infoContent, "TOPLEFT", 0, 0)
    infoText:SetWidth(350)
    infoText:SetJustifyH("LEFT")
    infoText:SetJustifyV("TOP")
    infoText:SetText([[
|cffffffffWhat Did They Say?|r translates chat messages in other languages using offline, in-game logic.

|cffffd700Supported Languages:|r
• German (de) → English (en) |cff00ff00✓ Full Support|r

|cffffd700How It Works:|r
The addon monitors enabled channels and automatically translates foreign-language messages when confidence is high enough (≥70%). Translations appear as separate messages below the original - the original is never replaced.

|cffffd700Confidence Levels:|r
• |cff00ff00High (≥0.70)|r: Automatically displayed
• |cffffff00Medium (0.45-0.69)|r: Shown with caution
• |cff808080Low (<0.45)|r: Stay silent (by design)

|cffffd700What Gets Protected:|r
Player names, item links, spell links, raid icons, and numbers are never translated.

|cffffd700Commands:|r
• |cffffff00/wdts|r or |cffffff00/whatdidtheysay|r - Open this configuration

|cffffd700Tip:|r The addon prioritizes accuracy over coverage. If it's not confident, it stays quiet to avoid wrong translations.]])
    infoText:SetTextColor(0.9, 0.9, 0.9, 1)
    
    -- Scroll bar
    local scrollBar = CreateFrame("Slider", nil, infoFrame)
    scrollBar:SetOrientation("VERTICAL")
    scrollBar:SetPoint("TOPLEFT", infoFrame, "TOPRIGHT", 4, 0)
    scrollBar:SetPoint("BOTTOMLEFT", infoFrame, "BOTTOMRIGHT", 4, 0)
    scrollBar:SetWidth(16)
    scrollBar:SetMinMaxValues(0, 0)
    scrollBar:SetValue(0)
    
    local scrollUp = CreateFrame("Button", nil, scrollBar, "UIPanelScrollUpButtonTemplate")
    scrollUp:SetPoint("BOTTOM", scrollBar, "TOP", 0, -2)
    
    local scrollDown = CreateFrame("Button", nil, scrollBar, "UIPanelScrollDownButtonTemplate")
    scrollDown:SetPoint("TOP", scrollBar, "BOTTOM", 0, 2)
    
    scrollBar:SetScript("OnValueChanged", function(self, value)
        infoFrame:SetVerticalScroll(value)
    end)
    
    local function UpdateScrollRange()
        local maxScroll = math.max(0, infoText:GetHeight() - infoFrame:GetHeight())
        scrollBar:SetMinMaxValues(0, maxScroll)
    end
    
    -- Update scroll after text is rendered
    infoFrame:SetScript("OnShow", UpdateScrollRange)
    infoText:SetScript("OnTextChanged", UpdateScrollRange)
    
    -- Channel settings section
    local channelLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    channelLabel:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -295)
    channelLabel:SetText("|cffffffffEnabled Channels:|r")
    channelLabel:SetTextColor(1, 1, 0.8, 1)
    
    local yOffset = -320
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

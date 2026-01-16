-- WhatDidTheySay - First Run Dialog
-- First-time user experience

local Widgets = WDTS_Widgets
local FirstRun = {}
FirstRun.frame = nil

-- Create first-run dialog
function FirstRun.CreateDialog()
    if FirstRun.frame then
        return FirstRun.frame
    end
    
    local frame = CreateFrame("Frame", "WDTSFirstRunFrame", UIParent)
    frame:SetSize(500, 400)
    frame:SetPoint("CENTER", UIParent, "CENTER")
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 },
    })
    frame:SetBackdropColor(0, 0, 0, 1)
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    
    -- Title
    local title = Widgets.CreateLabel(frame, "Welcome to WhatDidTheySay", 20, -20, 16)
    title:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
    
    -- Description text
    local descText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    descText:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -60)
    descText:SetSize(460, 200)
    descText:SetJustifyH("LEFT")
    descText:SetJustifyV("TOP")
    descText:SetText([[
WhatDidTheySay helps you understand chat messages in other languages using offline, rule-based translation.

What this addon does:
• Translates whispers, party chat, and group coordination messages
• Works entirely offline (no internet required)
• Focuses on gameplay communication, not perfect translations

What this addon is NOT:
• A universal translator
• A replacement for voice chat
• Perfect grammar or literal accuracy

The addon will stay quiet when confidence is low to avoid wrong translations.

Use /wdts or /whatdidtheysay to open configuration.
]])
    
    -- Channel checkboxes
    local channelLabel = Widgets.CreateLabel(frame, "Enable translation for:", 20, -250)
    
    local yOffset = -275
    local channelCheckboxes = {}
    local defaultChannels = { "WHISPER", "SAY", "PARTY" }
    
    for i, channel in ipairs(defaultChannels) do
        local check, label = Widgets.CreateCheckbox(frame, channel, 30, yOffset, function(checked)
            WhatDidTheySayDB.channels[channel] = checked
        end)
        check:SetChecked(true)
        channelCheckboxes[channel] = check
        yOffset = yOffset - 25
    end
    
    -- Continue button
    local continueBtn = Widgets.CreateButton(frame, "Continue", 200, -350, 100, 30, function()
        WhatDidTheySayDB.firstRun = false
        frame:Hide()
        WDTS.Config:Initialize()
    end)
    
    FirstRun.frame = frame
    FirstRun.channelCheckboxes = channelCheckboxes
    return frame
end

-- Show first-run dialog
function FirstRun.Show()
    if not FirstRun.frame then
        FirstRun.CreateDialog()
    end
    FirstRun.frame:Show()
end

WDTS_FirstRun = FirstRun

-- WhatDidTheySay - UI Widgets
-- Reusable UI components

local Widgets = {}

-- Create a simple checkbox
function Widgets.CreateCheckbox(parent, label, x, y, onClick)
    local check = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    check:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    
    local labelText = check:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    labelText:SetPoint("LEFT", check, "RIGHT", 5, 0)
    labelText:SetText(label)
    
    check:SetScript("OnClick", function(self)
        if onClick then
            onClick(self:GetChecked())
        end
    end)
    
    return check, labelText
end

-- Create a button
function Widgets.CreateButton(parent, text, x, y, width, height, onClick)
    local button = CreateFrame("Button", nil, parent, "GameMenuButtonTemplate")
    button:SetSize(width or 120, height or 30)
    button:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    button:SetText(text)
    
    button:SetScript("OnClick", function(self)
        if onClick then
            onClick(self)
        end
    end)
    
    return button
end

-- Create a label/text
function Widgets.CreateLabel(parent, text, x, y, fontHeight)
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    label:SetText(text)
    if fontHeight then
        local font, size, flags = label:GetFont()
        label:SetFont(font, fontHeight, flags)
    end
    return label
end

WDTS_Widgets = Widgets

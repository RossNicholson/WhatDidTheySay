-- WhatDidTheySay - Chat Hooks
-- Chat event interception and translation display

local Engine = WDTS_Engine
local Confidence = WDTS_Confidence
local ChatHooks = {}

ChatHooks.initialized = false

-- Message throttling
ChatHooks.messageHistory = {}
ChatHooks.throttleWindow = 2.0 -- seconds
ChatHooks.maxMessagesPerWindow = 10

-- Channel name mapping
local CHANNEL_MAP = {
    ["WHISPER"] = "WHISPER",
    ["SAY"] = "SAY",
    ["PARTY"] = "PARTY",
    ["RAID"] = "RAID",
    ["GUILD"] = "GUILD",
    ["GENERAL"] = "GENERAL",
    ["TRADE"] = "TRADE",
    ["WORLD"] = "WORLD",
    ["LFG"] = "LFG",
}

-- Get channel type from event
local function GetChannelType(event)
    if event == "CHAT_MSG_WHISPER" or event == "CHAT_MSG_WHISPER_INFORM" then
        return "WHISPER"
    elseif event == "CHAT_MSG_SAY" then
        return "SAY"
    elseif event == "CHAT_MSG_PARTY" then
        return "PARTY"
    elseif event == "CHAT_MSG_RAID" then
        return "RAID"
    elseif event == "CHAT_MSG_GUILD" then
        return "GUILD"
    elseif event == "CHAT_MSG_CHANNEL" then
        -- Would need to check channel name, but for now return nil for custom channels
        return nil
    end
    return nil
end

-- Check if channel is enabled
local function IsChannelEnabled(channelType)
    if not channelType then
        return false
    end
    return WhatDidTheySayDB.channels[channelType] == true
end

-- Throttle messages to avoid processing bursts
local function ShouldThrottle()
    local now = GetTime()
    local cutoff = now - ChatHooks.throttleWindow
    
    -- Clean old messages
    local i = 1
    while i <= #ChatHooks.messageHistory do
        if ChatHooks.messageHistory[i] < cutoff then
            table.remove(ChatHooks.messageHistory, i)
        else
            i = i + 1
        end
    end
    
    -- Check if we're over the limit
    if #ChatHooks.messageHistory >= ChatHooks.maxMessagesPerWindow then
        return true
    end
    
    -- Add current message timestamp
    table.insert(ChatHooks.messageHistory, now)
    return false
end

-- Display translation in chat
local function DisplayTranslation(originalMessage, translatedMessage, confidence, intent)
    -- Simple output: show translation below original in a subtle color
    local color = "|cff00ff00" -- Green for confident translations
    if confidence < 0.70 then
        color = "|cffffff00" -- Yellow for less confident
    end
    
    local intentText = ""
    if intent then
        intentText = " [" .. intent .. "]"
    end
    
    local output = color .. "→ " .. translatedMessage .. intentText .. "|r"
    
    -- Display in all active chat frames for better visibility
    local chatFrames = { ChatFrame1, ChatFrame2, ChatFrame3, ChatFrame4, ChatFrame5, ChatFrame6, ChatFrame7 }
    for _, frame in ipairs(chatFrames) do
        if frame and frame:IsShown() then
            frame:AddMessage(output)
        end
    end
end

-- Handle chat message
local function OnChatMessage(self, event, ...)
    -- WoW Classic chat event arguments vary by event type
    -- Common format: message, sender, language, channelString, target, ...
    local message, sender = ...
    
    -- Handle different event argument structures
    if not message or message == "" then
        -- Some events may have different argument order
        message = select(1, ...) or ""
        sender = select(2, ...) or ""
    end
    
    -- Get channel type
    local channelType = GetChannelType(event)
    
    -- Check if channel is enabled
    if not IsChannelEnabled(channelType) then
        return
    end
    
    -- Skip our own messages for whisper inform
    if event == "CHAT_MSG_WHISPER_INFORM" then
        return
    end
    
    -- Skip empty messages
    if not message or message == "" then
        return
    end
    
    -- Throttle to avoid processing bursts
    if ShouldThrottle() then
        return
    end
    
    -- Get player's locale (assume English for Classic US/EU)
    -- In practice, you'd detect this or let user configure
    local targetLang = "en"
    
    -- Translate message
    local translated, confidence, intent = Engine.Translate(message, nil, targetLang)
    
    if not translated then
        return -- Failed or low confidence, stay silent
    end
    
    -- Determine behavior based on confidence
    local behavior = Confidence.GetBehavior(confidence)
    
    if behavior == "auto_display" then
        if WhatDidTheySayDB.autoTranslate then
            DisplayTranslation(message, translated, confidence, intent)
        end
    elseif behavior == "manual_option" then
        -- Would show manual option UI here
        -- For now, do nothing unless auto-translate is enabled
        if WhatDidTheySayDB.autoTranslate then
            DisplayTranslation(message, translated, confidence, intent)
        end
    end
    -- behavior == "silent" - do nothing
end

-- Initialize chat hooks
function ChatHooks.Initialize()
    if ChatHooks.initialized then
        return
    end
    
    -- Hook into chat frames
    local chatFrames = {
        ChatFrame1,
        ChatFrame2,
        ChatFrame3,
        ChatFrame4,
        ChatFrame5,
        ChatFrame6,
        ChatFrame7,
    }
    
    -- Create hook frame
    local hookFrame = CreateFrame("Frame")
    
    -- Register events
    hookFrame:RegisterEvent("CHAT_MSG_WHISPER")
    hookFrame:RegisterEvent("CHAT_MSG_WHISPER_INFORM")
    hookFrame:RegisterEvent("CHAT_MSG_SAY")
    hookFrame:RegisterEvent("CHAT_MSG_PARTY")
    hookFrame:RegisterEvent("CHAT_MSG_RAID")
    
    -- Set script
    hookFrame:SetScript("OnEvent", function(self, event, ...)
        OnChatMessage(self, event, ...)
    end)
    
    -- Store hook frame for cleanup if needed
    ChatHooks.hookFrame = hookFrame
    
    ChatHooks.initialized = true
end

WDTS_ChatHooks = ChatHooks

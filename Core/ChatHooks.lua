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

-- Track translated messages (message hash -> {lang, confidence})
ChatHooks.translatedMessages = {}
ChatHooks.translatedMessagesCleanup = {} -- Track cleanup times
ChatHooks.translatedMessagesMaxAge = 300 -- Clean up after 5 minutes

-- Generate a simple hash for message tracking
local function HashMessage(message, sender)
    return tostring(#message) .. ":" .. (sender or "") .. ":" .. message:sub(1, math.min(20, #message))
end

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

-- Map channel names to channel types (support multiple name variations)
local CHANNEL_NAME_MAP = {
    ["Trade"] = "TRADE",
    ["Trade - City"] = "TRADE",
    ["General"] = "GENERAL",
    ["General - City"] = "GENERAL",
    ["LookingForGroup"] = "LFG",
    ["Looking For Group"] = "LFG", -- Handle spaced version
    ["World"] = "WORLD",
    ["LocalDefense"] = "GENERAL", -- Often used as general chat
}

-- Normalize channel name for matching
local function NormalizeChannelName(channelName)
    if not channelName then
        return nil
    end
    
    -- Remove leading numbers like "5. " or "2. "
    local normalized = channelName:match("[^%.]+$") or channelName
    -- Trim whitespace
    normalized = normalized:match("^%s*(.-)%s*$")
    
    -- Also try removing any trailing spaces or formatting
    normalized = normalized:gsub("%s+", " ") -- Normalize multiple spaces to one
    normalized = normalized:match("^%s*(.-)%s*$") -- Trim again
    
    return normalized
end

-- Get channel type from event
local function GetChannelType(event, channelName)
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
    elseif event == "CHAT_MSG_CHANNEL" and channelName then
        -- Normalize channel name
        local normalized = NormalizeChannelName(channelName)
        if not normalized then
            return nil
        end
        
        -- Direct match
        if CHANNEL_NAME_MAP[normalized] then
            return CHANNEL_NAME_MAP[normalized]
        end
        
        -- Case-insensitive match
        local normalizedLower = normalized:lower()
        for name, type in pairs(CHANNEL_NAME_MAP) do
            if name:lower() == normalizedLower then
                return type
            end
        end
        
        -- Partial match (e.g., "Trade - City" contains "Trade")
        -- Check if normalized contains any of our channel keywords
        if normalizedLower:find("trade", 1, true) then
            return "TRADE"
        elseif normalizedLower:find("general", 1, true) then
            return "GENERAL"
        elseif normalizedLower:find("looking") and normalizedLower:find("group", 1, true) then
            return "LFG"
        elseif normalizedLower:find("lfg", 1, true) then
            return "LFG"
        elseif normalizedLower:find("world", 1, true) then
            return "WORLD"
        end
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

-- Add underline to text using Unicode combining characters (U+0332)
local function UnderlineText(text)
    if not text or text == "" then
        return text
    end
    
    -- First extract and preserve color codes, then underline plain text
    local parts = {}
    local i = 1
    while i <= #text do
        local char = text:sub(i, i)
        if char == "|" then
            -- Handle color codes and escape sequences
            if text:sub(i, i + 1) == "|c" then
                -- Color code: |cAARRGGBB
                local endPos = text:find("|r", i + 1)
                if endPos then
                    table.insert(parts, text:sub(i, endPos + 1))
                    i = endPos + 1
                else
                    table.insert(parts, text:sub(i, i))
                    i = i + 1
                end
            else
                -- Other escape sequences
                local endPos = text:find("|", i + 1)
                if endPos then
                    table.insert(parts, text:sub(i, endPos))
                    i = endPos
                else
                    table.insert(parts, char)
                    i = i + 1
                end
            end
        else
            -- Regular character - add with underline combining character
            table.insert(parts, char .. "\204\178") -- U+0332 (combining low line)
            i = i + 1
        end
    end
    
    return table.concat(parts, "")
end

-- Format original message with translation indicator
-- Simple: just change the message text color, preserve everything else (channel, player name, etc.)
local function FormatTranslatedMessage(originalMessage, confidence)
    local indicatorStyle = WhatDidTheySayDB.showTranslationIndicator or "color"
    
    if indicatorStyle == "none" then
        return originalMessage
    end
    
    -- Only apply color - nothing else (no tags, no underlines)
    -- The message parameter is just the message text, channel info is handled separately by WoW
    if confidence >= 0.70 then
        return "|cff88ccff" .. originalMessage .. "|r" -- Light blue tint (subtle)
    else
        return "|cffffcc88" .. originalMessage .. "|r" -- Light yellow tint (less confident)
    end
end

-- Check if translation actually changed the message
local function TranslationChanged(original, translated)
    if not original or not translated then
        return false
    end
    
    -- Remove color codes and normalize for comparison
    local origClean = original:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):lower():gsub("%s+", " "):gsub("%p", "")
    local transClean = translated:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):lower():gsub("%s+", " "):gsub("%p", "")
    
    -- If they're essentially the same after normalization, translation didn't work
    return origClean ~= transClean
end

-- Display translation in chat
local function DisplayTranslation(originalMessage, translatedMessage, confidence, intent)
    -- Don't show translation if it's identical or nearly identical to original
    if not TranslationChanged(originalMessage, translatedMessage) then
        return -- Translation didn't actually change anything, don't show it
    end
    
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
    -- CHAT_MSG_CHANNEL: message, sender, language, channelName, target, ...
    -- Other events: message, sender, language, channelString, target, ...
    local message, sender, language, channelName = ...
    
    -- Handle different event argument structures
    if not message or message == "" then
        -- Some events may have different argument order
        message = select(1, ...) or ""
        sender = select(2, ...) or ""
        language = select(3, ...)
        channelName = select(4, ...)
    end
    
    -- For CHAT_MSG_CHANNEL, channelName might be at position 9 (after other args)
    -- Try to get it from multiple positions if not found at position 4
    if event == "CHAT_MSG_CHANNEL" and (not channelName or channelName == "") then
        channelName = select(9, ...) -- Channel name is often at position 9
        if not channelName or channelName == "" then
            channelName = select(4, ...) -- Fallback to position 4
        end
    end
    
    -- Get channel type (pass channelName for CHAT_MSG_CHANNEL events)
    local channelType = GetChannelType(event, channelName)
    
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
    
    -- Track this message as translated for the chat filter
    local msgHash = HashMessage(message, sender)
    ChatHooks.translatedMessages[msgHash] = {
        original = message,
        lang = "unknown", -- Could track detected language if needed
        confidence = confidence,
        timestamp = GetTime()
    }
    ChatHooks.translatedMessagesCleanup[msgHash] = GetTime() + ChatHooks.translatedMessagesMaxAge
    
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

-- Chat message filter to modify original messages
local function ChatFilterFunc(self, event, message, sender, ...)
    -- Check if this message was translated
    local msgHash = HashMessage(message, sender)
    local translationInfo = ChatHooks.translatedMessages[msgHash]
    
    if translationInfo then
        -- This message was translated - add visual indicator
        local formattedMessage = FormatTranslatedMessage(message, translationInfo.confidence)
        return false, formattedMessage, sender, ... -- false = allow message, but use modified text
    end
    
    -- Not translated, show normally
    return false
end

-- Cleanup old translated message tracking
local function CleanupTranslatedMessages()
    local now = GetTime()
    for msgHash, expireTime in pairs(ChatHooks.translatedMessagesCleanup) do
        if now >= expireTime then
            ChatHooks.translatedMessages[msgHash] = nil
            ChatHooks.translatedMessagesCleanup[msgHash] = nil
        end
    end
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
    hookFrame:RegisterEvent("CHAT_MSG_CHANNEL") -- For Trade, General, LFG, etc.
    
    -- Set script
    hookFrame:SetScript("OnEvent", function(self, event, ...)
        OnChatMessage(self, event, ...)
    end)
    
    -- Add chat message filters to modify original messages
    ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", ChatFilterFunc)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", ChatFilterFunc)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", ChatFilterFunc)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", ChatFilterFunc)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", ChatFilterFunc)
    
    -- Periodically clean up old message tracking
    hookFrame:SetScript("OnUpdate", function(self, elapsed)
        self.lastCleanup = (self.lastCleanup or 0) + elapsed
        if self.lastCleanup >= 30 then -- Clean up every 30 seconds
            CleanupTranslatedMessages()
            self.lastCleanup = 0
        end
    end)
    
    -- Store hook frame for cleanup if needed
    ChatHooks.hookFrame = hookFrame
    
    ChatHooks.initialized = true
end

WDTS_ChatHooks = ChatHooks

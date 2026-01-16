-- WhatDidTheySay - Confidence Scoring
-- Confidence scoring and gating logic

local Utils = WDTS_Utils
local Confidence = {}

-- Confidence thresholds
Confidence.THRESHOLD = {
    AUTO_DISPLAY = 0.70,  -- Automatically display translation
    MANUAL_OPTION = 0.45, -- Show manual translate option
    MIN_SAFE = 0.30,      -- Minimum safe threshold
}

-- Calculate final confidence score
function Confidence.Calculate(params)
    -- params should contain:
    --   languageConfidence: 0.0-1.0
    --   intentConfidence: 0.0-1.0 (optional)
    --   phraseCoverage: 0.0-1.0 (ratio of translated tokens)
    --   unknownTokenRatio: 0.0-1.0 (ratio of unknown tokens)
    --   messageLength: number of tokens
    
    local langConf = params.languageConfidence or 0.0
    local intentConf = params.intentConfidence or 0.0
    local coverage = params.phraseCoverage or 0.0
    local unknownRatio = params.unknownTokenRatio or 0.0
    local length = params.messageLength or 0
    
    -- Base score from language detection
    local score = langConf * 0.4
    
    -- Intent confidence bonus (if intent was detected)
    if intentConf > 0 then
        score = score + (intentConf * 0.3)
    end
    
    -- Coverage bonus (how much we translated)
    score = score + (coverage * 0.2)
    
    -- Unknown token penalty
    score = score - (unknownRatio * 0.2)
    
    -- Length adjustment (very short messages are harder)
    if length < 3 then
        score = score * 0.9
    elseif length > 15 then
        score = score * 0.95 -- Slightly harder for very long messages
    end
    
    -- Clamp to 0.0-1.0
    score = Utils.Clamp(score, 0.0, 1.0)
    
    return score
end

-- Determine output behavior based on confidence
function Confidence.GetBehavior(confidence)
    if confidence >= Confidence.THRESHOLD.AUTO_DISPLAY then
        return "auto_display"
    elseif confidence >= Confidence.THRESHOLD.MANUAL_OPTION then
        return "manual_option"
    else
        return "silent"
    end
end

-- Check if confidence is sufficient for automatic display
function Confidence.ShouldAutoDisplay(confidence)
    return confidence >= Confidence.THRESHOLD.AUTO_DISPLAY
end

-- Check if confidence is sufficient for manual option
function Confidence.ShouldShowManualOption(confidence)
    return confidence >= Confidence.THRESHOLD.MANUAL_OPTION
end

WDTS_Confidence = Confidence

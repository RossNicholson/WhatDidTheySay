-- WhatDidTheySay - Confidence Scoring
-- Confidence scoring and gating logic

local Utils = WDTS_Utils
local Confidence = {}

-- Confidence thresholds
Confidence.THRESHOLD = {
    AUTO_DISPLAY = 0.50,  -- Automatically display translation (lowered from 0.70)
    MANUAL_OPTION = 0.30, -- Show manual translate option (lowered from 0.45)
    MIN_SAFE = 0.25,      -- Minimum safe threshold (lowered from 0.30)
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
    local similarity = params.translationSimilarity or 0.0
    
    -- Base score from language detection
    local score = langConf * 0.25 -- Slightly reduced weight
    
    -- Coverage is important but be more lenient for mixed-language messages
    -- If we translated most German words (even if some are English), that's good
    score = score + (coverage * 0.45) -- Increased weight, but less penalizing overall
    
    -- Special boost for mixed-language messages with German words
    -- If we have low coverage but detected German and translated German words correctly,
    -- that's still useful (e.g., "LF Tank für DM" -> "LF Tank for DM")
    -- Check if this is a mixed-language message (low coverage but German words present)
    if coverage >= 0.3 and coverage < 0.7 and langConf >= 0.3 and langConf < 0.7 then
        -- Likely mixed-language: boost confidence if we translated the German parts
        -- Calculate "German word coverage" - how many German words we translated
        local germanWordCoverage = coverage -- For now, use overall coverage as proxy
        if germanWordCoverage >= 0.4 then
            -- We translated at least some German words - boost confidence
            score = score + 0.25 -- Increased boost for successfully translating German in mixed messages
        end
    end
    -- Additional boost for messages with German function words (für, von, etc.) in mixed context
    -- These are high-confidence translations even with low overall coverage
    if coverage >= 0.3 and coverage <= 0.6 and langConf >= 0.4 then
        -- We have moderate language confidence and translated some words
        -- Likely a useful mixed-language translation
        score = score + 0.10 -- Additional boost for moderate-confidence mixed messages
    end
    
    -- Special boost for bracket-only messages (quest/item names) with German words
    -- Even with low coverage due to proper nouns/numbers, if we translated German words it's useful
    -- Check if this is likely a bracket-only message (params can include message text via similarity check)
    -- For now, we'll boost if coverage is >= 0.25 and we're in the mixed-language range
    if coverage >= 0.25 and coverage < 0.5 and langConf >= 0.4 and langConf < 0.7 then
        -- Likely a bracket-only message with some German words - boost confidence
        score = score + 0.15 -- Boost for bracket-only messages with German words
    end
    
    -- Special boost for short messages (2-3 words) with high coverage
    -- These are often common phrases that translate reliably
    if length >= 2 and length <= 3 and coverage >= 0.9 then
        score = score + 0.25 -- Significant boost for reliable short phrases
    end
    -- Extra boost for 2-word phrases with perfect coverage (common idioms)
    if length == 2 and coverage >= 1.0 then
        score = score + 0.10 -- Additional boost for perfect 2-word phrases
    end
    
    -- Intent confidence bonus (if intent was detected)
    if intentConf > 0 then
        score = score + (intentConf * 0.15) -- Intent helps but not critical
    end
    
    -- Unknown token penalty (less severe - many messages have proper nouns/names)
    score = score - (unknownRatio * 0.2) -- Reduced penalty from 0.3 to 0.2
    
    -- Similarity penalty: be more lenient, especially for mixed-language
    -- Mixed-language messages (e.g., "LF Tank für ST") naturally have higher similarity
    if similarity > 0.75 then
        -- Only penalize heavily if VERY similar (>75%) AND we have good reason to think it's wrong
        -- For mixed messages, similarity of 60-75% is expected
        score = score * (1.0 - (similarity - 0.75) * 2.0) -- Less harsh penalty
    elseif similarity > 0.60 then
        -- Moderate similarity (60-75%) - likely mixed language, small penalty
        score = score * 0.95 -- Very small penalty
    end
    
    -- Coverage-based penalties (less harsh)
    if coverage < 0.3 then
        -- Less than 30% translated - low confidence
        score = score * 0.5 -- Less harsh (was 0.4)
    elseif coverage < 0.5 then
        -- Less than 50% translated - moderate confidence
        score = score * 0.75 -- Less harsh (was 0.6)
    elseif coverage < 0.7 then
        -- Less than 70% translated - still decent
        score = score * 0.9 -- Less harsh (was 0.8)
    end
    -- coverage >= 0.7 gets no penalty
    
    -- Length adjustment (very short messages - but if we have high coverage, boost confidence)
    -- Special case: Single-word greetings should have high confidence
    if length == 1 and coverage >= 1.0 then
        -- Single-word messages with perfect coverage (like "moin" -> "hi/hello")
        score = score + 0.5 -- Significant boost for single-word perfect translations
    elseif length < 3 then
        if coverage >= 1.0 then
            -- Perfect coverage for short messages is actually good - boost it
            score = score * 1.1
        else
            score = score * 0.9
        end
    elseif length == 2 and coverage >= 0.8 then
        -- Two-word messages with good coverage are reliable
        score = score * 1.05
    elseif length > 15 then
        score = score * 0.95 -- Slightly harder for very long messages
    end
    
    -- Boost confidence for incomplete sentences/fragments if we have decent coverage
    -- Chat fragments are common and should be translated if we understand them
    if length >= 1 and length <= 3 and coverage >= 0.6 then
        -- Short fragments with good coverage - likely complete thoughts
        score = score + 0.15
    elseif length >= 1 and length <= 2 and coverage >= 0.8 then
        -- Very short fragments with high coverage - boost significantly
        score = score + 0.20
    end
    
    -- Reduce penalty for incomplete sentences (fragments are normal in chat)
    -- If we have good coverage but sentence seems incomplete, don't penalize as much
    if length >= 1 and length <= 4 and coverage >= 0.5 and score < 0.50 then
        -- Fragment with decent coverage - might be intentional short message
        score = score + 0.10
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

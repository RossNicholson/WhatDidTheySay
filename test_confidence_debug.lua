-- Quick confidence debug
local Utils = WDTS_Utils
local Confidence = WDTS_Confidence

local score = Confidence.Calculate({
    languageConfidence = 0.5,
    intentConfidence = 0.0,
    phraseCoverage = 1.0,
    unknownTokenRatio = 0.0,
    messageLength = 2,
    translationSimilarity = 0.5,
})

print("Confidence for 2-word, 100% coverage:", score)

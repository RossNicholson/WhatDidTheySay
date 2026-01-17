-- WhatDidTheySay - French Language Pack - Metadata
-- Language-specific metadata for phrase matching and detection

WDTS_Lang_fr_Metadata = {
    -- Articles used for fuzzy phrase matching
    -- These can appear before phrases and should be handled during matching
    articles = {
        ["le"] = true,
        ["la"] = true,
        ["les"] = true,
        ["un"] = true,
        ["une"] = true,
        ["des"] = true,
        ["du"] = true,
        ["de"] = true,
        ["au"] = true,
        ["aux"] = true,
    },
    
    -- Character hints for language detection
    -- These characters strongly indicate French
    charHints = {
        ["é"] = true,
        ["è"] = true,
        ["ê"] = true,
        ["ë"] = true,
        ["à"] = true,
        ["â"] = true,
        ["ç"] = true,
        ["ô"] = true,
        ["ù"] = true,
        ["û"] = true,
        ["î"] = true,
        ["ï"] = true,
        ["É"] = true,
        ["È"] = true,
        ["Ê"] = true,
        ["Ë"] = true,
        ["À"] = true,
        ["Â"] = true,
        ["Ç"] = true,
        ["Ô"] = true,
        ["Ù"] = true,
        ["Û"] = true,
        ["Î"] = true,
        ["Ï"] = true,
    },
}

-- WhatDidTheySay - German Language Pack - Metadata
-- Language-specific metadata for phrase matching and detection

WDTS_Lang_de_Metadata = {
    -- Articles used for fuzzy phrase matching
    -- These can appear before phrases and should be handled during matching
    articles = {
        ["der"] = true,
        ["die"] = true,
        ["das"] = true,
        ["den"] = true,
        ["dem"] = true,
        ["des"] = true,
        ["ein"] = true,
        ["eine"] = true,
        ["einen"] = true,
        ["einem"] = true,
        ["eines"] = true,
    },
    
    -- Character hints for language detection
    -- These characters strongly indicate German
    charHints = {
        ["ä"] = true,
        ["ö"] = true,
        ["ü"] = true,
        ["ß"] = true,
        ["Ä"] = true,
        ["Ö"] = true,
        ["Ü"] = true,
    },
}

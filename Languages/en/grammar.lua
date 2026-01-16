-- WhatDidTheySay - English Language Pack - Grammar
-- Small post-processing rules

WDTS_Lang_en_Grammar = {
    rules = {
        -- Basic corrections
        -- "a [vowel]" -> "an [vowel]"
        {
            from = " a ([aeiouAEIOU])",
            to = " an %1",
        },
    },
}

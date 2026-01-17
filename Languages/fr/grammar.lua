-- WhatDidTheySay - French Language Pack - Grammar
-- Post-processing rules for French to English word order and grammar fixes

WDTS_Lang_fr_Grammar = {
    rules = {
        -- Basic word order adjustments (simple cases)
        -- "you can" -> "can you" (for questions)
        {
            from = "^you can ",
            to = "can you ",
        },
        -- Article corrections
        {
            from = " a ([aeiouAEIOU])",
            to = " an %1",
        },
        
        -- Fix double articles
        {
            from = "the the ",
            to = "the ",
        },
        {
            from = " a a ",
            to = " a ",
        },
        
        -- Fix common mistranslations
        {
            from = "the who ",
            to = "who ",
        },
        {
            from = "the that ",
            to = "that ",
        },
        
        -- Remove redundant words in some patterns
        {
            from = "has has ",
            to = "has ",
        },
        {
            from = "is is ",
            to = "is ",
        },
    },
}

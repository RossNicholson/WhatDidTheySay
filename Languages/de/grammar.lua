-- WhatDidTheySay - German Language Pack - Grammar
-- Post-processing rules for German to English word order and grammar fixes

WDTS_Lang_de_Grammar = {
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
        
        -- Fix common German-to-English word order issues
        
        -- "has X lost" -> "has lost X" (when X is a direct object)
        {
            from = "has die (.+) lost",
            to = "has lost the %1",
        },
        {
            from = "has das (.+) lost",
            to = "has lost the %1",
        },
        {
            from = "has der (.+) lost",
            to = "has lost the %1",
        },
        {
            from = "has (.+) lost",
            to = "has lost %1",
        },
        
        -- "has X made" -> "has made X"
        {
            from = "has die (.+) made",
            to = "has made the %1",
        },
        {
            from = "has (.+) made",
            to = "has made %1",
        },
        
        -- "has X said" -> "has said X"
        {
            from = "has (.+) said",
            to = "has said %1",
        },
        
        -- Fix "control over X" -> ensure proper order
        {
            from = "control over (.+) lost",
            to = "lost control over %1",
        },
        
        -- "who X has lost Y" -> "who has lost X Y" (simplify complex structures)
        -- This is a heuristic and may not always be perfect, but helps common cases
        
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
        
        -- Fix word order for common German structures
        {
            from = "habe no ",
            to = "have no ",
        },
        {
            from = "must leider ",
            to = "unfortunately must ",
        },
        {
            from = "muss leider ",
            to = "unfortunately must ",
        },
        
        -- Fix German word order: "can me who" -> "can someone"
        {
            from = "can me who ",
            to = "can someone ",
        },
        -- Fix "can someone to X port" -> "can someone port me to X"
        {
            from = "can someone to (.+) port",
            to = "can someone port me to %1",
        },
        {
            from = "can someone to (.+) port please",
            to = "can someone port me to %1 please",
        },
        {
            from = "can someone to (.+) port pls",
            to = "can someone port me to %1 please",
        },
        -- Also handle "can me who" patterns (if phrase matching didn't catch it)
        {
            from = "can me who to (.+) port",
            to = "can someone port me to %1",
        },
        {
            from = "can me who to (.+) port please",
            to = "can someone port me to %1 please",
        },
        {
            from = "can me who to (.+) port pls",
            to = "can someone port me to %1 please",
        },
        
        -- Fix "anschluss an a" -> "connection to a" or "join a"
        {
            from = "anschluss an a ",
            to = "connection to a ",
        },
        {
            from = "anschluss an eine ",
            to = "connection to a ",
        },
        {
            from = "looking for anschluss an a ",
            to = "looking for connection to a ",
        },
        {
            from = "looking for anschluss an eine ",
            to = "looking for connection to a ",
        },
        
        -- Fix "from when can you as rogue two daggers use" -> "from when can you use two daggers as a rogue"
        {
            from = "from when can (.+) as (.+) two daggers use",
            to = "from when can %1 use two daggers as a %2",
        },
        {
            from = "from when can (.+) as (.+) two (.+) use",
            to = "from when can %1 use two %3 as a %2",
        },
        -- Also handle "can you as X Y use" -> "can you use Y as X"
        {
            from = "can you as (.+) (.+) use",
            to = "can you use %2 as a %1",
        },
        {
            from = "can one as (.+) (.+) use",
            to = "can one use %2 as a %1",
        },
        
        -- Fix "can me someone at X help" -> "can someone help me with X"
        {
            from = "can me someone at (.+) help",
            to = "can someone help me with %1",
        },
        {
            from = "can you me at (.+) help",
            to = "can you help me with %1",
        },
        {
            from = "can you me at (.+) help please",
            to = "can you help me with %1 please",
        },
        -- Fix "need help at X" -> "need help with X"
        {
            from = "need help at (.+)",
            to = "need help with %1",
        },
        -- Fix "at dieser quest" -> "with this quest"
        {
            from = "at dieser quest",
            to = "with this quest",
        },
        {
            from = "at diese quest",
            to = "with this quest",
        },
        {
            from = "at dieses quest",
            to = "with this quest",
        },
        
        -- Fix "where must one/you for X eigentlich to/there" -> "where do you go for X"
        {
            from = "where must one/you for (.+) eigentlich to/there",
            to = "where do you go for %1",
        },
        {
            from = "where must one/you for (.+) to/there",
            to = "where do you go for %1",
        },
    },
}

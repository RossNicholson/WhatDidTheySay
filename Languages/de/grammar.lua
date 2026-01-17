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
        
        -- Fix "can me someone" -> "can someone"
        {
            from = "can me someone (.+)",
            to = "can someone %1",
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
        -- Fix "can someone buy me sweet a wand" -> "can someone buy me a sweet wand"
        {
            from = "can someone buy me sweet a (.+)",
            to = "can someone buy me a sweet %1",
        },
        {
            from = "can someone buy me (.+) a (.+)",
            to = "can someone buy me a %1 %2", -- Fixes word order
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
        
        -- Fix "can me someone X buy" -> "can someone buy me X"
        {
            from = "can me someone (.+) buy",
            to = "can someone buy me %1",
        },
        -- Fix "can someone on/up/at sweet/cute/nice a wand/staff buy" -> "can someone buy me a sweet wand"
        {
            from = "can someone on/up/at (.+)/.+/(.+) a (.+)/.+/(.+) buy",
            to = "can someone buy me a %1 %3",
        },
        {
            from = "can someone on/up/at (.+) a (.+) buy",
            to = "can someone buy me a %1 %2",
        },
        -- Fix "can someone a X buy" -> "can someone buy me a X"
        {
            from = "can someone a (.+) buy",
            to = "can someone buy me a %1",
        },
        -- Fix "can someone to X port" -> "can someone port to X" (if pattern didn't match)
        {
            from = "can someone to (.+) port",
            to = "can someone port to %1",
        },
        {
            from = "can someone to (.+) teleport",
            to = "can someone teleport to %1",
        },
        -- Fix "when is who/that X coming" -> "when is the X coming"
        {
            from = "when is who/that (.+) coming",
            to = "when is the %1 coming",
        },
        {
            from = "when is the (.+) coming",
            to = "when is the %1 coming", -- Already correct, but ensure it stays
        },
        -- Fix "lfm / lfg whom/that main stone break" -> "lfm / lfg break the main stone"
        {
            from = "ifm / lfg whom/that (.+) (.+)",
            to = "lfm / lfg %2 the %1",
        },
        {
            from = "lfm / lfg whom/that (.+) (.+)",
            to = "lfm / lfg %2 the %1",
        },
        -- Fix "lfm / lfg the main stone break" -> "lfm / lfg break the main stone"
        {
            from = "lfm / lfg the (.+) (.+)",
            to = "lfm / lfg %2 the %1",
        },
        {
            from = "ifm / lfg the (.+) (.+)",
            to = "lfm / lfg %2 the %1",
        },
        -- Fix "has me someone X" -> "does someone have X for me"
        {
            from = "has me someone (.+)",
            to = "does someone have %1 for me",
        },
        {
            from = "has me someone (.+) silver",
            to = "does someone have %1 silver for me",
        },
        -- Fix "we will us a bit loot steal but go there definitely still more often in"
        {
            from = "we will us (.+) loot steal but go there definitely still (.+) more often in",
            to = "we will steal a bit of loot but will definitely go in there more often",
        },
        {
            from = "we werden us (.+) loot klauen aber go there definitely still (.+) öfter rein",
            to = "we will steal a bit of loot but will definitely go in there more often",
        },
        -- Fix "we want steal" -> "we will steal"
        {
            from = "we want steal a bit of loot but want definitely go in there more often",
            to = "we will steal a bit of loot but will definitely go in there more often",
        },
        {
            from = "we want (.+) but want (.+)",
            to = "we will %1 but will %2",
        },
        -- Fix "comes again a buff" -> "is there another buff coming"
        {
            from = "comes nochmal a (.+)",
            to = "is there another %1 coming",
        },
        {
            from = "come nochmal a (.+)",
            to = "is there another %1 coming",
        },
        -- Fix "wanted will a friendly mage" -> "looking for a friendly mage"
        {
            from = "wanted will a (.+) for (.+)",
            to = "looking for a %1 for %2",
        },
        {
            from = "wanted will ein (.+) for (.+)",
            to = "looking for a %1 for %2",
        },
        
        -- Fix "am still low priest" -> "am still a low priest" (missing article)
        {
            from = "am still low priest",
            to = "am still a low priest",
        },
        {
            from = "am still low (.+)",
            to = "am still a low %1",
        },
        {
            from = "bin still low (.+)",
            to = "am still a low %1",
        },
        
        -- Fix "the main stone break" -> "break the main stone"
        -- "Den Hauptstein zerbrechen" = "Break the main stone"
        {
            from = "the main stone break",
            to = "break the main stone",
        },
        -- Fix "at/on like/as magnets" -> "like magnets"
        {
            from = "at/on like/as magnets",
            to = "like magnets",
        },
        {
            from = "at/on like/as (.+)",
            to = "like %1",
        },
        -- Fix "we pull/we attract adds" -> "we attract adds"
        {
            from = "we pull/we attract (.+)",
            to = "we attract %1",
        },
        
        -- Fix "in the time come on/up/at our dc" -> "meanwhile come on our dc"
        {
            from = "in the time come on/up/at our dc",
            to = "meanwhile come on our dc",
        },
        {
            from = "in the time comes on/up/at our dc",
            to = "meanwhile comes on our dc",
        },
        
        -- Fix "at/on all/everyone again/another time" -> "to everyone again"
        {
            from = "at/on all/everyone again/another time",
            to = "to everyone again",
        },
        
        -- Fix "will many events plan" -> "will plan many events"
        {
            from = "will many events plan",
            to = "will plan many events",
        },
        {
            from = "werde many events planen",
            to = "will plan many events",
        },
        
        -- Fix "of course with rewards therefore join all/everyone" -> "of course with rewards therefore everyone join"
        {
            from = "therefore join all/everyone",
            to = "therefore everyone join",
        },
        
        -- Fix "the German guild recruits comrades" -> better word order if needed
        {
            from = "the German guild recruits comrades from minimum level",
            to = "the German guild recruits comrades from minimum level",
        },
        
        -- Fix "for common activities like/as leveling" -> "for common activities like leveling"
        {
            from = "for common activities like/as leveling",
            to = "for common activities like leveling",
        },
        
        -- Fix "like leveling dungeons" -> "like leveling, dungeons" (add comma)
        {
            from = "like leveling dungeons",
            to = "like leveling, dungeons",
        },
        
        -- Fix "future raiding/raiding in the future" -> "future raiding" (clean up phrase)
        {
            from = "future raiding/raiding in the future",
            to = "future raiding",
        },
        
        -- Fix "like/as" when used as "like" -> "like"
        {
            from = " like/as ",
            to = " like ",
        },
        {
            from = "like/as leveling",
            to = "like leveling",
        },
        {
            from = "like/as dungeons",
            to = "like dungeons",
        },
    },
}

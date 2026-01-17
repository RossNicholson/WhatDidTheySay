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
        
        -- Fix "would like who X go" -> "does anyone want to go to X"
        {
            from = "would like who (.+) go",
            to = "does anyone want to go to %1",
        },
        {
            from = "would like who (.+) go%?",
            to = "does anyone want to go to %1",
        },
        
        -- Fix "still not mal started" -> "haven't even started yet"
        {
            from = "still not mal started",
            to = "haven't even started yet",
        },
        {
            from = "still not even started",
            to = "haven't even started yet",
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
        
        -- Fix "but can you have enchant" -> "but can you have it enchanted"
        {
            from = "can you have enchant",
            to = "can you have it enchanted",
        },
        {
            from = "can you have enchant\\?",
            to = "can you have it enchanted",
        },
        {
            from = "aber can you have enchant",
            to = "but can you have it enchanted",
        },
        
        -- Fix "have a/an weapon the like a/an atomic bomb hits/strikes" -> "have a weapon that hits like an atomic bomb"
        {
            from = "have you a/an weapon the like a/an atomic bomb hits/strikes",
            to = "have you a weapon that hits like an atomic bomb",
        },
        {
            from = "have you a/an weapon the like a/an atomic bomb hits/strikes",
            to = "you have a weapon that hits like an atomic bomb",
        },
        
        -- Fix "wants/wants to/likes level/leveling" -> "wants to level"
        {
            from = "wants/wants to/likes level/leveling",
            to = "wants to level",
        },
        {
            from = "und wants/wants to/likes level/leveling",
            to = "and wants to level",
        },
        {
            from = "mag level/leveling",
            to = "wants to level",
        },
        
        -- Fix "can who X make" -> "can someone make X"
        {
            from = "can who (.+) make",
            to = "can someone make %1",
        },
        {
            from = "can who (.+) make\\?",
            to = "can someone make %1",
        },
        
        -- Fix "in the trade fenster gives/is there it unten a slot" -> "in the trade window there is a slot at the bottom"
        {
            from = "in the trade fenster gives/is there it unten a slot",
            to = "in the trade window there is a slot at the bottom",
        },
        
        -- Fix "the one/you not traded-there packt one/you" -> "that you don't trade - there you put"
        {
            from = "the one/you not traded-there packt one/you",
            to = "that you don't trade - there you put",
        },
        
        -- Fix "the to verzaubernde weapon in" -> "the weapon to be enchanted in"
        {
            from = "the to verzaubernde weapon in",
            to = "the weapon to be enchanted in",
        },
        
        -- Fix "an enhcanter does the then" -> "an enchanter does it then"
        {
            from = "an enhcanter does the then",
            to = "an enchanter does it then",
        },
        
        -- Fix "the goes then trd" -> "that works anyway"
        {
            from = "the goes then trd",
            to = "that works anyway",
        },
        {
            from = "ah lol the goes then trd",
            to = "ah lol that works anyway",
        },
        {
            from = "the goes then anyway/nevertheless",
            to = "that works anyway",
        },
        {
            from = "ah lol the goes then anyway/nevertheless",
            to = "ah lol that works anyway",
        },
        {
            from = "das goes then anyway/nevertheless",
            to = "that works anyway",
        },
        {
            from = "ah lol das goes then anyway/nevertheless",
            to = "ah lol that works anyway",
        },
        
        -- Fix Message 2: complex sentence structure improvements
        {
            from = "a slot the one/you not traded-there put/place one/you the to to be enchanted/enchanting weapon in",
            to = "a slot that you don't trade - there you put the weapon to be enchanted in",
        },
        {
            from = "and an enchanter does the then",
            to = "and an enchanter does it then",
        },
        {
            from = "in the trade window there is below/there is at the bottom a slot the one/you not traded-there put/place one/you the to to be enchanted/enchanting weapon in and an enchanter does the then",
            to = "in the trade window there is a slot at the bottom that you don't trade - there you put the weapon to be enchanted in and an enchanter does it then",
        },
        
        -- Fix "if/when you in SW reinkommst" -> "when you come into SW"
        {
            from = "if/when you in (.+) reinkommst",
            to = "when you come into %1",
        },
        
        -- Fix "am here but seh you not" -> "am here but don't see you"
        {
            from = "am here but seh you not",
            to = "am here but don't see you",
        },
        {
            from = "but seh you not",
            to = "but don't see you",
        },
        
        -- Fix "need her/their the" -> "do you need the" (context for "ihr")
        {
            from = "need her/their the",
            to = "do you need the",
        },
        
        -- Fix "thanks ich hab X and Y" -> "thanks I have X and Y"
        {
            from = "thanks ich hab (.+) and (.+)",
            to = "thanks I have %1 and %2",
        },
        
        -- Fix "geb you soon what to/for verteilen" -> "will give you something to distribute soon"
        {
            from = "geb you soon what to/for verteilen",
            to = "will give you something to distribute soon",
        },
        {
            from = "geb you soon what to/for distribute",
            to = "will give you something to distribute soon",
        },
        
        -- Fix "ich could two X bags good gebrauchen" -> "I could use two X bags well"
        {
            from = "ich could two (.+) bags good gebrauchen",
            to = "i could use two %1 bags well",
        },
        {
            from = "ich could two (.+) bags good use/need",
            to = "i could use two %1 bags well",
        },
        
        -- Fix "running/going to SW" -> "going to SW"
        {
            from = "running/going to (.+)",
            to = "going to %1",
        },
        
        -- Fix "yes in if" -> "yes in IF"
        {
            from = "yes in if",
            to = "yes in IF",
        },
        
        -- Fix "and can him a buy?" -> "and can buy him one?"
        {
            from = "and can him a buy%?",
            to = "and can buy him one",
        },
        {
            from = "and can him a buy",
            to = "and can buy him one",
        },
        
        -- Fix "or are you in if dea" -> "or are you in IF Dea?"
        {
            from = "or are you in if (.+)",
            to = "or are you in IF %1",
        },
        
        -- Fix "is someone grad in if" -> "is someone currently in IF"
        {
            from = "is someone grad in if",
            to = "is someone currently in IF",
        },
        {
            from = "is someone currently/right now in if",
            to = "is someone currently in IF",
        },
        
        -- Fix "become money from me back" -> "will get money back from me"
        {
            from = "become money from me back",
            to = "will get money back from me",
        },
        {
            from = "gets/receives money from me back",
            to = "will get money back from me",
        },
        
        -- Fix "dea just have to short/brief warten" -> "Dea just have to wait briefly"
        {
            from = "(.+) just have to short/brief warten",
            to = "%1 just have to wait briefly",
        },
        {
            from = "(.+) just have to short/brief wait",
            to = "%1 just have to wait briefly",
        },
        
        -- Fix "but ich habs gestern already erwähnt am noob newbie" -> "but I mentioned it yesterday, I'm a noob newbie"
        {
            from = "but ich habs gestern already erwähnt am noob newbie",
            to = "but I mentioned it yesterday, I'm a noob newbie",
        },
        {
            from = "but ich have it gestern already mentioned am noob newbie",
            to = "but I mentioned it yesterday, I'm a noob newbie",
        },
        {
            from = "but ich have it yesterday already mentioned am noob newbie",
            to = "but I mentioned it yesterday, I'm a noob newbie",
        },
        
        -- Fix "and have definitely already 5 chars in the exile d" -> "and definitely already have 5 chars in exile"
        {
            from = "and have definitely already (.+) chars in the exile (.+)",
            to = "and definitely already have %1 chars in exile",
        },
        
        -- Fix "such you someone where with you questet" -> "look for someone who quests with you"
        {
            from = "such you someone where with you questet",
            to = "look for someone who quests with you",
        },
        {
            from = "look for/search you someone where with you quests",
            to = "look for someone who quests with you",
        },
        
        -- Fix "so lernst you" -> "that's how you learn"
        {
            from = "so lernst you",
            to = "that's how you learn",
        },
        {
            from = "so learn you",
            to = "that's how you learn",
        },
        
        -- Fix "and is am sichersten" -> "and is the safest"
        {
            from = "and is am sichersten",
            to = "and is the safest",
        },
        {
            from = "and is the safest",
            to = "and is the safest",
        },
        
        -- Fix "yes play still with 2 work colleagues" -> "yes still play with 2 work colleagues"
        {
            from = "yes play still with (.+) work colleagues",
            to = "yes still play with %1 work colleagues",
        },
        {
            from = "yes play still with (.+) colleagues",
            to = "yes still play with %1 colleagues",
        },
        
        -- Fix "the a want erst" -> "the one wants first"
        {
            from = "the a want erst",
            to = "the one wants first",
        },
        {
            from = "the a want first/only",
            to = "the one wants first",
        },
        {
            from = "the one want first/only with level (.+)",
            to = "the one wants first at level %1",
        },
        
        -- Fix "invite sie in xd" -> "invite her"
        {
            from = "invite (.+) in (.+)",
            to = "invite %1", -- Remove "in xd" part
        },
        {
            from = "invite sie",
            to = "invite her", -- "sie" in this context means "her"
        },
        {
            from = "invite her/they",
            to = "invite her", -- Prefer "her" in this context
        },
        
        -- Fix "loch modan warst you already" -> "were you already in Loch Modan?"
        {
            from = "loch modan warst you already",
            to = "were you already in Loch Modan",
        },
        {
            from = "(.+) warst you already",
            to = "were you already in %1",
        },
        
        -- Fix "oh ich attempt/try it even/once in westfall" -> "oh I'll try it in Westfall"
        {
            from = "oh ich attempt/try it even/once in westfall",
            to = "oh I'll try it in Westfall",
        },
        
        -- Fix "am now almost there" -> "am almost there now"
        {
            from = "am now almost there",
            to = "am almost there now",
        },
        
        -- Fix "if/when what passiert seht her/their it yes" -> "if something happens you'll see it"
        {
            from = "if/when what happens/happened seht her/their it yes",
            to = "if something happens you'll see it",
        },
        
        -- Fix "simply safe play" -> "simply play safe"
        {
            from = "simply safe play",
            to = "simply play safe",
        },
        
        -- Fix "not zuuuu much/many wollen" -> "don't want too much"
        {
            from = "not zuuuu much/many want",
            to = "don't want too much",
        },
        {
            from = "not zuuuu much/many wollen",
            to = "don't want too much",
        },
        
        -- Fix "lochmodan have ich only 2-3 quests make can" -> "in Loch Modan I could only do 2-3 quests"
        {
            from = "lochmodan have ich only (.+) quests make can",
            to = "in Loch Modan I could only do %1 quests",
        },
        {
            from = "(.+) have ich only (.+) quests make can",
            to = "in %1 I could only do %2 quests",
        },
        
        -- Fix "simply not südlich the base in westfall go" -> "simply don't go south of the base in Westfall"
        {
            from = "simply not südlich the base in westfall go",
            to = "simply don't go south of the base in Westfall",
        },
        
        -- Fix "and vorsicht am wasser" -> "and be careful at the water"
        {
            from = "and careful at the water",
            to = "and be careful at the water",
        },
        {
            from = "and vorsicht am wasser",
            to = "and be careful at the water",
        },
        
        -- Fix "a/an the besonders" -> "no especially those"
        {
            from = "a/an the especially",
            to = "no especially those",
        },
        {
            from = "a/an the besonders",
            to = "no especially those",
        },
        
        -- Fix "loch modan were you already" -> "were you already in Loch Modan?"
        {
            from = "loch modan were you already",
            to = "were you already in Loch Modan",
        },
        
        -- Fix "in 4 min am ich at the airport of IF" -> "in 4 min I'll be at the airport of IF"
        {
            from = "in (.+) min am ich at the airport of IF",
            to = "in %1 min I'll be at the airport of IF",
        },
        
        -- Fix "oh ich try it in Westfall" -> "oh I'll try it in Westfall"
        {
            from = "oh ich try it in Westfall",
            to = "oh I'll try it in Westfall",
        },
        {
            from = "oh ich attempt/try it even/once in Westfall",
            to = "oh I'll try it in Westfall",
        },
        
        -- Fix "if/when what happens/happened you see it yes" -> "if something happens you'll see it"
        {
            from = "if/when what happens/happened you see it yes",
            to = "if something happens you'll see it",
        },
        
        -- Fix "simply not south of the base in Westfall go" -> "simply don't go south of the base in Westfall"
        {
            from = "simply not south of the base in Westfall go",
            to = "simply don't go south of the base in Westfall",
        },
        
        -- Fix "prefer slower but instead/for that safe" -> "prefer slower but safe instead"
        {
            from = "prefer slower but instead/for that safe",
            to = "prefer slower but safe instead",
        },
        
        -- Fix "and careful of/beware of trappers and pillagers" -> "and be careful of trappers and pillagers"
        {
            from = "and careful of/beware of trappers and pillagers",
            to = "and be careful of trappers and pillagers",
        },
        
        -- Fix "so/also careful of everything/especially actually" -> "so be careful of everything actually"
        {
            from = "so/also careful of everything/especially actually",
            to = "so be careful of everything actually",
        },
        
        -- Fix "a/an especially those" -> "no especially those" (ne = no)
        {
            from = "a/an especially those (.+)",
            to = "no especially those %1",
        },
        {
            from = "^a/an especially those$",
            to = "no especially those",
        },
        
        -- Fix "lfm" from "ifm" -> "LFM" (capitalize)
        {
            from = "^ifm ",
            to = "LFM ",
        },
        {
            from = "^ifm$",
            to = "LFM",
        },
        {
            from = "^lfm ",
            to = "LFM ",
        },
        {
            from = "^lfm$",
            to = "LFM",
        },
        
        -- Fix "wanted:" in quest context -> "WANTED:"
        {
            from = "wanted:",
            to = "WANTED:",
        },
        -- Fix "wanted " after bracket -> "WANTED: "
        {
            from = "%] wanted ",
            to = "] WANTED: ",
        },
        -- Fix "wanted" after bracket without colon -> "WANTED:"
        {
            from = "%] wanted",
            to = "] WANTED:",
        },
        -- Fix "wanted " anywhere in bracket context -> "WANTED: "
        {
            from = " wanted ",
            to = " WANTED: ",
        },
        -- Fix missing exclamation and closing bracket in quest context: "gurgelbacke (4740" -> "Gurgelbacke! (4740)]"
        {
            from = "WANTED: ([a-z]+) %((%d+)$",
            to = "WANTED: %1! (%2)]",
        },
        -- Capitalize creature/quest names after WANTED: (simple capitalization)
        {
            from = "WANTED: g",
            to = "WANTED: G",
        },
        
        -- Fix "oh need to do X has who want to/interest" -> "oh I need to do X, does anyone want to?"
        {
            from = "oh need to do (.+) has who want to/interest",
            to = "oh I need to do %1, does anyone want to",
        },
        {
            from = "oh need to do (.+) has who bock",
            to = "oh I need to do %1, does anyone want to",
        },
        {
            from = "oh must (.+) make has who want to/interest",
            to = "oh I need to do %1, does anyone want to",
        },
        {
            from = "oh must (.+) make has who bock",
            to = "oh I need to do %1, does anyone want to",
        },
        -- Fix "has who bock" -> "does anyone want to"
        {
            from = "has who bock",
            to = "does anyone want to",
        },
        {
            from = "has who want to/interest",
            to = "does anyone want to",
        },
        -- Fix "oh i need to do X has who bock" -> "oh I need to do X, does anyone want to"
        {
            from = "oh i need to do (.+) has who bock",
            to = "oh I need to do %1, does anyone want to",
        },
        {
            from = "oh I need to do (.+) has who bock",
            to = "oh I need to do %1, does anyone want to",
        },
        -- Fix "oh i need to do X does anyone want to" -> "oh I need to do X, does anyone want to?"
        {
            from = "oh i need to do (.+) does anyone want to$",
            to = "oh I need to do %1, does anyone want to?",
        },
        {
            from = "oh i need to do (.+) does anyone want to ",
            to = "oh I need to do %1, does anyone want to ",
        },
    },
}

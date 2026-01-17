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
        
        -- Fix "so ein" → "such" (e.g., "so ein Bullshit" → "such bullshit")
        {
            from = "^so ein ",
            to = "such ",
            priority = 15,
        },
        {
            from = " so ein ",
            to = " such ",
            priority = 15,
        },
        {
            from = "^so ein$",
            to = "such",
            priority = 15,
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
        
        -- Fix "I'm excited so much/so very on/up/at dungeon" -> "I'm so excited about dungeon"
        {
            from = "I'm excited so much/so very on/up/at (.+)",
            to = "I'm so excited about %1",
        },
        {
            from = "I'm excited so much/so very on/up/at",
            to = "I'm so excited about",
        },
        {
            from = "I'm excited so much/so very (.+)",
            to = "I'm so excited about %1",
        },
        
        -- Fix "ich pull" -> "I'll pull" or "I pull"
        {
            from = "ich pull",
            to = "I'll pull",
        },
        
        -- Fix "more/anymore" at end -> "anymore" (context: "nicht mehr" = "not anymore")
        {
            from = "(.+) more/anymore$",
            to = "%1 anymore",
        },
        {
            from = "(.+) more/anymore ",
            to = "%1 anymore ",
        },
        
        -- Fix "still someone help" -> "does anyone still need help"
        {
            from = "^still someone help",
            to = "does anyone still need help",
        },
        {
            from = "still someone help with",
            to = "does anyone still need help with",
        },
        
        -- Fix "rund um" -> "around" (if not already translated)
        {
            from = "rund um ",
            to = "around ",
        },
        
        -- Capitalize location names: "sturmwind" -> "Stormwind", "ironforge" -> "Ironforge"
        {
            from = "sturmwind",
            to = "Stormwind",
        },
        {
            from = "ironforge",
            to = "Ironforge",
        },
        {
            from = "around sturmwind",
            to = "around Stormwind",
        },
        {
            from = "around ironforge",
            to = "around Ironforge",
        },
        {
            from = "around sturmwind/ironforge",
            to = "around Stormwind/Ironforge",
        },
        
        -- Add question mark at end if missing for questions
        {
            from = "(.+) help with (.+) around (.+)$",
            to = "%1 help with %2 around %3?",
        },
        
        -- Fix "elite-quest" -> "elite quest" (remove hyphen)
        {
            from = "elite%-quest",
            to = "elite quest",
        },
        
        -- Add comma after "dungeon" in excitement context
        {
            from = "excited about dungeon finally",
            to = "excited about dungeon, finally",
        },
        {
            from = "excited about dungeon endlich",
            to = "excited about dungeon, finally",
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
        
        -- Fix "can you me help" -> "can you help me" (word order)
        {
            from = "can you me (.+)",
            to = "can you %1 me",
            priority = 15,
        },
        {
            from = "can you me$",
            to = "can you help me",
            priority = 15,
        },
        {
            from = "can you me ",
            to = "can you help me ",
            priority = 15,
        },
        -- Enhanced question word order fixes
        {
            from = "^how (.+) costs (.+)$",
            to = "how much does %1 cost",
            priority = 10,
        },
        {
            from = "^how (.+) cost (.+)$",
            to = "how much does %1 cost",
            priority = 10,
        },
        {
            from = "^where (.+) (.+)$",
            to = "where is %1",
            priority = 5,
        },
        -- Skip generic "what" rule for "what kind of" questions - handled by specific rules above
        -- {
        --     from = "^what (.+) (.+)$",
        --     to = "what is %1",
        --     priority = 5,
        -- },
        -- Fix "can you help me help" -> "can you help me" (duplicate help)
        {
            from = "can you help me help",
            to = "can you help me",
        },
        {
            from = "can you help me help ",
            to = "can you help me ",
        },
        -- Fix "can you you" -> "can you" (duplicate you from case variation)
        {
            from = "can you you ",
            to = "can you ",
        },
        {
            from = "can you you$",
            to = "can you",
        },
        
        -- Fix "weiß not" -> "don't know"
        {
            from = "weiß not ",
            to = "don't know ",
        },
        
        -- Fix "wieso not" -> "why not"
        {
            from = "wieso not",
            to = "why not",
        },
        {
            from = "wieso not ",
            to = "why not ",
        },
        
        -- Fix "do you want X join" -> "do you want to join X"
        -- Only match if there's NO "to" before "join" to avoid infinite loops
        {
            from = "do you want ([^%sto]+) join$",
            to = "do you want to join %1",
            priority = 20,
        },
        {
            from = "do you want ([^%sto]+) join ",
            to = "do you want to join %1 ",
            priority = 20,
        },
        
        -- Fix "how lange have her/their still" -> "how long do you still have"
        {
            from = "how lange have her/their still",
            to = "how long do you still have",
        },
        {
            from = "how lange have her/their still ",
            to = "how long do you still have ",
        },
        -- Fix "how lange have" -> "how long do you have" (general case)
        {
            from = "how lange have (.+)",
            to = "how long do you have %1",
        },
        {
            from = "how lange have ",
            to = "how long do you have ",
        },
        
        -- Fix "ich glaub ich have" -> "I think I have"
        {
            from = "ich glaub ich have",
            to = "I think I have",
        },
        {
            from = "ich glaub ich have ",
            to = "I think I have ",
        },
        
        -- Fix "and like wurdest you back gelassen" -> "and how were you left behind"
        {
            from = "and like wurdest you back gelassen",
            to = "and how were you left behind",
        },
        {
            from = "^like wurdest you back gelassen",
            to = "how were you left behind",
        },
        
        -- Pet and gaming phrases
        {
            from = "pet not under control",
            to = "pet not under control",
        },
        {
            from = "couldn't press nothing",
            to = "couldn't press anything",
        },
        {
            from = "no recall nothing but",
            to = "no recall, nothing, but",
        },
        {
            from = "anyone want to DM",
            to = "anyone want to do DM",
        },
        {
            from = "have cooldown",
            to = "have cooldown",
        },
        {
            from = "it has nothing more worked",
            to = "nothing worked anymore",
        },
        {
            from = "pathfinding is sometimes for the ass",
            to = "pathfinding is sometimes annoying",
        },
        {
            from = "must not your pet on aggressive leave",
            to = "must not leave your pet on aggressive",
        },
        {
            from = "always on passive",
            to = "always on passive",
        },
        {
            from = "only attack on command",
            to = "only attack on command",
        },
        {
            from = "and he has done what he wanted",
            to = "and he did what he wanted",
        },
        {
            from = "is simply away run",
            to = "simply ran away",
        },
        {
            from = "then have they all insulted are away",
            to = "then they all insulted and left",
        },
        {
            from = "and I am exactly in front of the portal died",
            to = "and I died right in front of the portal",
        },
        {
            from = "1sec more and I would be outside",
            to = "1 second more and I would be outside",
        },
        {
            from = "and then write all deserved so that you died are",
            to = "and then everyone writes you deserved to die",
        },
        
        -- Fix "am beginning the instance has made the pet only the what I say"
        {
            from = "am beginning the instance has made the pet only the what I say",
            to = "at the beginning of the instance, the pet only did what I said",
        },
        {
            from = "am beginning the instance has made the pet only the what I sage",
            to = "at the beginning of the instance, the pet only did what I said",
        },
        {
            from = "am beginning the instance has the pet only the made what I say",
            to = "at the beginning of the instance, the pet only did what I said",
        },
        -- More general: "has made the pet only the" -> "the pet only did"
        {
            from = "has made the pet only the (.+)",
            to = "the pet only did %1",
        },
        {
            from = "has the pet only the made (.+)",
            to = "the pet only did %1",
        },
        -- Fix "and then not more have yet nothing changed"
        {
            from = "and then not more have yet nothing changed",
            to = "and then no more, but I haven't changed anything",
        },
        {
            from = "and then not more have yet nothing geändert",
            to = "and then no more, but I haven't changed anything",
        },
        {
            from = "then not more have yet nothing (.+)",
            to = "then no more, but I haven't %1 anything",
        },
        -- Fix "have yet nothing" -> "haven't ... anything"
        {
            from = "have yet nothing (.+)",
            to = "haven't %1 anything",
        },
        {
            from = "have yet nothing",
            to = "haven't changed anything",
        },
        -- Fix "what I say" -> "what I said" (past tense context)
        {
            from = "the pet only did what I say",
            to = "the pet only did what I said",
        },
        {
            from = "did what I say",
            to = "did what I said",
        },
        -- Fix "haven't geändert anything" -> "haven't changed anything"
        {
            from = "haven't geändert anything",
            to = "haven't changed anything",
        },
        {
            from = "haven't geändert° anything",
            to = "haven't changed anything",
        },
        {
            from = "haven't (.+)° anything",
            to = "haven't %1 anything",
        },
        -- Fix duplicate "geändert" at end
        {
            from = "haven't changed anything geändert°",
            to = "haven't changed anything",
        },
        {
            from = "haven't changed anything geändert",
            to = "haven't changed anything",
        },
        {
            from = "(.+) geändert°$",
            to = "%1",
        },
        {
            from = "(.+) geändert$",
            to = "%1",
        },
        
        -- Fix common past participle phrases
        {
            from = "I said/have said",
            to = "I said",
        },
        {
            from = "I did/have done",
            to = "I did",
        },
        {
            from = "I saw/have seen",
            to = "I saw",
        },
        {
            from = "I had/have had",
            to = "I had",
        },
        {
            from = "I came/have come",
            to = "I came",
        },
        {
            from = "I went/have gone",
            to = "I went",
        },
        {
            from = "I was/have been",
            to = "I was",
        },
        
        -- Fix duplicate words
        {
            from = "(.+) is is",
            to = "%1 are you",
            priority = 10,
        },
        {
            from = "where are you you",
            to = "where are you",
            priority = 10,
        },
        {
            from = "what are you doing you",
            to = "what are you doing",
            priority = 10,
        },
        
        -- Fix past participles that were already fixed but may have variations
        {
            from = "have made",
            to = "I did",
            priority = 10,
        },
        {
            from = "am come",
            to = "I came",
            priority = 10,
        },
        {
            from = "am gone",
            to = "I went",
            priority = 10,
        },
        {
            from = "does to",
            to = "closes",
            priority = 10,
        },
        -- Fix question verb forms
        -- Fix "where is is" -> "where are you" (from "wo bist du")
        {
            from = "^where is is$",
            to = "where are you",
            priority = 15,
        },
        {
            from = "^where is is ",
            to = "where are you ",
            priority = 15,
        },
        -- Fix "how is you going" -> "how are you" (from "wie geht es dir")
        {
            from = "^how is you going$",
            to = "how are you",
            priority = 15,
        },
        {
            from = "^how is you going ",
            to = "how are you ",
            priority = 15,
        },
        -- Fix "are ready" -> "you are done" (from "du bist fertig")
        {
            from = "^are ready$",
            to = "you are done",
            priority = 20,
        },
        {
            from = "^are ready ",
            to = "you are done ",
            priority = 20,
        },
        -- Fix "are done" -> "you are done" (from "du bist fertig")
        {
            from = "^are done$",
            to = "you are done",
            priority = 20,
        },
        {
            from = "^are done ",
            to = "you are done ",
            priority = 20,
        },
        -- Fix "wait quickly" -> "wait a moment" (from "warte kurz")
        {
            from = "^wait quickly$",
            to = "wait a moment",
            priority = 20,
        },
        {
            from = "^wait quickly ",
            to = "wait a moment ",
            priority = 20,
        },
        -- Fix "am soon there" -> "be right there" (from "bin gleich da")
        {
            from = "^am soon there$",
            to = "be right there",
            priority = 20,
        },
        {
            from = "^am soon there ",
            to = "be right there ",
            priority = 20,
        },
        -- Fix "what kind of a addon is that again" -> "what kind of addon is that again"
        {
            from = "^what kind of a addon is that again$",
            to = "what kind of addon is that again",
            priority = 25, -- Very high priority to prevent other rules from matching
        },
        {
            from = "^what kind of a addon is (.+)$",
            to = "what kind of addon is %1",
            priority = 25,
        },
        -- Fix "what kind of in addon" -> "what kind of addon" (removes extra "in")
        {
            from = "what kind of in addon",
            to = "what kind of addon",
            priority = 24,
        },
        {
            from = "what kind of a (.+) is (.+)",
            to = "what kind of %1 is %2",
            priority = 22, -- High priority
        },
        -- Fix "what for in addon is that/is this again" -> "what kind of addon is that again"
        {
            from = "what for in addon is that/is this again",
            to = "what kind of addon is that again",
            priority = 10,
        },
        {
            from = "what for in (.+) is that/is this again",
            to = "what kind of %1 is that again",
            priority = 10,
        },
        {
            from = "what for (.+) is (.+)",
            to = "what kind of %1 is %2",
            priority = 8,
        },
        -- Fix "need no addon" -> "you don't need an addon"
        {
            from = "^need no addon$",
            to = "you don't need an addon",
            priority = 10,
        },
        -- Fix "what is are" -> "what are you doing" (from "was machst du")
        -- BUT: Don't match if it's part of "what kind of..."
        {
            from = "^what is are$",
            to = "what are you doing",
            priority = 15,
        },
        {
            from = "what is are ",
            to = "what are you doing ",
            priority = 15,
        },
        -- Prevent "what kind of" from being corrupted by "what is are" rule
        -- This must run AFTER "what kind of a" fixes but before general "what is are"
        {
            from = "what kind of (a )?addon is (.+)",
            to = "what kind of addon is %2",
            priority = 18, -- Higher than "what is are" (15) but lower than "what kind of a" (20)
        },
        -- Fix "is X already happens" -> "has X already happened"
        {
            from = "is (.+) already happens",
            to = "has %1 already happened",
            priority = 12,
        },
        {
            from = "is (.+) already happened",
            to = "has %1 already happened",
            priority = 12,
        },
        -- Fix "portal to X to whom buff" -> "portal to X after the buff"
        {
            from = "portal to (.+) to whom buff",
            to = "portal to %1 after the buff",
            priority = 15,
        },
        {
            from = "to (.+) to whom (.+)",
            to = "to %1 after the %2",
            priority = 10,
        },
        -- Fix "after that again back" -> "then back"
        {
            from = "and after that again back",
            to = "and then back",
            priority = 12,
        },
        {
            from = "after that again back",
            to = "then back",
            priority = 12,
        },
        -- Fix "is still not" when it should be "has not yet"
        {
            from = "is still not (.+)",
            to = "has not %1 yet",
            priority = 10,
        },
        -- Fix "is not yet/has not yet" -> "has not yet" (clean up slash separation)
        {
            from = "is not yet/has not yet (.+)",
            to = "has not %1 yet",
            priority = 15,
        },
        {
            from = "(.+) is not yet/has not yet",
            to = "%1 has not yet",
            priority = 15,
        },
        -- Fix "is not yet" in questions -> "has not yet"
        {
            from = "^(.+) is not yet (.+)\\?$",
            to = "%1 has not %2 yet?",
            priority = 12,
        },
        -- Fix "whisper me" (from "flüstert mir")
        {
            from = "flüstert me",
            to = "whisper me",
            priority = 15,
        },
        -- Fix "kleiner movement speed-bonus" -> "minor movement speed bonus"
        {
            from = "kleiner movement speed%-bonus",
            to = "minor movement speed bonus",
            priority = 12,
        },
        {
            from = "kleiner movement speed bonus",
            to = "minor movement speed bonus",
            priority = 12,
        },
        -- Fix "or Überragendes" -> "or superior"
        {
            from = "or überragendes",
            to = "or superior",
            priority = 12,
        },
        {
            from = "or Überragendes",
            to = "or superior",
            priority = 12,
        },
        {
            from = "flüster me",
            to = "whisper me",
            priority = 15,
        },
        -- Fix "inv" -> "invite" when used as verb (not inventory)
        {
            from = "pls inv",
            to = "please invite",
            priority = 15,
        },
        {
            from = "please inventory",
            to = "please invite",
            priority = 15,
        },
        -- Remove duplicate - handled above
        -- Fix third person "want" -> "wants"
        {
            from = "who want (.+)",
            to = "who wants %1",
            priority = 8,
        },
        {
            from = "he want (.+)",
            to = "he wants %1",
            priority = 8,
        },
        {
            from = "she want (.+)",
            to = "she wants %1",
            priority = 8,
        },
        -- Fix "and then no more haven't" -> "and then no more, but I haven't"
        {
            from = "and then no more haven't",
            to = "and then no more, but I haven't",
        },
        {
            from = "then no more haven't",
            to = "then no more, but I haven't",
        },
        {
            from = "^weiß not ",
            to = "don't know ",
        },
        
        -- Fix "ob we" -> "if we" (ensure proper translation)
        {
            from = "ob we ",
            to = "if we ",
        },
        
        -- Fix "we the with two/just the two of us manage/accomplish/can do" -> "we can manage that with just the two of us"
        {
            from = "we the with two/just the two of us manage/accomplish/can do",
            to = "we can manage that with just the two of us",
        },
        {
            from = "we that with two/just the two of us manage/accomplish/can do",
            to = "we can manage that with just the two of us",
        },
        {
            from = "we the to zweit manage/accomplish/can do",
            to = "we can manage that with just the two of us",
        },
        {
            from = "we that to zweit manage/accomplish/can do",
            to = "we can manage that with just the two of us",
        },
        {
            from = "the to zweit schaffen",
            to = "manage that with just the two of us",
        },
        {
            from = "that to zweit schaffen",
            to = "manage that with just the two of us",
        },
        {
            from = "the to zweit manage/accomplish/can do",
            to = "manage that with just the two of us",
        },
        {
            from = "that to zweit manage/accomplish/can do",
            to = "manage that with just the two of us",
        },
        {
            from = "the with two/second manage/accomplish/can do",
            to = "manage that with just the two of us",
        },
        {
            from = "that with two/second manage/accomplish/can do",
            to = "manage that with just the two of us",
        },
        
        -- Fix "but ich can heilen" -> "but I can heal"
        {
            from = "but ich can heilen",
            to = "but I can heal",
        },
        {
            from = " but ich can heal",
            to = " but I can heal",
        },
        
        -- Fix "am diszi" -> "I'm disc"
        {
            from = " am diszi$",
            to = " I'm disc",
        },
        {
            from = " am diszi ",
            to = " I'm disc ",
        },
        {
            from = "am disc/disciple priest$",
            to = "I'm disc",
        },
        {
            from = "am disc/disciple priest ",
            to = "I'm disc ",
        },
        {
            from = "I'm disc/I'm discipline priest$",
            to = "I'm disc",
        },
        {
            from = "I'm disc/I'm discipline priest ",
            to = "I'm disc ",
        },
        -- Fix "thanks I send you/I'm sending you" -> "thanks I'm sending you"
        {
            from = "thanks I send you/I'm sending you",
            to = "thanks I'm sending you",
            priority = 15,
        },
        {
            from = "I send you/I'm sending you",
            to = "I'm sending you",
            priority = 15,
        },
        -- Fix "am also just in X arrived" -> "I also just arrived in X"
        {
            from = "am also just in (.+) arrived",
            to = "I also just arrived in %1",
            priority = 15,
        },
        {
            from = "am also just (.+) arrived",
            to = "I also just arrived %1",
            priority = 12,
        },
        -- Fix "I see just now/I just see" -> "I just see"
        {
            from = "I see just now/I just see",
            to = "I just see",
            priority = 15,
        },
        {
            from = "I see just now",
            to = "I just see",
            priority = 12,
        },
        -- Fix "are needed/needed" -> "are needed"
        {
            from = "are needed/needed",
            to = "are needed",
            priority = 15,
        },
        -- Fix "I'm flying already to/I'll fly to" -> "I'm flying to" (cleaner)
        {
            from = "I'm flying already to/I'll fly to",
            to = "I'm flying to",
            priority = 15,
        },
        -- Fix "can i me from jemanden a bag schnorren" -> "can I borrow a bag from someone"
        {
            from = "can i me from jemanden a bag schnorren",
            to = "can I borrow a bag from someone",
            priority = 15,
        },
        {
            from = "can i me from (.+) a bag schnorren",
            to = "can I borrow a bag from %1",
            priority = 12,
        },
        -- Fix "can someone kl bags spendieren/besorgen" -> "can someone donate/get small bags"
        {
            from = "can someone kl bags spendieren/besorgen",
            to = "can someone donate/get small bags",
            priority = 15,
        },
        {
            from = "kl bags spendieren/besorgen",
            to = "donate/get small bags",
            priority = 12,
        },
        -- Fix "in case someone linen cloth in the inventar stört I würds take" -> "in case someone has linen cloth in inventory that's in the way, I would take it"
        {
            from = "in case someone linen cloth in the inventar stört I würds take",
            to = "in case someone has linen cloth in inventory that's in the way, I would take it",
            priority = 15,
        },
        {
            from = "in the inventar stört",
            to = "in inventory that's in the way",
            priority = 12,
        },
        -- Fix "is ogermagierstab brauchbar or can i the simply beim händler sell" -> "is Ogre Mage Staff usable or can I simply sell it at the vendor"
        {
            from = "is ogermagierstab brauchbar or can i the simply beim händler sell",
            to = "is Ogre Mage Staff usable or can I simply sell it at the vendor",
            priority = 15,
        },
        {
            from = "is (.+) brauchbar or can i (.+) simply beim händler sell",
            to = "is %1 usable or can I %2 simply sell it at the vendor",
            priority = 12,
        },
        {
            from = "is (.+) brauchbar or can i (.+) simply (.+) sell",
            to = "is %1 usable or can I %2 simply sell %3",
            priority = 10,
        },
        -- Fix "can i the simply sell" -> "can I simply sell it"
        {
            from = "can i the simply sell",
            to = "can I simply sell it",
            priority = 15,
        },
        {
            from = "can i (.+) the simply sell",
            to = "can I simply sell it",
            priority = 12,
        },
        -- Fix "could 10er bags make" -> "could make 10-slot bags"
        {
            from = "could 10er bags make",
            to = "could make 10-slot bags",
            priority = 15,
        },
        {
            from = "could (.+) bags make",
            to = "could make %1 bags",
            priority = 12,
        },
        -- Fix "can me soon an of Westfall strand begleiten to Stormwind am level 1 priest" -> "can someone soon accompany me from Westfall beach to Stormwind, I'm level 1 priest"
        {
            from = "can me soon an of (.+) strand begleiten to (.+) am level (.+) priest",
            to = "can someone soon accompany me from %1 beach to %2, I'm level %3 priest",
            priority = 15,
        },
        -- Fix "what have because vor" -> "what do you have planned"
        {
            from = "what have because vor",
            to = "what do you have planned",
            priority = 15,
        },
        {
            from = "what have denn vor",
            to = "what do you have planned",
            priority = 15,
        },
        {
            from = "what (.+) denn vor",
            to = "what %1 planned",
            priority = 12,
        },
        -- Fix "someone there to open from 8xthoriumschließkassette" -> "someone there to open 8x thorium lockbox"
        {
            from = "someone there to open from 8xthoriumschließkassette",
            to = "someone there to open 8x thorium lockbox",
            priority = 15,
        },
        {
            from = "to open from (.+)",
            to = "to open %1",
            priority = 12,
        },
        -- Fix "selling cloak-big defense" -> "selling cloak - Great Defense"
        {
            from = "selling cloak%-big defense",
            to = "selling cloak - Great Defense",
            priority = 15,
        },
        {
            from = "selling (.+)%-big (.+)",
            to = "selling %1 - Great %2",
            priority = 12,
        },
        -- ============================================
        -- LANGUAGETOOL-INSPIRED GRAMMAR RULES
        -- Based on common German grammar patterns from LanguageTool
        -- These address systematic word order and structure issues
        -- ============================================
        
        -- Subordinate clause verb-final position
        -- German: "wenn ich komme, dann..." -> "when I come, then..."
        -- But German has verb at end in subordinate clauses: "wenn ich dann komme"
        -- This rule handles cases where verb placement in subordinate clause is wrong
        {
            from = "when (.+) then (.+ verb)",
            to = "when %1 %2 then",
            priority = 12,
            note = "Subordinate clause verb-final position (LanguageTool pattern)",
        },
        
        -- Perfect tense with separable verbs
        -- German: "ich habe aufgemacht" -> "I have opened" (not "I have up made")
        -- This fixes cases where separable prefix isn't properly recombined
        {
            from = "have (up|down|in|out|away|back|over|under) (.+)",
            to = "have %2",
            priority = 12,
            note = "Separable verb prefix in perfect tense",
        },
        {
            from = "has (up|down|in|out|away|back|over|under) (.+)",
            to = "has %2",
            priority = 12,
        },
        
        -- Modal verb + infinitive constructions
        -- German: "ich muss gehen" -> "I must go" (not "I must to go")
        -- Handle modal verbs that take bare infinitive
        {
            from = "must to (.+)",
            to = "must %1",
            priority = 15,
            note = "Modal verb + bare infinitive",
        },
        {
            from = "should to (.+)",
            to = "should %1",
            priority = 15,
        },
        {
            from = "can to (.+)",
            to = "can %1",
            priority = 15,
        },
        {
            from = "will to (.+)",
            to = "will %1",
            priority = 15,
        },
        {
            from = "would to (.+)",
            to = "would %1",
            priority = 15,
        },
        
        -- Relative clause verb placement
        -- German: "der Mann, der die Quest gemacht hat" -> "the man who did the quest"
        -- Ensure relative clause verbs are properly ordered
        {
            from = "who (.+) (has|have) (.+)",
            to = "who %2 %3",
            priority = 10,
            note = "Relative clause verb order",
        },
        {
            from = "who the (.+) (.+)",
            to = "who %2 the %1",
            priority = 8,
            note = "Relative clause: fix object-verb order",
        },
        
        -- Question inversion (V2 word order in German questions)
        -- German: "Wo bist du?" -> "Where are you?" (subject-verb inversion)
        -- Handle cases where inversion didn't happen
        {
            from = "^where you ",
            to = "where are you ",
            priority = 15,
            note = "Question inversion (where)",
        },
        {
            from = "^when you ",
            to = "when do you ",
            priority = 15,
            note = "Question inversion (when)",
        },
        {
            from = "^how you ",
            to = "how do you ",
            priority = 15,
            note = "Question inversion (how)",
        },
        {
            from = "^why you ",
            to = "why do you ",
            priority = 15,
            note = "Question inversion (why)",
        },
        {
            from = "^what you ",
            to = "what do you ",
            priority = 15,
            note = "Question inversion (what)",
        },
        
        -- Preposition + article contractions
        -- German: "zum" = "zu dem", "zur" = "zu der"
        -- These are often already handled, but ensure proper translation
        {
            from = "to the (.+) to",
            to = "to %1",
            priority = 12,
            note = "Remove duplicate preposition",
        },
        
        -- Past participle position in perfect tense
        -- German: "Ich habe gesagt" -> "I have said" (participle after auxiliary)
        -- Fix cases where participle is in wrong position
        {
            from = "have (.+) (said|done|made|seen|gone|come|taken|given)",
            to = "have %2 %1",
            priority = 10,
            note = "Perfect tense participle position",
        },
        {
            from = "has (.+) (said|done|made|seen|gone|come|taken|given)",
            to = "has %2 %1",
            priority = 10,
        },
        
        -- Separable verb prefix at sentence end (verb-second rule)
        -- German: "Ich mache die Tür auf" -> "I open the door"
        -- When separable prefix is separated, it goes to end in German
        -- But in English, it should be combined: "aufmachen" -> "open"
        {
            from = "(.+) (.+) (up|down|in|out|away|back|on|off)$",
            to = "%1 %2%3",
            priority = 8,
            note = "Separable verb prefix recombination",
        },
        
        -- Imperative verb forms
        -- German: "Mach das!" -> "Do that!" (no subject in imperative)
        -- Ensure imperatives don't have extra subjects
        {
            from = "^you (.+)$",
            to = "%1",
            priority = 5,
            note = "Remove 'you' from imperative (context-dependent, low priority)",
        },
        
        -- Genitive constructions
        -- German: "des Mannes" -> "of the man"
        -- Handle genitive properly when translated word-by-word
        {
            from = "of the (.+) the ",
            to = "of the %1 ",
            priority = 12,
            note = "Genitive: remove duplicate article",
        },
        
        -- Coordinating conjunctions word order
        -- German: "und ich gehe" -> "and I go" (conjunction doesn't affect word order)
        -- Ensure conjunctions don't cause incorrect word order
        {
            from = "^and (.+) (am|is|are) (.+)",
            to = "and %1 %2 %3",
            priority = 8,
            note = "Conjunction word order preservation",
        },
        
        -- Reflexive pronoun position
        -- German: "Ich wasche mich" -> "I wash myself"
        -- Reflexive pronouns in German come before/after verb depending on structure
        {
            from = "(.+) (myself|yourself|himself|herself|itself|ourselves|themselves) (.+)",
            to = "%1 %3 %2",
            priority = 10,
            note = "Reflexive pronoun position in English",
        },
        
        -- Adjective endings/noun phrases
        -- German: "der große Mann" -> "the big man" (not "the big the man")
        {
            from = "the (.+) the (.+)",
            to = "the %1 %2",
            priority = 12,
            note = "Noun phrase: remove duplicate article",
        },
        
        -- Time expressions word order
        -- German: "heute gehe ich" -> "today I go"
        -- Time expressions often come first in German (V2 rule)
        {
            from = "today (.+) (am|is|are) (.+)",
            to = "today %1 %2 %3",
            priority = 8,
            note = "Time expression word order",
        },
        {
            from = "now (.+) (am|is|are) (.+)",
            to = "now %1 %2 %3",
            priority = 8,
        },
        
        -- ============================================
        -- END LANGUAGETOOL-INSPIRED RULES
        -- ============================================
        
        -- Fix "wts mur of the morts" -> "WTS Wall of the Dead"
        {
            from = "wts mur of the morts",
            to = "WTS Wall of the Dead",
            priority = 15,
        },
        {
            from = "mur of the morts",
            to = "Wall of the Dead",
            priority = 15,
        },
        -- Fix "wts moorring of the tigers" -> "WTS Moor Ring of the Tiger"
        {
            from = "wts moorring of the tigers",
            to = "WTS Moor Ring of the Tiger",
            priority = 15,
        },
        {
            from = "moorring of the tigers",
            to = "Moor Ring of the Tiger",
            priority = 15,
        },
        -- Fix "can i me from jemanden borrow a bag" -> "can I borrow a bag from someone"
        {
            from = "can i me from jemanden borrow a bag",
            to = "can I borrow a bag from someone",
            priority = 15,
        },
        {
            from = "can i me from (.+) borrow",
            to = "can I borrow from %1",
            priority = 12,
        },
        -- Fix "can someone small bags donate/give get/buy" -> "can someone donate/get small bags"
        {
            from = "can someone small bags donate/give get/buy",
            to = "can someone donate/get small bags",
            priority = 15,
        },
        {
            from = "small bags donate/give get/buy",
            to = "donate/get small bags",
            priority = 12,
        },
        -- Fix "in case someone linen cloth bothers in inventory/is in the way in inventory" -> "in case someone has linen cloth in inventory that's in the way, I would take it"
        {
            from = "in case someone linen cloth bothers in inventory/is in the way in inventory",
            to = "in case someone has linen cloth in inventory that's in the way, I would take it",
            priority = 15,
        },
        {
            from = "linen cloth bothers in inventory/is in the way in inventory",
            to = "has linen cloth in inventory that's in the way",
            priority = 12,
        },
        -- Fix "can someone soon of Westfall beach accompany to/escort to Stormwind am level 1 priest" -> "can someone soon accompany me from Westfall beach to Stormwind, I'm level 1 priest"
        {
            from = "can someone soon of (.+) beach accompany to/escort to (.+) am level (.+) priest",
            to = "can someone soon accompany me from %1 beach to %2, I'm level %3 priest",
            priority = 15,
        },
        {
            from = "can someone soon of (.+) beach (.+) to (.+) am (.+)",
            to = "can someone soon accompany me from %1 beach to %3, I'm %4",
            priority = 12,
        },
        -- Fix "what have planned/are planning" -> "what do you have planned"
        {
            from = "what have planned/are planning",
            to = "what do you have planned",
            priority = 15,
        },
        {
            from = "what (.+) planned/are planning",
            to = "what do %1 planned",
            priority = 12,
        },
        -- Fix "the erlösung of scrimshank" -> "The Redemption of Scrimshank"
        {
            from = "the erlösung of (.+)",
            to = "The Redemption of %1",
            priority = 15,
        },
        {
            from = "erlösung of (.+)",
            to = "Redemption of %1",
            priority = 12,
        },
        
        -- Fix common typos from translation
        {
            from = " whas ",
            to = " what ",
            priority = 15,
        },
        {
            from = "^whas ",
            to = "what ",
            priority = 15,
        },
        {
            from = " thas ",
            to = " that ",
            priority = 15,
        },
        {
            from = "^thas ",
            to = "that ",
            priority = 15,
        },
        {
            from = " whas$",
            to = " what",
            priority = 15,
        },
        {
            from = " thas$",
            to = " that",
            priority = 15,
        },
        
        -- Fix spacing after item links
        {
            from = "(%])([a-z])",
            to = "%1 %2",
            priority = 12,
        },
        
        -- Fix "Ironforge" when it should be "if" (from "wenn")
        {
            from = "^Ironforge (.+)",
            to = "if %1",
            priority = 15,
        },
        {
            from = " Ironforge (.+)",
            to = " if %1",
            priority = 15,
        },
        
        -- Fix "I white" -> "I know" (from "ich weiß")
        {
            from = " I white ",
            to = " I know ",
            priority = 15,
        },
        {
            from = "^I white ",
            to = "I know ",
            priority = 15,
        },
        
        -- ============================================
        -- ADDITIONAL SYSTEMATIC GRAMMAR FIXES
        -- Common German-to-English translation issues
        -- ============================================
        
        -- Fix verb position in questions (V2 word order)
        {
            from = "^(.+) are you (.+)$",
            to = "are you %1 %2",
            priority = 12,
        },
        {
            from = "^(.+) do you (.+)$",
            to = "do you %1 %2",
            priority = 12,
        },
        {
            from = "^(.+) can you (.+)$",
            to = "can you %1 %2",
            priority = 12,
        },
        {
            from = "^(.+) have you (.+)$",
            to = "have you %1 %2",
            priority = 12,
        },
        {
            from = "^(.+) will you (.+)$",
            to = "will you %1 %2",
            priority = 12,
        },
        {
            from = "^(.+) should you (.+)$",
            to = "should you %1 %2",
            priority = 12,
        },
        
        -- Fix article placement with adjectives
        {
            from = " a (.+) one$",
            to = " a %1 one",
            priority = 8,
        },
        {
            from = " the (.+) one$",
            to = " the %1 one",
            priority = 8,
        },
        {
            from = " an (.+) one$",
            to = " an %1 one",
            priority = 8,
        },
        
        -- Fix double negation
        {
            from = " not no ",
            to = " not ",
            priority = 10,
        },
        {
            from = " no not ",
            to = " not ",
            priority = 10,
        },
        {
            from = " not don't ",
            to = " don't ",
            priority = 10,
        },
        {
            from = " don't not ",
            to = " don't ",
            priority = 10,
        },
        
        -- Fix verb-subject agreement
        {
            from = " he have ",
            to = " he has ",
            priority = 12,
        },
        {
            from = " she have ",
            to = " she has ",
            priority = 12,
        },
        {
            from = " it have ",
            to = " it has ",
            priority = 12,
        },
        {
            from = " i has ",
            to = " I have ",
            priority = 12,
        },
        {
            from = " you has ",
            to = " you have ",
            priority = 12,
        },
        {
            from = " we has ",
            to = " we have ",
            priority = 12,
        },
        {
            from = " they has ",
            to = " they have ",
            priority = 12,
        },
        
        -- Fix infinitive constructions (modal + bare infinitive)
        {
            from = " can to ",
            to = " can ",
            priority = 12,
        },
        {
            from = " must to ",
            to = " must ",
            priority = 12,
        },
        {
            from = " should to ",
            to = " should ",
            priority = 12,
        },
        {
            from = " will to ",
            to = " will ",
            priority = 12,
        },
        {
            from = " would to ",
            to = " would ",
            priority = 12,
        },
        {
            from = " may to ",
            to = " may ",
            priority = 12,
        },
        
        -- Fix "to to" constructions
        {
            from = " to to ",
            to = " to ",
            priority = 10,
        },
        {
            from = "^to to ",
            to = "to ",
            priority = 10,
        },
        
        -- Fix past participle position
        {
            from = " have (.+) been ",
            to = " have been %1 ",
            priority = 10,
        },
        {
            from = " has (.+) been ",
            to = " has been %1 ",
            priority = 10,
        },
        {
            from = " had (.+) been ",
            to = " had been %1 ",
            priority = 10,
        },
        
        -- Fix "been being" -> "been"
        {
            from = " been being ",
            to = " been ",
            priority = 12,
        },
        
        -- Fix reflexive pronoun placement
        {
            from = " help me myself",
            to = " help myself",
            priority = 12,
        },
        {
            from = " help you yourself",
            to = " help yourself",
            priority = 12,
        },
        {
            from = " help yourself you",
            to = " help yourself",
            priority = 12,
        },
        {
            from = " help himself he",
            to = " he helps himself",
            priority = 12,
        },
        
        -- Fix preposition placement
        {
            from = " go to there$",
            to = " go there",
            priority = 10,
        },
        {
            from = " come to here$",
            to = " come here",
            priority = 10,
        },
        {
            from = " go to home$",
            to = " go home",
            priority = 10,
        },
        
        -- Fix "at the here" / "at the there"
        {
            from = " at the here",
            to = " here",
            priority = 10,
        },
        {
            from = " at the there",
            to = " there",
            priority = 10,
        },
        
        -- Fix comparative constructions
        {
            from = " more better ",
            to = " better ",
            priority = 12,
        },
        {
            from = " more worse ",
            to = " worse ",
            priority = 12,
        },
        {
            from = " more faster ",
            to = " faster ",
            priority = 12,
        },
        {
            from = " more slower ",
            to = " slower ",
            priority = 12,
        },
        
        -- Fix superlative constructions
        {
            from = " the most best ",
            to = " the best ",
            priority = 12,
        },
        {
            from = " the most worst ",
            to = " the worst ",
            priority = 12,
        },
        
        -- Fix "a lot of of" -> "a lot of"
        {
            from = " a lot of of ",
            to = " a lot of ",
            priority = 10,
        },
        {
            from = " lots of of ",
            to = " lots of ",
            priority = 10,
        },
        
        -- Fix "each other each other" -> "each other"
        {
            from = " each other each other",
            to = " each other",
            priority = 10,
        },
        
        -- Fix "the same same" -> "the same"
        {
            from = " the same same",
            to = " the same",
            priority = 10,
        },
        
        -- Fix "more more" -> "more"
        {
            from = " more more ",
            to = " more ",
            priority = 10,
        },
        {
            from = " less less ",
            to = " less ",
            priority = 10,
        },
        
        -- Fix "all all" -> "all"
        {
            from = "^all all ",
            to = "all ",
            priority = 10,
        },
        {
            from = " all all ",
            to = " all ",
            priority = 10,
        },
        
        -- Fix "both both" -> "both"
        {
            from = " both both",
            to = " both",
            priority = 10,
        },
        
        -- Fix "each each" -> "each"
        {
            from = " each each",
            to = " each",
            priority = 10,
        },
        
        -- Fix "every every" -> "every"
        {
            from = " every every ",
            to = " every ",
            priority = 10,
        },
        
        -- Fix "some some" -> "some"
        {
            from = " some some ",
            to = " some ",
            priority = 10,
        },
        
        -- Fix "any any" -> "any"
        {
            from = " any any ",
            to = " any ",
            priority = 10,
        },
        
        -- Fix "one one" -> "one"
        {
            from = " one one ",
            to = " one ",
            priority = 10,
        },
        
        -- Fix duplicate prepositions
        {
            from = " from from ",
            to = " from ",
            priority = 10,
        },
        {
            from = " to to ",
            to = " to ",
            priority = 10,
        },
        {
            from = " at at ",
            to = " at ",
            priority = 10,
        },
        {
            from = " in in ",
            to = " in ",
            priority = 10,
        },
        {
            from = " on on ",
            to = " on ",
            priority = 10,
        },
        {
            from = " with with ",
            to = " with ",
            priority = 10,
        },
        {
            from = " by by ",
            to = " by ",
            priority = 10,
        },
        {
            from = " for for ",
            to = " for ",
            priority = 10,
        },
        
        -- Fix duplicate conjunctions
        {
            from = " and and ",
            to = " and ",
            priority = 10,
        },
        {
            from = " but but ",
            to = " but ",
            priority = 10,
        },
        {
            from = " or or ",
            to = " or ",
            priority = 10,
        },
        {
            from = " so so ",
            to = " so ",
            priority = 10,
        },
        
        -- Fix "that that" -> "that"
        {
            from = " that that ",
            to = " that ",
            priority = 10,
        },
        
        -- Fix "what what" -> "what"
        {
            from = " what what ",
            to = " what ",
            priority = 10,
        },
        
        -- Fix "who who" -> "who"
        {
            from = " who who ",
            to = " who ",
            priority = 10,
        },
        
        -- Fix "where where" -> "where"
        {
            from = " where where ",
            to = " where ",
            priority = 10,
        },
        
        -- Fix "when when" -> "when"
        {
            from = " when when ",
            to = " when ",
            priority = 10,
        },
        
        -- Fix "why why" -> "why"
        {
            from = " why why ",
            to = " why ",
            priority = 10,
        },
        
        -- Fix "how how" -> "how"
        {
            from = " how how ",
            to = " how ",
            priority = 10,
        },
        
        -- Fix possessive pronoun duplication
        {
            from = " my my ",
            to = " my ",
            priority = 10,
        },
        {
            from = " your your ",
            to = " your ",
            priority = 10,
        },
        {
            from = " his his ",
            to = " his ",
            priority = 10,
        },
        {
            from = " her her ",
            to = " her ",
            priority = 10,
        },
        {
            from = " its its ",
            to = " its ",
            priority = 10,
        },
        {
            from = " our our ",
            to = " our ",
            priority = 10,
        },
        {
            from = " their their ",
            to = " their ",
            priority = 10,
        },
        
        -- Fix "be be" -> "be"
        {
            from = " be be ",
            to = " be ",
            priority = 10,
        },
        {
            from = " am am ",
            to = " am ",
            priority = 10,
        },
        {
            from = " is is ",
            to = " is ",
            priority = 10,
        },
        {
            from = " are are ",
            to = " are ",
            priority = 10,
        },
        {
            from = " was was ",
            to = " was ",
            priority = 10,
        },
        {
            from = " were were ",
            to = " were ",
            priority = 10,
        },
        
        -- Fix "have have" -> "have"
        {
            from = " have have ",
            to = " have ",
            priority = 10,
        },
        {
            from = " has has ",
            to = " has ",
            priority = 10,
        },
        {
            from = " had had ",
            to = " had ",
            priority = 10,
        },
        
        -- Fix "do do" -> "do"
        {
            from = " do do ",
            to = " do ",
            priority = 10,
        },
        {
            from = " does does ",
            to = " does ",
            priority = 10,
        },
        {
            from = " did did ",
            to = " did ",
            priority = 10,
        },
        
        -- Fix "can can" -> "can"
        {
            from = " can can ",
            to = " can ",
            priority = 10,
        },
        {
            from = " could could ",
            to = " could ",
            priority = 10,
        },
        
        -- Fix "will will" -> "will"
        {
            from = " will will ",
            to = " will ",
            priority = 10,
        },
        {
            from = " would would ",
            to = " would ",
            priority = 10,
        },
        
        -- Fix "should should" -> "should"
        {
            from = " should should ",
            to = " should ",
            priority = 10,
        },
        
        -- Fix "must must" -> "must"
        {
            from = " must must ",
            to = " must ",
            priority = 10,
        },
        
        -- Fix "may may" -> "may"
        {
            from = " may may ",
            to = " may ",
            priority = 10,
        },
        
        -- Fix "might might" -> "might"
        {
            from = " might might ",
            to = " might ",
            priority = 10,
        },
        
        -- Fix "go go" -> "go"
        {
            from = " go go ",
            to = " go ",
            priority = 10,
        },
        {
            from = " goes goes ",
            to = " goes ",
            priority = 10,
        },
        {
            from = " went went ",
            to = " went ",
            priority = 10,
        },
        
        -- Fix "get get" -> "get"
        {
            from = " get get ",
            to = " get ",
            priority = 10,
        },
        {
            from = " gets gets ",
            to = " gets ",
            priority = 10,
        },
        {
            from = " got got ",
            to = " got ",
            priority = 10,
        },
        
        -- Fix "make make" -> "make"
        {
            from = " make make ",
            to = " make ",
            priority = 10,
        },
        {
            from = " makes makes ",
            to = " makes ",
            priority = 10,
        },
        {
            from = " made made ",
            to = " made ",
            priority = 10,
        },
        
        -- Fix "take take" -> "take"
        {
            from = " take take ",
            to = " take ",
            priority = 10,
        },
        {
            from = " takes takes ",
            to = " takes ",
            priority = 10,
        },
        {
            from = " took took ",
            to = " took ",
            priority = 10,
        },
        
        -- Fix "come come" -> "come"
        {
            from = " come come ",
            to = " come ",
            priority = 10,
        },
        {
            from = " comes comes ",
            to = " comes ",
            priority = 10,
        },
        {
            from = " came came ",
            to = " came ",
            priority = 10,
        },
        
        -- Fix "see see" -> "see"
        {
            from = " see see ",
            to = " see ",
            priority = 10,
        },
        {
            from = " sees sees ",
            to = " sees ",
            priority = 10,
        },
        {
            from = " saw saw ",
            to = " saw ",
            priority = 10,
        },
        
        -- Fix "know know" -> "know"
        {
            from = " know know ",
            to = " know ",
            priority = 10,
        },
        {
            from = " knows knows ",
            to = " knows ",
            priority = 10,
        },
        {
            from = " knew knew ",
            to = " knew ",
            priority = 10,
        },
    },
}

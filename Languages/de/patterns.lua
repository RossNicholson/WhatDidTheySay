-- WhatDidTheySay - German Language Pack - Patterns
-- Reusable phrase structures with captures

WDTS_Lang_de_Patterns = {
    -- "gesucht wird ein X für Y" -> "looking for a X for Y" (passive voice)
    {
        from = "gesucht wird ein (.+) für (.+)",
        to = "looking for a %1 for %2",
    },
    {
        from = "gesucht wird eine (.+) für (.+)",
        to = "looking for a %1 for %2",
    },
    -- "suche X für Y" -> "looking for X for Y"
    {
        from = "suche (.+) für (.+)",
        to = "looking for %1 for %2",
    },
    {
        from = "sucht (.+) für (.+)",
        to = "looking for %1 for %2",
    },
    -- "kannst du X" -> "can you X"
    {
        from = "kannst du (.+)",
        to = "can you %1",
    },
    {
        from = "kannst mich (.+)",
        to = "can you %1 me",
    },
    -- "wir werden uns bissl loot klauen" -> "we will steal a bit of loot"
    {
        from = "wir werden uns bissl loot klauen",
        to = "we will steal a bit of loot",
    },
    {
        from = "wir werden uns bisschen loot klauen",
        to = "we will steal a bit of loot",
    },
    -- "gehen da bestimmt noch öfter rein" -> "will definitely go in there more often"
    {
        from = "gehen da bestimmt noch öfter rein",
        to = "will definitely go in there more often",
    },
    -- "hat mir jemand X silber?" -> "does someone have X silver for me?"
    {
        from = "hat mir jemand (.+) silber",
        to = "does someone have %1 silver for me",
    },
    -- "hat mir jemand X?" -> "does someone have X for me?"
    {
        from = "hat mir jemand (.+)%?",
        to = "does someone have %1 for me",
    },
    -- "kommt nochmal ein X?" -> "is there another X coming?"
    {
        from = "kommt nochmal ein (.+)%?",
        to = "is there another %1 coming",
    },
    {
        from = "kommt nochmal ein (.+)",
        to = "is there another %1 coming",
    },
    -- "kann jemand nach X tpn" -> "can someone port/teleport to X"
    {
        from = "kann jemand nach (.+) tpn",
        to = "can someone port to %1",
    },
    {
        from = "kann jemand nach (.+) tp",
        to = "can someone port to %1",
    },
    {
        from = "kann jemand nach (.+) teleportieren",
        to = "can someone teleport to %1",
    },
    -- "kann mir jemand auf süß einen X kaufen" -> "can someone buy me a sweet X"
    {
        from = "kann mir jemand auf (.+) einen (.+) kaufen",
        to = "can someone buy me a %1 %2", -- Handles "auf süß einen Zauberstab" -> "a sweet wand"
    },
    -- "kann mir jemand einen X kaufen" -> "can someone buy me a X"
    {
        from = "kann mir jemand einen (.+) kaufen",
        to = "can someone buy me a %1",
    },
    -- "kann mir jemand X kaufen" -> "can someone buy me X" (fallback)
    {
        from = "kann mir jemand (.+) kaufen",
        to = "can someone buy me %1",
    },
    -- Guild recruitment patterns
    {
        from = "suchst du eine (.+) gilde",
        to = "are you looking for a %1 guild",
    },
    {
        from = "du suchst eine (.+) gilde",
        to = "you are looking for a %1 guild",
    },
    {
        from = "sucht eine (.+) gilde",
        to = "looking for a %1 guild",
    },
    -- "suche deutsche gilde" -> "looking for German guild"
    {
        from = "suche deutsche gilde",
        to = "looking for German guild",
    },
    {
        from = "sucht deutsche gilde",
        to = "looking for German guild",
    },
    {
        from = "komm zu \"(.+)\"",
        to = "come to \"%1\"",
    },
    {
        from = "komm zu (.+) und",
        to = "come to %1 and",
    },
    {
        from = "kommt zu \"(.+)\"",
        to = "come to \"%1\"",
    },
    -- Quest and dungeon patterns
    {
        from = "mache (.+) quest",
        to = "doing %1 quest",
    },
    {
        from = "sucht (.+) für (.+)",
        to = "looking for %1 for %2",
    },
    -- Trading patterns
    {
        from = "verkaufe (.+) für (.+)",
        to = "selling %1 for %2",
    },
    {
        from = "kaufe (.+) für (.+)",
        to = "buying %1 for %2",
    },
    -- Time and organization patterns
    {
        from = "täglich (.+)",
        to = "daily %1",
    },
    {
        from = "regelmäßig (.+)",
        to = "regularly %1",
    },
    -- Conversational patterns
    {
        from = "wo muss man für (.+) eigentlich hin",
        to = "where do you go for %1",
    },
    {
        from = "wo muss man für (.+) hin",
        to = "where do you go for %1",
    },
    {
        from = "^wo (.+)$",
        to = "where %1",
    },
    {
        from = " wo (.+)",
        to = " where %1",
    },
    {
        from = "wer (.+)",
        to = "who %1",
    },
    {
        from = "^was (.+)$",
        to = "what %1",
    },
    {
        from = " was (.+)",
        to = " what %1",
    },
    {
        from = "komm (.+)",
        to = "come %1",
    },
    {
        from = "kommt (.+)",
        to = "come %1",
    },
    {
        from = "treff (.+)",
        to = "meet %1",
    },
    {
        from = "triff (.+)",
        to = "meet %1",
    },
    {
        from = "kannst (.+)",
        to = "can you %1",
    },
    {
        from = "könnt (.+)",
        to = "can you %1",
    },
    -- Trading patterns
    {
        from = "wts (.+)",
        to = "WTS %1", -- Preserve WTS but translate the items
    },
    {
        from = "wtb (.+)",
        to = "WTB %1", -- Preserve WTB but translate the items
    },
    {
        from = "lfg (.+)",
        to = "lfg %1",
    },
    {
        from = "lfm (.+)",
        to = "lfm %1",
    },
    -- "LF X für Y" -> "LF X for Y" (mixed language pattern)
    {
        from = "lf%s+(.+)%s+für%s+(.+)",
        to = "LF %1 for %2",
    },
    -- "LFM X für Y" -> "LFM X for Y"
    {
        from = "lfm%s+(.+)%s+für%s+(.+)",
        to = "LFM %1 for %2",
    },
    -- "LFG X für Y" -> "LFG X for Y"
    {
        from = "lfg%s+(.+)%s+für%s+(.+)",
        to = "LFG %1 for %2",
    },
    -- Location patterns
    {
        from = "wo ist (.+)",
        to = "where is %1",
    },
    {
        from = "wo sind (.+)",
        to = "where are %1",
    },
    -- Price questions
    {
        from = "was kostet (.+)",
        to = "what does %1 cost",
    },
    {
        from = "was kostet (.+)\\?",
        to = "what does %1 cost",
    },
    {
        from = "komm zu (.+)",
        to = "come to %1",
    },
    {
        from = "kommt zu (.+)",
        to = "come to %1",
    },
    
    -- German verb-final subordinate clauses (common structure: "Wer X hat Y verloren")
    -- "Wer X hat Y verloren" -> "Who X has lost Y"
    {
        from = "wer (.+) hat (.+) verloren",
        to = "who %1 has lost %2",
    },
    {
        from = "wer (.+) hat (.+) gemacht",
        to = "who %1 has made %2",
    },
    {
        from = "wer (.+) hat (.+) gesagt",
        to = "who %1 has said %2",
    },
    {
        from = "wer (.+) ist (.+)",
        to = "who %1 is %2",
    },
    {
        from = "wer (.+) war (.+)",
        to = "who %1 was %2",
    },
    
    -- "hat die Kontrolle über X verloren" -> "has lost control over X"
    {
        from = "hat die kontrolle über (.+) verloren",
        to = "has lost control over %1",
    },
    {
        from = "hat kontrolle über (.+) verloren",
        to = "has lost control over %1",
    },
    -- "hat die Kontrolle verloren" -> "has lost control"
    {
        from = "hat die kontrolle verloren",
        to = "has lost control",
    },
    {
        from = "hat kontrolle verloren",
        to = "has lost control",
    },
    -- "Wer X hat Y verloren" -> "Who X has lost Y"
    {
        from = "wer (.+) hat (.+) verloren",
        to = "who %1 has lost %2",
    },
    
    -- More complex subordinate clause patterns
    -- "Wer X tut hat Y" -> "Who does X has Y"
    {
        from = "wer (.+) tut hat (.+)",
        to = "who does %1 has %2",
    },
    {
        from = "wer (.+) macht hat (.+)",
        to = "who makes %1 has %2",
    },
    
    -- Past tense with haben
    {
        from = "hat (.+) verloren",
        to = "has lost %1",
    },
    {
        from = "hat (.+) gemacht",
        to = "has made %1",
    },
    {
        from = "hat (.+) gesagt",
        to = "has said %1",
    },
    {
        from = "hat (.+) gehabt",
        to = "has had %1",
    },
    
    -- More conversational patterns
    {
        from = "was hast du (.+)",
        to = "what have you %1",
    },
    {
        from = "was hat (.+)",
        to = "what has %1",
    },
    {
        from = "wo ist (.+)",
        to = "where is %1",
    },
    {
        from = "wo war (.+)",
        to = "where was %1",
    },
    {
        from = "wann kommt (.+)",
        to = "when is %1 coming",
    },
    {
        from = "wann ist (.+)",
        to = "when is %1",
    },
    
    -- "ist das der X?" -> "is that the X?"
    {
        from = "ist das der (.+)%?",
        to = "is that the %1",
    },
    {
        from = "ist das der (.+)",
        to = "is that the %1",
    },
    {
        from = "ist das die (.+)%?",
        to = "is that the %1",
    },
    {
        from = "ist das die (.+)",
        to = "is that the %1",
    },
    {
        from = "ist das das (.+)%?",
        to = "is that the %1",
    },
    {
        from = "ist das das (.+)",
        to = "is that the %1",
    },
    
    -- "Kann man als X Y gehen?" -> "Can you go as X to Y?"
    {
        from = "kann man als (.+) (.+) gehen",
        to = "can you go as %1 to %2",
    },
    {
        from = "kann man als (.+) (.+) gehen\\?",
        to = "can you go as %1 to %2",
    },
    {
        from = "kann man (.+) gehen",
        to = "can you go %1",
    },
    {
        from = "kann man (.+) als (.+)",
        to = "can you %1 as %2",
    },
    
    -- "Möchte wer X gehen?" -> "Does anyone want to go to X?"
    {
        from = "möchte wer (.+) gehen%?",
        to = "does anyone want to go to %1",
    },
    {
        from = "möchte wer (.+) gehen",
        to = "does anyone want to go to %1",
    },
    
    -- Crafting/profession requests: "X gesucht für Y" -> "X wanted for Y"
    -- Handle typos: "X gesucht cht für Y" or similar (allow extra words between gesucht and für)
    {
        from = "(.+) gesucht%s+.-%s*für%s+(.+)",
        to = "%1 wanted for %2",
    },
    {
        from = "(.+) gesucht für (.+)",
        to = "%1 wanted for %2",
    },
    {
        from = "(.+) gesucht für",
        to = "%1 wanted for",
    },
    {
        from = "(.+) gesucht",
        to = "%1 wanted",
    },
    
    -- Relative clause requests: "brauch wen der X" -> "need someone who X"
    {
        from = "brauch wen der (.+)",
        to = "need someone who %1",
    },
    {
        from = "brauche wen der (.+)",
        to = "need someone who %1",
    },
    {
        from = "braucht wen der (.+)",
        to = "need someone who %1",
    },
    {
        from = "brauch wen die (.+)",
        to = "need someone who %1",
    },
    {
        from = "brauche wen die (.+)",
        to = "need someone who %1",
    },
    {
        from = "braucht wen die (.+)",
        to = "need someone who %1",
    },
    
    -- Profession crafting requests: "X der [item] kann" -> "X who can [item]"
    -- This pattern matches profession names followed by relative clause with item
    {
        from = "schneider der (.+) kann",
        to = "tailor who can %1",
    },
    {
        from = "schmied der (.+) kann",
        to = "blacksmith who can %1",
    },
    {
        from = "alchemist der (.+) kann",
        to = "alchemist who can %1",
    },
    {
        from = "verzauberer der (.+) kann",
        to = "enchanter who can %1",
    },
    {
        from = "kürschner der (.+) kann",
        to = "leatherworker who can %1",
    },
    {
        from = "ingenieur der (.+) kann",
        to = "engineer who can %1",
    },
    -- Generic pattern: "X der Y kann" -> "X who can Y" (fallback for any profession)
    -- Note: Made more specific to avoid false positives on English text like "viewer guild"
    -- Only match if "der" is surrounded by German words (not English like "viewer")
    {
        from = "^(.+) der (.+) kann$",
        to = "%1 who can %2",
    },
    {
        from = " (.+) der (.+) kann ",
        to = " %1 who can %2 ",
    },
    
    -- Guild recruitment patterns (from chat log review)
    -- "Die deutsche Gilde X rekrutiert Mitstreiter ab Mindest Lvl Y" -> "The German Guild X recruits comrades from minimum level Y"
    {
        from = "die deutsche gilde (.+) rekrutiert (.+) ab mindest lvl (.+) für (.+)",
        to = "the German guild %1 recruits %2 from minimum level %3 for %4",
    },
    {
        from = "die deutsche gilde (.+) rekrutiert (.+) ab mindest level (.+) für (.+)",
        to = "the German guild %1 recruits %2 from minimum level %3 for %4",
    },
    -- "An alle nochmal bitte unseren DC joinen" -> "To everyone again please join our DC"
    {
        from = "an alle nochmal bitte (.+) joinen",
        to = "to everyone again please join %1",
    },
    -- "werde viele Events planen wie X" -> "will plan many events like X"
    {
        from = "werde viele events planen wie (.+)",
        to = "will plan many events like %1",
    },
    
    -- "wie?" -> "how?" (standalone question)
    {
        from = "^wie%?$",
        to = "how",
    },
    {
        from = "^wie %?$",
        to = "how",
    },
    
    -- "kannste X lassen" -> "can you have X" (colloquial)
    {
        from = "kannste (.+) lassen",
        to = "can you have %1",
    },
    {
        from = "kannst (.+) lassen",
        to = "can you have %1",
    },
    {
        from = "kannste (.+) lassen\\?",
        to = "can you have %1",
    },
    {
        from = "kannst (.+) lassen\\?",
        to = "can you have %1",
    },
    
    -- "kann wer X machen?" -> "can someone make X?"
    {
        from = "kann wer (.+) machen%?",
        to = "can someone make %1",
    },
    {
        from = "kann wer (.+) machen",
        to = "can someone make %1",
    },
    
    -- "muss X machen" -> "need to do X" or "I need to do X"
    {
        from = "muss (.+) machen",
        to = "need to do %1",
    },
    {
        from = "oh muss (.+) machen",
        to = "oh I need to do %1",
    },
    
    -- ============================================
    -- ADDITIONAL COMMON SENTENCE PATTERNS
    -- ============================================
    
    -- Perfect tense patterns with sein (movement verbs)
    {
        from = "bin (.+) gekommen",
        to = "have come to %1/I came to %1",
        priority = 10,
    },
    {
        from = "ist (.+) gekommen",
        to = "has come to %1/he came to %1",
        priority = 10,
    },
    {
        from = "sind (.+) gekommen",
        to = "have come to %1/we came to %1",
        priority = 10,
    },
    {
        from = "bin (.+) gegangen",
        to = "have gone to %1/I went to %1",
        priority = 10,
    },
    {
        from = "ist (.+) gegangen",
        to = "has gone to %1/he went to %1",
        priority = 10,
    },
    {
        from = "sind (.+) gegangen",
        to = "have gone to %1/we went to %1",
        priority = 10,
    },
    
    -- Future tense patterns
    {
        from = "werde (.+) machen",
        to = "will do %1",
        priority = 10,
    },
    {
        from = "wirst (.+) machen",
        to = "will do %1",
        priority = 10,
    },
    {
        from = "wird (.+) machen",
        to = "will do %1",
        priority = 10,
    },
    {
        from = "werden (.+) machen",
        to = "will do %1",
        priority = 10,
    },
    {
        from = "werde (.+) gehen",
        to = "will go %1",
        priority = 10,
    },
    {
        from = "wirst (.+) gehen",
        to = "will go %1",
        priority = 10,
    },
    {
        from = "wird (.+) gehen",
        to = "will go %1",
        priority = 10,
    },
    {
        from = "werden (.+) gehen",
        to = "will go %1",
        priority = 10,
    },
    
    -- Modal verb + infinitive patterns
    {
        from = "muss (.+) gehen",
        to = "must go %1/have to go %1",
        priority = 10,
    },
    {
        from = "musst (.+) gehen",
        to = "must go %1/have to go %1",
        priority = 10,
    },
    {
        from = "soll (.+) gehen",
        to = "should go %1",
        priority = 10,
    },
    {
        from = "sollst (.+) gehen",
        to = "should go %1",
        priority = 10,
    },
    {
        from = "kann (.+) gehen",
        to = "can go %1",
        priority = 10,
    },
    {
        from = "kannst (.+) gehen",
        to = "can go %1",
        priority = 10,
    },
    {
        from = "will (.+) gehen",
        to = "want to go %1",
        priority = 10,
    },
    {
        from = "willst (.+) gehen",
        to = "want to go %1",
        priority = 10,
    },
    {
        from = "darf (.+) gehen",
        to = "may go %1",
        priority = 10,
    },
    {
        from = "darfst (.+) gehen",
        to = "may go %1",
        priority = 10,
    },
    
    -- Subordinate clause patterns (wenn/weil/dass)
    {
        from = "wenn (.+) dann (.+)",
        to = "if %1 then %2",
        priority = 12,
    },
    {
        from = "wenn (.+) (.+)",
        to = "if %1 %2",
        priority = 10,
    },
    {
        from = "weil (.+) (.+)",
        to = "because %1 %2",
        priority = 10,
    },
    {
        from = "dass (.+) (.+)",
        to = "that %1 %2",
        priority = 10,
    },
    {
        from = "obwohl (.+) (.+)",
        to = "although %1 %2",
        priority = 10,
    },
    {
        from = "bevor (.+) (.+)",
        to = "before %1 %2",
        priority = 10,
    },
    {
        from = "nachdem (.+) (.+)",
        to = "after %1 %2",
        priority = 10,
    },
    {
        from = "während (.+) (.+)",
        to = "while %1 %2",
        priority = 10,
    },
    
    -- Question patterns with modal verbs
    {
        from = "kannst du (.+) machen%?",
        to = "can you do %1",
        priority = 12,
    },
    {
        from = "kannst du (.+) machen",
        to = "can you do %1",
        priority = 12,
    },
    {
        from = "kannst du (.+) gehen%?",
        to = "can you go %1",
        priority = 12,
    },
    {
        from = "kannst du (.+) gehen",
        to = "can you go %1",
        priority = 12,
    },
    {
        from = "willst du (.+) machen%?",
        to = "do you want to do %1",
        priority = 12,
    },
    {
        from = "willst du (.+) machen",
        to = "do you want to do %1",
        priority = 12,
    },
    {
        from = "musst du (.+) machen%?",
        to = "do you have to do %1",
        priority = 12,
    },
    {
        from = "musst du (.+) machen",
        to = "do you have to do %1",
        priority = 12,
    },
    {
        from = "sollst du (.+) machen%?",
        to = "should you do %1",
        priority = 12,
    },
    {
        from = "sollst du (.+) machen",
        to = "should you do %1",
        priority = 12,
    },
    
    -- Imperative patterns
    {
        from = "komm (.+)",
        to = "come %1",
        priority = 10,
    },
    {
        from = "kommt (.+)",
        to = "come %1",
        priority = 10,
    },
    {
        from = "geh (.+)",
        to = "go %1",
        priority = 10,
    },
    {
        from = "geht (.+)",
        to = "go %1",
        priority = 10,
    },
    {
        from = "mach (.+)",
        to = "do %1",
        priority = 10,
    },
    {
        from = "macht (.+)",
        to = "do %1",
        priority = 10,
    },
    {
        from = "warte (.+)",
        to = "wait %1",
        priority = 10,
    },
    {
        from = "wartet (.+)",
        to = "wait %1",
        priority = 10,
    },
    {
        from = "hilf (.+)",
        to = "help %1",
        priority = 10,
    },
    {
        from = "helft (.+)",
        to = "help %1",
        priority = 10,
    },
    
    -- Location + action patterns
    {
        from = "gehe nach (.+)",
        to = "going to %1",
        priority = 10,
    },
    {
        from = "gehst nach (.+)",
        to = "going to %1",
        priority = 10,
    },
    {
        from = "geht nach (.+)",
        to = "going to %1",
        priority = 10,
    },
    {
        from = "gehen nach (.+)",
        to = "going to %1",
        priority = 10,
    },
    {
        from = "komme nach (.+)",
        to = "coming to %1",
        priority = 10,
    },
    {
        from = "kommst nach (.+)",
        to = "coming to %1",
        priority = 10,
    },
    {
        from = "kommt nach (.+)",
        to = "coming to %1",
        priority = 10,
    },
    {
        from = "kommen nach (.+)",
        to = "coming to %1",
        priority = 10,
    },
    {
        from = "bin in (.+)",
        to = "am in %1",
        priority = 10,
    },
    {
        from = "ist in (.+)",
        to = "is in %1",
        priority = 10,
    },
    {
        from = "sind in (.+)",
        to = "are in %1",
        priority = 10,
    },
    {
        from = "bin bei (.+)",
        to = "am at %1",
        priority = 10,
    },
    {
        from = "ist bei (.+)",
        to = "is at %1",
        priority = 10,
    },
    {
        from = "sind bei (.+)",
        to = "are at %1",
        priority = 10,
    },
    
    -- Possession patterns
    {
        from = "habe (.+)",
        to = "have %1",
        priority = 10,
    },
    {
        from = "hast (.+)",
        to = "have %1",
        priority = 10,
    },
    {
        from = "hat (.+)",
        to = "has %1",
        priority = 10,
    },
    {
        from = "haben (.+)",
        to = "have %1",
        priority = 10,
    },
    {
        from = "habt (.+)",
        to = "have %1",
        priority = 10,
    },
    {
        from = "habe kein (.+)",
        to = "have no %1",
        priority = 10,
    },
    {
        from = "hast kein (.+)",
        to = "have no %1",
        priority = 10,
    },
    {
        from = "hat kein (.+)",
        to = "has no %1",
        priority = 10,
    },
    {
        from = "haben kein (.+)",
        to = "have no %1",
        priority = 10,
    },
    
    -- Action + object patterns
    {
        from = "mache (.+)",
        to = "doing %1/make %1",
        priority = 10,
    },
    {
        from = "machst (.+)",
        to = "doing %1/make %1",
        priority = 10,
    },
    {
        from = "macht (.+)",
        to = "doing %1/makes %1",
        priority = 10,
    },
    {
        from = "machen (.+)",
        to = "doing %1/make %1",
        priority = 10,
    },
    {
        from = "tue (.+)",
        to = "doing %1/do %1",
        priority = 10,
    },
    {
        from = "tust (.+)",
        to = "doing %1/do %1",
        priority = 10,
    },
    {
        from = "tut (.+)",
        to = "doing %1/does %1",
        priority = 10,
    },
    {
        from = "tun (.+)",
        to = "doing %1/do %1",
        priority = 10,
    },
    
    -- Separable verb patterns (prefix separated)
    {
        from = "macht (.+) auf",
        to = "opens %1",
        priority = 12,
    },
    {
        from = "machst (.+) auf",
        to = "open %1",
        priority = 12,
    },
    {
        from = "macht (.+) zu",
        to = "closes %1",
        priority = 12,
    },
    {
        from = "machst (.+) zu",
        to = "close %1",
        priority = 12,
    },
    {
        from = "kommt (.+) zurück",
        to = "comes back %1",
        priority = 12,
    },
    {
        from = "kommst (.+) zurück",
        to = "come back %1",
        priority = 12,
    },
    {
        from = "geht (.+) weiter",
        to = "continues %1",
        priority = 12,
    },
    {
        from = "gehst (.+) weiter",
        to = "continue %1",
        priority = 12,
    },
    
    -- Time + action patterns
    {
        from = "heute (.+)",
        to = "today %1",
        priority = 8,
    },
    {
        from = "morgen (.+)",
        to = "tomorrow %1",
        priority = 8,
    },
    {
        from = "gestern (.+)",
        to = "yesterday %1",
        priority = 8,
    },
    {
        from = "jetzt (.+)",
        to = "now %1",
        priority = 8,
    },
    {
        from = "gleich (.+)",
        to = "soon %1",
        priority = 8,
    },
    {
        from = "später (.+)",
        to = "later %1",
        priority = 8,
    },
    
    -- More question patterns
    {
        from = "was machst du (.+)",
        to = "what are you doing %1",
        priority = 12,
    },
    {
        from = "was macht ihr (.+)",
        to = "what are you doing %1",
        priority = 12,
    },
    {
        from = "wo bist du (.+)",
        to = "where are you %1",
        priority = 12,
    },
    {
        from = "wo seid ihr (.+)",
        to = "where are you %1",
        priority = 12,
    },
    {
        from = "wie geht es (.+)",
        to = "how is %1 going",
        priority = 12,
    },
    {
        from = "wie gehts (.+)",
        to = "how's %1 going",
        priority = 12,
    },
    {
        from = "warum (.+)",
        to = "why %1",
        priority = 10,
    },
    {
        from = "wieso (.+)",
        to = "why %1",
        priority = 10,
    },
    {
        from = "wann (.+)",
        to = "when %1",
        priority = 10,
    },
    
    -- Request patterns
    {
        from = "kannst du mir (.+) helfen",
        to = "can you help me %1",
        priority = 12,
    },
    {
        from = "kannst mir (.+) helfen",
        to = "can you help me %1",
        priority = 12,
    },
    {
        from = "könnt ihr mir (.+) helfen",
        to = "can you help me %1",
        priority = 12,
    },
    {
        from = "könnt mir (.+) helfen",
        to = "can you help me %1",
        priority = 12,
    },
    {
        from = "kannst du mir (.+) geben",
        to = "can you give me %1",
        priority = 12,
    },
    {
        from = "kannst mir (.+) geben",
        to = "can you give me %1",
        priority = 12,
    },
    {
        from = "kannst du mir (.+) zeigen",
        to = "can you show me %1",
        priority = 12,
    },
    {
        from = "kannst mir (.+) zeigen",
        to = "can you show me %1",
        priority = 12,
    },
    
    -- Trading patterns (expanded)
    {
        from = "verkaufe (.+) für (.+) gold",
        to = "selling %1 for %2 gold",
        priority = 10,
    },
    {
        from = "kaufe (.+) für (.+) gold",
        to = "buying %1 for %2 gold",
        priority = 10,
    },
    {
        from = "verkaufe (.+) für (.+) silber",
        to = "selling %1 for %2 silver",
        priority = 10,
    },
    {
        from = "kaufe (.+) für (.+) silber",
        to = "buying %1 for %2 silver",
        priority = 10,
    },
    {
        from = "was kostet (.+)",
        to = "what does %1 cost",
        priority = 10,
    },
    {
        from = "wie viel kostet (.+)",
        to = "how much does %1 cost",
        priority = 10,
    },
    {
        from = "wie viel für (.+)",
        to = "how much for %1",
        priority = 10,
    },
    
    -- LFG patterns (expanded)
    {
        from = "suche (.+) für (.+)",
        to = "looking for %1 for %2",
        priority = 10,
    },
    {
        from = "sucht (.+) für (.+)",
        to = "looking for %1 for %2",
        priority = 10,
    },
    {
        from = "brauche (.+) für (.+)",
        to = "need %1 for %2",
        priority = 10,
    },
    {
        from = "braucht (.+) für (.+)",
        to = "need %1 for %2",
        priority = 10,
    },
    {
        from = "suche gruppe für (.+)",
        to = "looking for group for %1",
        priority = 10,
    },
    {
        from = "sucht gruppe für (.+)",
        to = "looking for group for %1",
        priority = 10,
    },
    {
        from = "brauche gruppe für (.+)",
        to = "need group for %1",
        priority = 10,
    },
    {
        from = "braucht gruppe für (.+)",
        to = "need group for %1",
        priority = 10,
    },
    
    -- Profession requests (expanded)
    {
        from = "suche (.+) für (.+)",
        to = "looking for %1 for %2",
        priority = 8,
    },
    {
        from = "brauche (.+) für (.+)",
        to = "need %1 for %2",
        priority = 8,
    },
    {
        from = "sucht (.+) der (.+) kann",
        to = "looking for %1 who can %2",
        priority = 10,
    },
    {
        from = "braucht (.+) der (.+) kann",
        to = "need %1 who can %2",
        priority = 10,
    },
    
    -- Relative clause patterns (expanded)
    {
        from = "jemand der (.+) kann",
        to = "someone who can %1",
        priority = 10,
    },
    {
        from = "jemand die (.+) kann",
        to = "someone who can %1",
        priority = 10,
    },
    {
        from = "jemand das (.+) kann",
        to = "someone who can %1",
        priority = 10,
    },
    {
        from = "wer (.+) kann",
        to = "who can %1",
        priority = 10,
    },
    {
        from = "wer (.+) will",
        to = "who wants %1",
        priority = 10,
    },
    {
        from = "wer (.+) hat",
        to = "who has %1",
        priority = 10,
    },
    
    -- Comparison patterns
    {
        from = "besser als (.+)",
        to = "better than %1",
        priority = 10,
    },
    {
        from = "schlechter als (.+)",
        to = "worse than %1",
        priority = 10,
    },
    {
        from = "mehr als (.+)",
        to = "more than %1",
        priority = 10,
    },
    {
        from = "weniger als (.+)",
        to = "less than %1",
        priority = 10,
    },
    {
        from = "genauso wie (.+)",
        to = "just like %1",
        priority = 10,
    },
    {
        from = "so wie (.+)",
        to = "like %1",
        priority = 10,
    },
    
    -- Conditional patterns
    {
        from = "falls (.+) dann (.+)",
        to = "if %1 then %2",
        priority = 10,
    },
    {
        from = "wenn (.+) dann (.+)",
        to = "if %1 then %2",
        priority = 10,
    },
    {
        from = "falls (.+) (.+)",
        to = "if %1 %2",
        priority = 8,
    },
    
    -- Purpose patterns (um zu)
    {
        from = "um (.+) zu (.+)",
        to = "in order to %2 %1",
        priority = 10,
    },
    {
        from = "damit (.+) (.+)",
        to = "so that %1 %2",
        priority = 10,
    },
    
    -- Agreement/Support: "bin da ganz bei X" → "i'm completely with X on that"
    {
        from = "bin da ganz bei (.+)",
        to = "i'm completely with %1 on that",
        priority = 15,
    },
    {
        from = "am here quite at (.+)",
        to = "i'm completely with %1 on that",
        priority = 15,
    },
    
    -- Item names in brackets (common WoW items) - patterns apply BEFORE tokenization
    {
        from = "%[Großer grüner Sack%]",
        to = "[Large green bag]",
        priority = 20,
    },
    {
        from = "%[großer grüner sack%]",
        to = "[Large green bag]",
        priority = 20,
    },
    {
        from = "%[Großer roter Sack%]",
        to = "[Large red bag]",
        priority = 20,
    },
    {
        from = "%[großer roter sack%]",
        to = "[Large red bag]",
        priority = 20,
    },
}

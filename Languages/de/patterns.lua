-- WhatDidTheySay - German Language Pack - Patterns
-- Reusable phrase structures with captures

WDTS_Lang_de_Patterns = {
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
    {
        from = "(.+) der (.+) kann",
        to = "%1 who can %2",
    },
}

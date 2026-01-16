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
    -- Guild recruitment patterns
    {
        from = "suchst du eine (.+) gilde",
        to = "are you looking for a %1 guild",
    },
    {
        from = "sucht eine (.+) gilde",
        to = "looking for a %1 guild",
    },
    {
        from = "komm zu \"(.+)\"",
        to = "come to \"%1\"",
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
        from = "wo (.+)",
        to = "where %1",
    },
    {
        from = "wer (.+)",
        to = "who %1",
    },
    {
        from = "was (.+)",
        to = "what %1",
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
        to = "wts %1",
    },
    {
        from = "wtb (.+)",
        to = "wtb %1",
    },
    {
        from = "lfg (.+)",
        to = "lfg %1",
    },
    {
        from = "lfm (.+)",
        to = "lfm %1",
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
        from = "kann man (.+) gehen",
        to = "can you go %1",
    },
    {
        from = "kann man (.+) als (.+)",
        to = "can you %1 as %2",
    },
    
    -- Crafting/profession requests: "X gesucht für Y" -> "X wanted for Y"
    -- Handle typos: "X gesucht cht für Y" or similar
    {
        from = "(.+) gesucht%s+%w*%s*für (.+)",
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
}

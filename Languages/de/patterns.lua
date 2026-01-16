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
}

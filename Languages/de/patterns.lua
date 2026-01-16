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
}

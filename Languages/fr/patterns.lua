-- WhatDidTheySay - French Language Pack - Patterns
-- Reusable phrase structures with captures

WDTS_Lang_fr_Patterns = {
    -- "cherche X pour Y" -> "looking for X for Y"
    {
        from = "cherche (.+) pour (.+)",
        to = "looking for %1 for %2",
    },
    {
        from = "recherche (.+) pour (.+)",
        to = "looking for %1 for %2",
    },
    -- "peux-tu X" -> "can you X"
    {
        from = "peux%-tu (.+)",
        to = "can you %1",
    },
    {
        from = "peux tu (.+)",
        to = "can you %1",
    },
    {
        from = "pouvez%-vous (.+)",
        to = "can you %1",
    },
    {
        from = "pouvez vous (.+)",
        to = "can you %1",
    },
    -- "lfg X" -> "lfg X"
    {
        from = "lfg (.+)",
        to = "lfg %1",
    },
    -- "lfm X" -> "lfm X"
    {
        from = "lfm (.+)",
        to = "lfm %1",
    },
    -- "cherche X pour Y" -> "looking for X for Y" (mixed language pattern)
    {
        from = "lfg%s+(.+)%s+pour%s+(.+)",
        to = "LFG %1 for %2",
    },
    {
        from = "lfm%s+(.+)%s+pour%s+(.+)",
        to = "LFM %1 for %2",
    },
}

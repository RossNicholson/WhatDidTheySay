-- WhatDidTheySay - WoW Abbreviations Language Pack - Patterns
-- Complex abbreviation expansion patterns

WDTS_Lang_wow_Patterns = {
    {
        from = "^lf (%d+)m (.+)$",
        to = "looking for %1 more %2",
        priority = 20,
    },
    {
        from = "^lfm (%d+) (.+)$",
        to = "looking for more %1 %2",
        priority = 20,
    },
    {
        from = "lfm for (.+)",
        to = "looking for more for %1",
        priority = 15,
    },
    {
        from = "lf for (.+)",
        to = "looking for %1",
        priority = 15,
    },
    {
        from = "wts (.+) (%d+)g",
        to = "want to sell %1 %2 gold",
        priority = 15,
    },
    {
        from = "wtb (.+) (%d+)g",
        to = "want to buy %1 %2 gold",
        priority = 15,
    },
    {
        from = "(%d+)g for (.+)",
        to = "%1 gold for %2",
        priority = 15,
    },
    {
        from = "brb (%d+) min",
        to = "be right back %1 minutes",
        priority = 15,
    },
    {
        from = "brb (%d+) sec",
        to = "be right back %1 seconds",
        priority = 15,
    },
}

-- WhatDidTheySay - WoW Abbreviations Language Pack - Grammar
-- Post-processing rules for abbreviation expansions

WDTS_Lang_wow_Grammar = {
    rules = {
        -- Fix article usage
        {
            from = " a ([aeiouAEIOU])",
            to = " an %1",
            priority = 10,
        },
        {
            from = "looking for an tank",
            to = "looking for a tank",
            priority = 15,
        },
        {
            from = "looking for an healer",
            to = "looking for a healer",
            priority = 15,
        },
        {
            from = "looking for an dps",
            to = "looking for a dps",
            priority = 15,
        },
        
        -- Fix capitalization
        {
            from = "^looking for",
            to = "Looking for",
            priority = 5,
        },
        {
            from = "^want to sell",
            to = "Want to sell",
            priority = 5,
        },
        {
            from = "^want to buy",
            to = "Want to buy",
            priority = 5,
        },
        
        -- Fix duplicate expansions
        {
            from = "Stratholme Stratholme",
            to = "Stratholme",
            priority = 20,
        },
        {
            from = "Blackrock Blackrock",
            to = "Blackrock",
            priority = 20,
        },
        
        -- Fix "dps" expansion in context - keep as "dps" when used as role, not "damage per second"
        {
            from = "looking for more (%d+) damage per second",
            to = "looking for more %1 dps",
            priority = 20,
        },
        {
            from = "looking for (%d+) damage per second",
            to = "looking for %1 dps",
            priority = 20,
        },
        {
            from = "for damage per second",
            to = "for dps",
            priority = 20,
        },
        
        -- Fix spacing issues
        {
            from = "]5 gold",
            to = "] 5 gold",
            priority = 15,
        },
        {
            from = "]%d+g",
            to = "] %1g",
            priority = 15,
        },
        
        -- Fix pluralization for "more"
        {
            from = "looking for (%d+) more tank$",
            to = "looking for %1 more tank",
            priority = 10,
        },
        {
            from = "looking for (%d+) more healer$",
            to = "looking for %1 more healer",
            priority = 10,
        },
        {
            from = "looking for (%d+) more dps$",
            to = "looking for %1 more dps",
            priority = 10,
        },
        {
            from = "looking for 2 more tank",
            to = "looking for 2 more tanks",
            priority = 15,
        },
        {
            from = "looking for 3 more tank",
            to = "looking for 3 more tanks",
            priority = 15,
        },
        {
            from = "looking for 4 more tank",
            to = "looking for 4 more tanks",
            priority = 15,
        },
        {
            from = "looking for 2 more healer",
            to = "looking for 2 more healers",
            priority = 15,
        },
        {
            from = "looking for 3 more healer",
            to = "looking for 3 more healers",
            priority = 15,
        },
        {
            from = "looking for 4 more healer",
            to = "looking for 4 more healers",
            priority = 15,
        },
    },
}

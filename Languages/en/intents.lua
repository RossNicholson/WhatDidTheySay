-- WhatDidTheySay - English Language Pack - Intents
-- Intent patterns for English chat

WDTS_Lang_en_Intents = {
    {
        id = "LFG_DUNGEON",
        patterns = {
            "lfg",
            "looking for group",
            "lfm",
            "looking for more",
        },
        score = 0.9,
    },
    {
        id = "INVITE_REQUEST",
        patterns = {
            "inv",
            "invite",
            "can you invite",
            "invite me",
        },
        score = 0.9,
    },
    {
        id = "SUMMON_REQUEST",
        patterns = {
            "summon",
            "summon me",
            "need summon",
        },
        score = 0.85,
    },
    {
        id = "READY",
        patterns = {
            "ready",
            "r",
            "rdy",
            "im ready",
        },
        score = 0.9,
    },
    {
        id = "WAITING",
        patterns = {
            "wait",
            "waiting",
            "one sec",
            "brb",
        },
        score = 0.8,
    },
    {
        id = "RESOURCE_STATUS",
        patterns = {
            "oom",
            "out of mana",
            "low mana",
            "need mana",
        },
        score = 0.85,
    },
    {
        id = "MOVEMENT",
        patterns = {
            "go",
            "pull",
            "stop",
            "move",
        },
        score = 0.7,
    },
    {
        id = "QUESTION",
        patterns = {
            "what",
            "where",
            "when",
            "who",
            "why",
            "how",
        },
        score = 0.6,
    },
}

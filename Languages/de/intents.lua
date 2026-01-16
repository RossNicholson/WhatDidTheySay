-- WhatDidTheySay - German Language Pack - Intents
-- Intent patterns for German chat

WDTS_Lang_de_Intents = {
    {
        id = "LFG_DUNGEON",
        patterns = {
            "suche gruppe",
            "sucht gruppe",
            "lfg",
            "suche spieler",
            "sucht spieler",
            "suche mitglieder",
            "sucht mitglieder",
        },
        score = 0.9,
    },
    {
        id = "INVITE_REQUEST",
        patterns = {
            "einladen",
            "kannst du einladen",
            "kannst mich einladen",
            "inv",
            "invite",
            "einladung",
        },
        score = 0.9,
    },
    {
        id = "SUMMON_REQUEST",
        patterns = {
            "rufen",
            "beschwören",
            "kannst du rufen",
            "kannst mich rufen",
            "summon",
        },
        score = 0.85,
    },
    {
        id = "READY",
        patterns = {
            "bereit",
            "fertig",
            "rdy",
            "r",
            "bin bereit",
        },
        score = 0.9,
    },
    {
        id = "WAITING",
        patterns = {
            "warte",
            "wartet",
            "wartend",
            "moment",
            "einen moment",
        },
        score = 0.8,
    },
    {
        id = "RESOURCE_STATUS",
        patterns = {
            "kein mana",
            "keine mana",
            "kein manna",
            "low mana",
            "oom",
            "brauche mana",
        },
        score = 0.85,
    },
    {
        id = "MOVEMENT",
        patterns = {
            "geh", -- But not in phrases like "geh zu"
            "geht", -- But not in phrases like "geht zu"
            "komm hier", -- Specific: "come here"
            "kommt hier", -- Specific: "come here"
            "stop",
            "halt",
        },
        score = 0.7,
    },
    {
        id = "QUESTION",
        patterns = {
            "was",
            "wo",
            "wann",
            "wer",
            "warum",
            "wie",
        },
        score = 0.6,
    },
}

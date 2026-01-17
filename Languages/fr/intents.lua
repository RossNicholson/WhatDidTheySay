-- WhatDidTheySay - French Language Pack - Intents
-- Intent patterns for French chat

WDTS_Lang_fr_Intents = {
    {
        id = "LFG_DUNGEON",
        patterns = {
            "cherche groupe",
            "recherche groupe",
            "lfg",
            "cherche joueurs",
            "cherche membres",
        },
        score = 0.9,
    },
    {
        id = "INVITE_REQUEST",
        patterns = {
            "inviter",
            "peux tu inviter",
            "pouvez-vous inviter",
            "inv",
            "invite",
            "invitation",
        },
        score = 0.9,
    },
    {
        id = "SUMMON_REQUEST",
        patterns = {
            "invoquer",
            "peux tu invoquer",
            "pouvez-vous invoquer",
            "summon",
        },
        score = 0.85,
    },
    {
        id = "READY",
        patterns = {
            "prêt",
            "prête",
            "rdy",
            "r",
            "je suis prêt",
        },
        score = 0.9,
    },
    {
        id = "WAITING",
        patterns = {
            "attends",
            "attendez",
            "attente",
            "wait",
        },
        score = 0.85,
    },
}

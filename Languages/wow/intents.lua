-- WhatDidTheySay - WoW Abbreviations Language Pack - Intents
-- Intent detection for WoW gaming messages

WDTS_Lang_wow_Intents = {
    {
        pattern = "lf[lfgm]?",
        intent = "LFG",
        score = 0.9,
    },
    {
        pattern = "wts",
        intent = "TRADING_SELL",
        score = 0.9,
    },
    {
        pattern = "wtb",
        intent = "TRADING_BUY",
        score = 0.9,
    },
    {
        pattern = "wtt",
        intent = "TRADING_TRADE",
        score = 0.9,
    },
    {
        pattern = "rdy|ready|r",
        intent = "READY",
        score = 0.8,
    },
    {
        pattern = "inv|invite",
        intent = "INVITE",
        score = 0.8,
    },
    {
        pattern = "afk|brb",
        intent = "STATUS",
        score = 0.7,
    },
}

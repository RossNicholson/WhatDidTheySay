-- WhatDidTheySay - Language Pack Manager
-- Manages discovery and loading of language packs

local LanguagePackManager = {}

-- Language pack metadata (name, description, etc.)
LanguagePackManager.availablePacks = {}

-- Discover available language packs
function LanguagePackManager.DiscoverPacks()
    local packs = {}
    
    -- Known language pack codes and their display names
    local packInfo = {
        ["de"] = {
            name = "German",
            nativeName = "Deutsch",
            description = "German → English translation",
            direction = "de → en",
            available = true,
        },
        ["ru"] = {
            name = "Russian",
            nativeName = "Русский",
            description = "Russian → English translation (Coming Soon)",
            direction = "ru → en",
            available = false,
        },
        ["fr"] = {
            name = "French",
            nativeName = "Français",
            description = "French → English translation",
            direction = "fr → en",
            available = true,
        },
        ["es"] = {
            name = "Spanish",
            nativeName = "Español",
            description = "Spanish → English translation (Coming Soon)",
            direction = "es → en",
            available = false,
        },
        ["pt"] = {
            name = "Portuguese",
            nativeName = "Português",
            description = "Portuguese → English translation (Coming Soon)",
            direction = "pt → en",
            available = false,
        },
        ["it"] = {
            name = "Italian",
            nativeName = "Italiano",
            description = "Italian → English translation (Coming Soon)",
            direction = "it → en",
            available = false,
        },
        ["pl"] = {
            name = "Polish",
            nativeName = "Polski",
            description = "Polish → English translation (Coming Soon)",
            direction = "pl → en",
            available = false,
        },
        ["nl"] = {
            name = "Dutch",
            nativeName = "Nederlands",
            description = "Dutch → English translation (Coming Soon)",
            direction = "nl → en",
            available = false,
        },
        ["sv"] = {
            name = "Swedish",
            nativeName = "Svenska",
            description = "Swedish → English translation (Coming Soon)",
            direction = "sv → en",
            available = false,
        },
        ["en"] = {
            name = "English",
            nativeName = "English",
            description = "English (target language)",
            direction = "target",
            available = true,
        },
        ["wow"] = {
            name = "WoW Abbreviations",
            nativeName = "WoW Abbreviations",
            description = "WoW gaming abbreviations → English",
            direction = "wow → en",
            available = true,
        },
    }
    
    -- Check which language packs are actually loaded
    for lang, info in pairs(packInfo) do
        local packName = "WDTS_Lang_" .. lang
        -- Check if at least tokens file is loaded
        if _G[packName .. "_Tokens"] then
            local isAvailable = info.available == true
            packs[lang] = {
                code = lang,
                name = info.name,
                nativeName = info.nativeName,
                description = info.description,
                direction = info.direction,
                available = isAvailable,
                enabled = isAvailable and (WhatDidTheySayDB.enabledLanguages and WhatDidTheySayDB.enabledLanguages[lang] ~= false),
            }
        end
    end
    
    LanguagePackManager.availablePacks = packs
    return packs
end

-- Get available language packs
function LanguagePackManager.GetAvailablePacks()
    return LanguagePackManager.availablePacks
end

-- Check if a language pack is enabled
function LanguagePackManager.IsEnabled(lang)
    if not WhatDidTheySayDB.enabledLanguages then
        return true -- Default to enabled if not set
    end
    return WhatDidTheySayDB.enabledLanguages[lang] ~= false
end

-- Enable a language pack
function LanguagePackManager.EnablePack(lang)
    if not WhatDidTheySayDB.enabledLanguages then
        WhatDidTheySayDB.enabledLanguages = {}
    end
    WhatDidTheySayDB.enabledLanguages[lang] = true
end

-- Disable a language pack
function LanguagePackManager.DisablePack(lang)
    if not WhatDidTheySayDB.enabledLanguages then
        WhatDidTheySayDB.enabledLanguages = {}
    end
    WhatDidTheySayDB.enabledLanguages[lang] = false
end

-- Initialize default enabled languages
-- Only enable language packs that are actually loaded (discovered)
function LanguagePackManager.InitializeDefaults()
    if not WhatDidTheySayDB.enabledLanguages then
        WhatDidTheySayDB.enabledLanguages = {}
        
        -- Discover available packs first
        LanguagePackManager.DiscoverPacks()
        local packs = LanguagePackManager.GetAvailablePacks()
        
        -- Enable all discovered language packs by default (except English, which is target)
        -- WoW abbreviations pack is disabled by default (users must explicitly enable it)
        -- Users can disable any language pack they don't want
        for lang, packInfo in pairs(packs) do
            if lang == "en" then
                WhatDidTheySayDB.enabledLanguages[lang] = false -- English is target, not source
            elseif lang == "wow" then
                WhatDidTheySayDB.enabledLanguages[lang] = false -- WoW abbreviations disabled by default
            else
                WhatDidTheySayDB.enabledLanguages[lang] = true -- Enable by default
            end
        end
        
        -- If no packs were discovered, fall back to old behavior (German enabled by default)
        -- This handles cases where discovery happens before packs are loaded
        if not next(WhatDidTheySayDB.enabledLanguages) then
            WhatDidTheySayDB.enabledLanguages["de"] = true
            WhatDidTheySayDB.enabledLanguages["en"] = false
        end
    end
end

-- Initialize language pack manager
function LanguagePackManager.Initialize()
    LanguagePackManager.InitializeDefaults()
    LanguagePackManager.DiscoverPacks()
end

WDTS_LanguagePackManager = LanguagePackManager

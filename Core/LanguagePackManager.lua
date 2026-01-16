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
        },
        ["en"] = {
            name = "English",
            nativeName = "English",
            description = "English (target language)",
            direction = "target",
        },
        -- Add more languages here as they're created
    }
    
    -- Check which language packs are actually loaded
    for lang, info in pairs(packInfo) do
        local packName = "WDTS_Lang_" .. lang
        -- Check if at least tokens file is loaded
        if _G[packName .. "_Tokens"] then
            packs[lang] = {
                code = lang,
                name = info.name,
                nativeName = info.nativeName,
                description = info.description,
                direction = info.direction,
                enabled = WhatDidTheySayDB.enabledLanguages and WhatDidTheySayDB.enabledLanguages[lang] ~= false,
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
function LanguagePackManager.InitializeDefaults()
    if not WhatDidTheySayDB.enabledLanguages then
        WhatDidTheySayDB.enabledLanguages = {
            ["de"] = true, -- German enabled by default
            ["en"] = false, -- English is target, not source
        }
    end
end

-- Initialize language pack manager
function LanguagePackManager.Initialize()
    LanguagePackManager.InitializeDefaults()
    LanguagePackManager.DiscoverPacks()
end

WDTS_LanguagePackManager = LanguagePackManager

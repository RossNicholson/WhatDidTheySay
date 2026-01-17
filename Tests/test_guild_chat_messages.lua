#!/usr/bin/env lua5.1
-- Test for guild chat messages from screenshot

_G = _G or {}
_G.WhatDidTheySayDB = {
    enabledLanguagePacks = { de = true },
}

_G.GetTime = function() return os.time() end
_G.GetChannelList = function() return end
_G.IsInRaid = function() return false end
_G.select = select

local function loadFile(path)
    local file = io.open(path, "r")
    if not file then
        error("Could not open: " .. path)
    end
    local content = file:read("*all")
    file:close()
    local func = loadstring(content, path)
    if not func then
        error("Error compiling: " .. path)
    end
    setfenv(func, _G)
    func()
end

loadFile("Core/Utils.lua")
loadFile("Core/Tokenizer.lua")
loadFile("Core/LanguageDetect.lua")
loadFile("Core/Confidence.lua")
loadFile("Core/LanguagePackManager.lua")
loadFile("Core/Engine.lua")
loadFile("Languages/de/metadata.lua")
loadFile("Languages/de/tokens.lua")
loadFile("Languages/de/intents.lua")
loadFile("Languages/de/patterns.lua")
loadFile("Languages/de/grammar.lua")
loadFile("Languages/de/phrases.lua")

WDTS_Engine.Initialize()

local testCases = {
    {
        message = "du meinst die söldner quest?",
        description = "Contains 'söldner' (mercenary) and English 'quest'",
        shouldTranslate = true,
        expectedWords = {"mercenary", "quest"},
    },
    {
        message = "mit 19 bin ich wohl noch zu low dafür oder",
        description = "Contains numbers and English 'low'",
        shouldTranslate = true,
        expectedWords = {"low"},
    },
    {
        message = "yes",
        description = "Pure English - should skip",
        shouldTranslate = false,
    },
    {
        message = "bin gearde angekommen und hätte die noch",
        description = "Has typo 'gearde' instead of 'gerade'",
        shouldTranslate = true,
        expectedWords = {"just", "arrived"},
    },
    {
        message = "hab 2 19 dabei ^^",
        description = "Has item links and emoticon",
        shouldTranslate = true,
    },
    {
        message = "war mir zu zweit zu gefärhlich",
        description = "Has typo 'gefärhlich' instead of 'gefährlich' (dangerous)",
        shouldTranslate = true,
        expectedWords = {"dangerous"},
    },
    {
        message = "wär dabei",
        description = "Common colloquial phrase 'would be in/would join'",
        shouldTranslate = true,
        expectedWords = {"would", "in"},
    },
}

print("=" .. string.rep("=", 80))
print("Testing Guild Chat Messages")
print("=" .. string.rep("=", 80))
print()

local passed = 0
local failed = 0

for i, test in ipairs(testCases) do
    print(string.format("[Test %d] %s", i, test.description))
    print(string.format("  Message: '%s'", test.message))
    
    local translated, confidence, intent = WDTS_Engine.Translate(test.message, nil, "en", true)
    
    local success = false
    local reason = ""
    
    if test.shouldTranslate then
        if translated and confidence > 0 then
            success = true
            print(string.format("  ✓ Translated: '%s' (conf: %.2f)", translated, confidence))
            
            -- Check if expected words appear in translation
            if test.expectedWords then
                local transLower = translated:lower()
                local missingWords = {}
                for _, word in ipairs(test.expectedWords) do
                    if not transLower:find(word:lower(), 1, true) then
                        table.insert(missingWords, word)
                    end
                end
                if #missingWords > 0 then
                    success = false
                    reason = string.format("Missing expected words: %s", table.concat(missingWords, ", "))
                    print(string.format("  ✗ %s", reason))
                else
                    print(string.format("  ✓ All expected words found"))
                end
            end
        else
            reason = string.format("Should translate but didn't (conf: %.2f, intent: %s)", confidence or 0, intent or "nil")
            print(string.format("  ✗ %s", reason))
        end
    else
        -- Should NOT translate
        if not translated or confidence == 0 then
            success = true
            print(string.format("  ✓ Correctly skipped (intent: %s)", intent or "nil"))
        else
            reason = string.format("Should not translate but got: '%s'", translated)
            print(string.format("  ✗ %s", reason))
        end
    end
    
    if success then
        passed = passed + 1
    else
        failed = failed + 1
    end
    
    print()
end

print("=" .. string.rep("=", 80))
print(string.format("Results: %d passed, %d failed", passed, failed))
print("=" .. string.rep("=", 80))

-- Check for missing vocabulary
print("\nChecking for missing vocabulary...")
local langPack = WDTS_Engine.LoadLanguagePack("de")
local missingWords = {}
local wordsToCheck = {
    "söldner", "söldnerquest", "gearde", "gefärhlich", "wär", "dabei"
}

for _, word in ipairs(wordsToCheck) do
    if not langPack.tokens[word] and not langPack.tokens[word:lower()] then
        table.insert(missingWords, word)
    end
end

if #missingWords > 0 then
    print(string.format("Missing vocabulary: %s", table.concat(missingWords, ", ")))
else
    print("All vocabulary found (or handled via fuzzy matching)")
end

if failed > 0 then
    os.exit(1)
end

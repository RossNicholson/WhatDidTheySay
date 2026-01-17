-- Test file for German guild chat messages (real-world examples)
-- Based on actual WoW Classic German guild chat logs

local function testTranslation()
    local testCount = 0
    local passCount = 0
    local failCount = 0
    local failures = {}
    
    -- Test cases from real German guild chat
    local tests = {
        -- Goodbye/Night messages
        {de = "gn8 all", expect = "good night all", category = "Greetings/Goodbye"},
        {de = "gn8", expect = "good night", category = "Greetings/Goodbye"},
        {de = "bin mal off", expect = "i'm logging off", category = "Status"},
        
        -- Conversational phrases
        {de = "eigtl jmd", expect = "actually someone", category = "Conversation"},
        {de = "so ein Bullshit", expect = "such bullshit", category = "Expression"},
        {de = "ne absolut kein bullshit", expect = "no absolutely no bullshit", category = "Expression"},
        {de = "bin da ganz bei aspirini", expect = "i'm completely with aspirini on that", category = "Agreement"},
        {de = ":)", expect = ":)", category = "Emoticon"},
        
        -- Game-specific terms (should mostly pass through)
        {de = "TBC Talente", expect = "tbc talents", category = "Game Terms"},
        {de = "shadow priests", expect = "shadow priests", category = "Game Terms"},
        {de = "10er Taschen", expect = "10-slot bags", category = "Items"},
        {de = "nen bag", expect = "a bag", category = "Items"},
        {de = "Leveln", expect = "leveling", category = "Game Terms"},
        {de = "theorycraft", expect = "theorycraft", category = "Game Terms"},
        {de = "mindcontrol", expect = "mindcontrol", category = "Game Terms"},
        
        -- Item names (bracketed items)
        {de = "[Großer grüner Sack]", expect = "[Large green bag]", category = "Items"},
        {de = "[Großer roter Sack]", expect = "[Large red bag]", category = "Items"},
        
        -- Expansion references
        {de = "Classic", expect = "Classic", category = "Game Terms"},
        {de = "WOD", expect = "WOD", category = "Game Terms"},
        {de = "BFA", expect = "BFA", category = "Game Terms"},
        {de = "Naxx", expect = "Naxx", category = "Dungeon"},
        {de = "Patchwerk", expect = "Patchwerk", category = "Boss"},
        {de = "DPS", expect = "DPS", category = "Role"},
        {de = "BC", expect = "BC", category = "Game Terms"},
        {de = "WotLK", expect = "WotLK", category = "Game Terms"},
        {de = "AQ", expect = "AQ", category = "Dungeon"},
        {de = "Razu", expect = "Razu", category = "Boss/Zone"},
    }
    
    -- Initialize engine
    local Engine = WDTS_Engine
    Engine.Initialize()
    Engine.ClearCache()
    
    print("=================================================================================")
    print("Testing German Guild Chat Messages (Real-World Examples)")
    print("=================================================================================")
    print("")
    
    -- Group tests by category
    local categories = {}
    for _, test in ipairs(tests) do
        if not categories[test.category] then
            categories[test.category] = {}
        end
        table.insert(categories[test.category], test)
    end
    
    -- Run tests by category
    for category, categoryTests in pairs(categories) do
        print(string.format("=== Category: %s ===", category))
        for _, test in ipairs(categoryTests) do
            testCount = testCount + 1
            local translated, confidence, intent = Engine.Translate(test.de, "de", "en", true)
            local normalizedTranslated = translated and translated:lower():gsub("[%p]+", "") or ""
            local normalizedExpected = test.expect:lower():gsub("[%p]+", "")
            local passed = false
            
            -- Flexible matching: check if expected words are present
            if translated then
                -- First, check for exact match (case-insensitive)
                if translated:lower() == test.expect:lower() then
                    passed = true
                else
                    -- Then check if all expected words are present
                    local expectedWords = {}
                    for word in test.expect:lower():gmatch("%S+") do
                        word = word:gsub("[%p]+", "")
                        if #word > 0 then
                            table.insert(expectedWords, word)
                        end
                    end
                    
                    local allWordsFound = true
                    for _, word in ipairs(expectedWords) do
                        if not translated:lower():find(word:lower(), 1, true) then
                            allWordsFound = false
                            break
                        end
                    end
                    
                    passed = allWordsFound
                end
            end
            
            if passed then
                passCount = passCount + 1
                print(string.format("✓ '%s' → '%s'", test.de, translated or "NO TRANSLATION"))
            else
                failCount = failCount + 1
                table.insert(failures, {
                    category = test.category,
                    german = test.de,
                    expected = test.expect,
                    got = translated or "NO TRANSLATION",
                    confidence = confidence or 0,
                    intent = intent or "unknown"
                })
                print(string.format("✗ '%s' → '%s' (expected: '%s')", test.de, translated or "NO TRANSLATION", test.expect))
            end
        end
        print("")
    end
    
    print("=================================================================================")
    if failCount > 0 then
        print("=== FAILED TESTS ===")
        print("")
        for i, failure in ipairs(failures) do
            print(string.format("%d. %s", i, failure.category))
            print(string.format("   German: '%s'", failure.german))
            print(string.format("   Expected: '%s'", failure.expected))
            print(string.format("   Got: '%s'", failure.got))
            print(string.format("   Confidence: %.2f, Intent: %s", failure.confidence or 0, failure.intent or "unknown"))
            print("")
        end
    end
    
    print(string.format("Results: %d passed, %d failed", passCount, failCount))
    print(string.format("Pass rate: %.1f%%", (passCount / testCount) * 100))
    print("=================================================================================")
end

-- Load dependencies and run tests
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

-- Initialize globals
_G = _G or {}
_G.WhatDidTheySayDB = {
    enabledLanguages = { de = true },
    autoTranslate = true,
    channels = {},
}
_G.GetTime = function() return os.time() end
_G.GetChannelList = function() return end
_G.IsInRaid = function() return false end
_G.select = select

-- Load core modules
loadFile("Core/Utils.lua")
loadFile("Core/Tokenizer.lua")
loadFile("Core/LanguageDetect.lua")
loadFile("Core/Confidence.lua")
loadFile("Core/LanguagePackManager.lua")
loadFile("Core/Engine.lua")

-- Load German language pack
loadFile("Languages/de/metadata.lua")
loadFile("Languages/de/tokens.lua")
loadFile("Languages/de/intents.lua")
loadFile("Languages/de/patterns.lua")
loadFile("Languages/de/grammar.lua")
loadFile("Languages/de/phrases.lua")

-- Run tests
testTranslation()

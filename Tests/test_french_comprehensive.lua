-- Comprehensive French Translation Tests
-- Tests basic vocabulary, phrases, patterns, and grammar

-- Mock WoW API
_G = _G or {}
_G.WhatDidTheySayDB = {
    enabledLanguages = { fr = true },
    autoTranslate = true,
    channels = {},
}

_G.GetTime = function() return os.time() end
_G.GetChannelList = function() return end
_G.IsInRaid = function() return false end
_G.select = select

-- Load files
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

-- Load in order
loadFile("Core/Utils.lua")
loadFile("Core/Tokenizer.lua")
loadFile("Core/LanguageDetect.lua")
loadFile("Core/Confidence.lua")
loadFile("Core/LanguagePackManager.lua")
loadFile("Core/Engine.lua")
loadFile("Languages/fr/metadata.lua")
loadFile("Languages/fr/tokens.lua")
loadFile("Languages/fr/intents.lua")
loadFile("Languages/fr/patterns.lua")
loadFile("Languages/fr/grammar.lua")
loadFile("Languages/fr/phrases.lua")

local Engine = WDTS_Engine
local Tokenizer = WDTS_Tokenizer
local LanguageDetect = WDTS_LanguageDetect

-- Initialize engine
Engine.Initialize()

-- Test function
local function testTranslation(french, expectedEnglish, description)
    local tokens = Tokenizer.Tokenize(french)
    local detectedLang, langConfidence = LanguageDetect.Detect(tokens)
    
    local translated, confidence, intent = Engine.Translate(french, nil, "en", true)
    
    local success = false
    local message = ""
    
    if not translated then
        message = string.format("FAIL: No translation (confidence: %.2f, lang: %s)", 
            confidence or 0, detectedLang or "unknown")
    elseif translated:lower():find(expectedEnglish:lower(), 1, true) then
        success = true
        message = string.format("PASS: '%s' → '%s' (conf: %.2f)", 
            french, translated, confidence or 0)
    else
        message = string.format("FAIL: Expected '%s', got '%s' (conf: %.2f)", 
            expectedEnglish, translated, confidence or 0)
    end
    
    print(string.format("[%s] %s - %s", success and "✓" or "✗", description, message))
    return success
end

print("=" .. string.rep("=", 80))
print("French Translation Comprehensive Tests")
print("=" .. string.rep("=", 80))
print()

local passed = 0
local failed = 0

-- Category 1: Basic Vocabulary
print("=== Category 1: Basic Vocabulary ===")
print()

if testTranslation("bonjour", "hello", "Basic greeting") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("merci", "thanks", "Thank you") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("oui", "yes", "Yes") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("non", "no", "No") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("s'il vous plaît", "please", "Please (formal)") then passed = passed + 1 else failed = failed + 1 end

print()

-- Category 2: Common Phrases
print("=== Category 2: Common Phrases ===")
print()

if testTranslation("je suis prêt", "ready", "I'm ready") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("c'est fini", "it's done", "It's done") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("il y a", "there is", "There is") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("je ne sais pas", "I don't know", "I don't know (negation)") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("je ne peux pas", "I can't", "I can't (negation)") then passed = passed + 1 else failed = failed + 1 end

print()

-- Category 3: LFG Phrases
print("=== Category 3: LFG Phrases ===")
print()

if testTranslation("cherche groupe", "looking for group", "Looking for group") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("cherche groupe pour DM", "looking for group for", "Looking for group for dungeon") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("besoin d'un tank", "need a tank", "Need a tank") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("cherche un heal", "looking for a heal", "Looking for a heal") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("recherche membres", "looking for members", "Looking for members") then passed = passed + 1 else failed = failed + 1 end

print()

-- Category 4: Questions
print("=== Category 4: Questions ===")
print()

if testTranslation("où est", "where is", "Where is") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("comment ça va", "how are you", "How are you") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("combien ça coûte", "how much does it cost", "How much does it cost") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("peux-tu m'aider", "can you help me", "Can you help me") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("est-ce que tu veux", "do you want", "Do you want (Est-ce que)") then passed = passed + 1 else failed = failed + 1 end

print()

-- Category 5: Trading
print("=== Category 5: Trading ===")
print()

if testTranslation("à vendre", "for sale", "For sale") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("je veux acheter", "I want to buy", "I want to buy") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("vente", "selling", "Selling") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("combien pour", "how much for", "How much for") then passed = passed + 1 else failed = failed + 1 end

print()

-- Category 6: WoW-Specific Terms
print("=== Category 6: WoW-Specific Terms ===")
print()

if testTranslation("guérisseur", "healer", "Healer") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("guerrier", "warrior", "Warrior") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("donjon", "dungeon", "Dungeon") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("quête", "quest", "Quest") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("guilde", "guild", "Guild") then passed = passed + 1 else failed = failed + 1 end

print()

-- Category 7: Patterns
print("=== Category 7: Sentence Patterns ===")
print()

if testTranslation("cherche un tank pour DM", "looking for a tank for", "Looking for a tank (pattern)") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("peux-tu inviter", "can you invite", "Can you invite (pattern)") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("combien coûte", "how much does", "How much does X cost (pattern)") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("où est Ironforge", "where is", "Where is location (pattern)") then passed = passed + 1 else failed = failed + 1 end

print()

-- Category 8: Grammar (Negation)
print("=== Category 8: Grammar - Negation ===")
print()

-- Test that "ne...pas" is correctly translated to "don't/doesn't"
-- Note: These will be tested through phrase matching, but grammar rules should handle edge cases

print()

-- Category 9: Gaming Abbreviations
print("=== Category 9: Gaming Abbreviations ===")
print()

if testTranslation("lfg", "LFG", "LFG abbreviation") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("lfm", "LFM", "LFM abbreviation") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("wtb", "WTB", "WTB abbreviation") then passed = passed + 1 else failed = failed + 1 end
if testTranslation("wts", "WTS", "WTS abbreviation") then passed = passed + 1 else failed = failed + 1 end

print()

-- Results
print("=" .. string.rep("=", 80))
print(string.format("Results: %d passed, %d failed", passed, failed))
local total = passed + failed
local passRate = total > 0 and (passed / total * 100) or 0
print(string.format("Pass rate: %.1f%%", passRate))
print("=" .. string.rep("=", 80))

-- Check if translation engine is working
local langPack = Engine.LoadLanguagePack("fr")
if langPack and langPack.tokens then
    local tokenCount = 0
    for _ in pairs(langPack.tokens) do tokenCount = tokenCount + 1 end
    print(string.format("\nFrench language pack loaded: %d tokens", tokenCount))
else
    print("\nERROR: French language pack not loaded properly!")
end

if failed > 0 then
    os.exit(1)
end

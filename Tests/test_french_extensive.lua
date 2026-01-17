-- Extensive French Translation Tests
-- Tests comprehensive scenarios, edge cases, and common issues

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
Engine.ClearCache()

-- Test function with detailed output
local function testTranslation(french, expectedEnglish, description, verbose)
    verbose = verbose or false
    
    local tokens = Tokenizer.Tokenize(french)
    local detectedLang, langConfidence = LanguageDetect.Detect(tokens)
    
    local translated, confidence, intent = Engine.Translate(french, "fr", "en", true)
    
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
    
    if verbose or not success then
        print(string.format("[%s] %s - %s", success and "✓" or "✗", description, message))
        if not success and verbose then
            print(string.format("    Tokens: %d, Lang: %s (%.2f), Intent: %s", 
                #tokens, detectedLang or "unknown", langConfidence or 0, intent or "none"))
        end
    end
    
    return success, translated, confidence
end

print("=" .. string.rep("=", 80))
print("EXTENSIVE FRENCH TRANSLATION TESTS")
print("=" .. string.rep("=", 80))
print()

local passed = 0
local failed = 0
local failedTests = {}

local function runTest(french, expectedEnglish, description, verbose)
    local success, translated, confidence = testTranslation(french, expectedEnglish, description, verbose)
    if success then
        passed = passed + 1
    else
        failed = failed + 1
        table.insert(failedTests, {
            french = french,
            expected = expectedEnglish,
            got = translated or "NO TRANSLATION",
            description = description,
            confidence = confidence or 0
        })
    end
    return success
end

-- ============================================
-- CATEGORY 1: BASIC VOCABULARY & GREETINGS
-- ============================================
print("=== Category 1: Basic Vocabulary & Greetings ===")
print()

runTest("bonjour", "hello", "Basic greeting")
runTest("bonsoir", "good evening", "Good evening")
runTest("salut", "hi/bye", "Casual greeting")
runTest("merci", "thanks", "Thank you")
runTest("de rien", "you're welcome", "You're welcome")
runTest("oui", "yes", "Yes")
runTest("non", "no", "No")
runTest("s'il vous plaît", "please", "Please (formal)")
runTest("s'il te plaît", "please", "Please (informal)")
runTest("pardon", "sorry", "Sorry")

print()

-- ============================================
-- CATEGORY 2: COMMON PHRASES
-- ============================================
print("=== Category 2: Common Phrases ===")
print()

runTest("je suis prêt", "ready", "I'm ready")
runTest("c'est fini", "it's done", "It's done")
runTest("c'est fait", "it's done", "It's done")
runTest("il y a", "there is", "There is")
runTest("je ne sais pas", "I don't know", "I don't know (negation)")
runTest("je ne peux pas", "I can't", "I can't (negation)")
runTest("je ne veux pas", "I don't want", "I don't want")
runTest("tu es prêt", "you are ready", "You are ready")
runTest("on y va", "let's go", "Let's go")
runTest("c'est bon", "it's good", "It's good")

print()

-- ============================================
-- CATEGORY 3: LFG PHRASES
-- ============================================
print("=== Category 3: LFG Phrases ===")
print()

runTest("cherche groupe", "looking for group", "Looking for group")
runTest("cherche groupe pour DM", "looking for group for", "Looking for group for dungeon")
runTest("cherche un tank", "looking for a tank", "Looking for a tank")
runTest("besoin d'un tank", "need a tank", "Need a tank")
runTest("cherche un heal", "looking for a heal", "Looking for a heal")
runTest("recherche membres", "looking for members", "Looking for members")
runTest("cherche guilde", "looking for guild", "Looking for guild")
runTest("lfg DM", "lfg", "LFG abbreviation with dungeon")
runTest("lfg tank", "lfg", "LFG abbreviation with role")

print()

-- ============================================
-- CATEGORY 4: QUESTIONS
-- ============================================
print("=== Category 4: Questions ===")
print()

runTest("où est", "where is", "Where is")
runTest("où es-tu", "where are you", "Where are you")
runTest("comment ça va", "how are you", "How are you")
runTest("comment allez-vous", "how are you", "How are you (formal)")
runTest("combien ça coûte", "how much does it cost", "How much does it cost")
runTest("peux-tu m'aider", "can you help me", "Can you help me")
runTest("pouvez-vous m'aider", "can you help me", "Can you help me (formal)")
runTest("est-ce que tu veux", "do you want", "Do you want (Est-ce que)")
runTest("qu'est-ce que c'est", "what is it", "What is it")
runTest("qu'est-ce que tu fais", "what are you doing", "What are you doing")
runTest("qui est", "who is", "Who is")
runTest("pourquoi", "why", "Why")
runTest("quand", "when", "When")

print()

-- ============================================
-- CATEGORY 5: TRADING
-- ============================================
print("=== Category 5: Trading ===")
print()

runTest("à vendre", "for sale", "For sale")
runTest("je vends", "selling", "I'm selling")
runTest("j'achète", "buying", "I'm buying")
runTest("je veux acheter", "I want to buy", "I want to buy")
runTest("vente", "selling", "Selling")
runTest("achat", "buying", "Buying")
runTest("combien pour", "how much for", "How much for")
runTest("quel est le prix", "what's the price", "What's the price")
runTest("combien coûte", "how much does", "How much does X cost")

print()

-- ============================================
-- CATEGORY 6: WOW-SPECIFIC TERMS
-- ============================================
print("=== Category 6: WoW-Specific Terms ===")
print()

runTest("guérisseur", "healer", "Healer")
runTest("tank", "tank", "Tank")
runTest("guerrier", "warrior", "Warrior")
runTest("donjon", "dungeon", "Dungeon")
runTest("quête", "quest", "Quest")
runTest("guilde", "guild", "Guild")
runTest("raid", "raid", "Raid")
runTest("instance", "instance", "Instance")

print()

-- ============================================
-- CATEGORY 7: SENTENCE PATTERNS
-- ============================================
print("=== Category 7: Sentence Patterns ===")
print()

runTest("cherche un tank pour DM", "looking for a tank for", "Looking for a tank (pattern)")
runTest("peux-tu inviter", "can you invite", "Can you invite (pattern)")
runTest("combien coûte X", "how much does", "How much does X cost (pattern)")
runTest("où est Ironforge", "where is", "Where is location (pattern)")
runTest("je cherche un groupe", "I'm looking for", "I'm looking for (pattern)")
runTest("j'ai besoin de", "I need", "I need (pattern)")
runTest("je vais faire", "I will do", "I will do (future tense)")
runTest("je suis allé", "I went", "I went (past tense)")
runTest("je peux faire", "I can do", "I can do (modal)")

print()

-- ============================================
-- CATEGORY 8: GRAMMAR - NEGATION
-- ============================================
print("=== Category 8: Grammar - Negation ===")
print()

runTest("je ne sais pas", "I don't know", "I don't know (ne...pas)")
runTest("je ne peux pas", "I can't", "I can't (ne...pas)")
runTest("je ne veux pas", "I don't want", "I don't want (ne...pas)")
runTest("je ne fais pas", "I don't do", "I don't do (ne...pas)")
runTest("je ne suis pas", "I am not", "I am not (ne...pas)")
runTest("tu ne peux pas", "you can't", "You can't (ne...pas)")
runTest("il ne peut pas", "he can't", "He can't (ne...pas)")

print()

-- ============================================
-- CATEGORY 9: GAMING ABBREVIATIONS
-- ============================================
print("=== Category 9: Gaming Abbreviations ===")
print()

runTest("lfg", "LFG", "LFG abbreviation")
runTest("lfm", "LFM", "LFM abbreviation")
runTest("wtb", "WTB", "WTB abbreviation")
runTest("wts", "WTS", "WTS abbreviation")
runTest("wtt", "WTT", "WTT abbreviation")
runTest("brb", "brb", "BRB abbreviation")
runTest("afk", "afk", "AFK abbreviation")
runTest("omw", "omw", "OMW abbreviation")
runTest("rdy", "rdy", "Ready abbreviation")

print()

-- ============================================
-- CATEGORY 10: TIME & TEMPORAL PHRASES
-- ============================================
print("=== Category 10: Time & Temporal Phrases ===")
print()

runTest("maintenant", "now", "Now")
runTest("tout de suite", "right now", "Right now")
runTest("bientôt", "soon", "Soon")
runTest("plus tard", "later", "Later")
runTest("demain", "tomorrow", "Tomorrow")
runTest("aujourd'hui", "today", "Today")
runTest("hier", "yesterday", "Yesterday")
runTest("dans une heure", "in one hour", "In one hour")
runTest("dans une minute", "in one minute", "In one minute")
runTest("j'arrive dans 5 minutes", "coming in 5 minutes", "Coming in minutes")

print()

-- ============================================
-- CATEGORY 11: COMBAT & GROUP COORDINATION
-- ============================================
print("=== Category 11: Combat & Group Coordination ===")
print()

runTest("soins s'il te plaît", "healing please", "Healing please")
runTest("ressusciter s'il te plaît", "resurrect please", "Resurrect please")
runTest("je passe", "I pass", "I pass")
runTest("attention ici", "careful here", "Careful here")
runTest("reculons", "retreat", "Retreat")
runTest("interrompez le sort", "interrupt the spell", "Interrupt the spell")
runTest("protection sur moi", "protection on me", "Protection on me")
runTest("gros soin arrive", "big heal coming", "Big heal coming")

print()

-- ============================================
-- CATEGORY 12: STATUS & AVAILABILITY
-- ============================================
print("=== Category 12: Status & Availability ===")
print()

runTest("prêt", "ready", "Ready")
runTest("je suis prêt", "I'm ready", "I'm ready")
runTest("c'est prêt", "is ready", "Is ready")
runTest("presque prêt", "almost ready", "Almost ready")
runTest("j'arrive", "coming", "Coming")
runTest("je reviens", "coming back", "Coming back")
runTest("je suis là", "I'm here", "I'm here")
runTest("je suis occupé", "I'm busy", "I'm busy")

print()

-- ============================================
-- CATEGORY 13: MODAL VERBS
-- ============================================
print("=== Category 13: Modal Verbs ===")
print()

runTest("je peux", "I can", "I can")
runTest("tu peux", "you can", "You can")
runTest("je veux", "I want", "I want")
runTest("tu veux", "you want", "You want")
runTest("je dois", "I must", "I must")
runTest("tu dois", "you must", "You must")
runTest("je peux faire", "I can do", "I can do")
runTest("tu veux venir", "you want to come", "You want to come")
runTest("je dois aller", "I must go", "I must go")

print()

-- ============================================
-- CATEGORY 14: QUESTIONS WITH MODALS
-- ============================================
print("=== Category 14: Questions with Modals ===")
print()

runTest("peux-tu faire", "can you do", "Can you do")
runTest("peux-tu venir", "can you come", "Can you come")
runTest("peux-tu m'aider", "can you help me", "Can you help me")
runTest("peux-tu me donner", "can you give me", "Can you give me")
runTest("veux-tu faire", "do you want to do", "Do you want to do")
runTest("veux-tu venir", "do you want to come", "Do you want to come")
runTest("pouvez-vous m'aider", "can you help me", "Can you help me (formal)")

print()

-- ============================================
-- CATEGORY 15: COMPLEX SENTENCES
-- ============================================
print("=== Category 15: Complex Sentences ===")
print()

runTest("je sais que", "I know that", "I know that")
runTest("je crois que", "I believe that", "I believe that")
runTest("je pense que", "I think that", "I think that")
runTest("je dis que", "I say that", "I say that")
runTest("j'ai dit que", "I said that", "I said that")
runTest("parce que", "because", "Because")
runTest("si tu veux", "if you want", "If you want")
runTest("quand tu es prêt", "when you are ready", "When you are ready")

print()

-- ============================================
-- CATEGORY 16: IMPERATIVE COMMANDS
-- ============================================
print("=== Category 16: Imperative Commands ===")
print()

runTest("viens ici", "come here", "Come here")
runTest("fais ça", "do that", "Do that")
runTest("attends", "wait", "Wait")
runTest("aide-moi", "help me", "Help me")
runTest("donne-moi", "give me", "Give me")
runTest("montre-moi", "show me", "Show me")
runTest("suis-moi", "follow me", "Follow me")
runTest("vas-y", "go", "Go")

print()

-- ============================================
-- CATEGORY 17: COMMON EXPRESSIONS
-- ============================================
print("=== Category 17: Common Expressions ===")
print()

runTest("c'est bon", "it's good", "It's good")
runTest("c'est ok", "it's ok", "It's ok")
runTest("peu importe", "doesn't matter", "Doesn't matter")
runTest("d'accord", "okay", "Okay")
runTest("bien sûr", "of course", "Of course")
runTest("vraiment", "really", "Really")
runTest("sérieusement", "seriously", "Seriously")
runTest("merci beaucoup", "thanks a lot", "Thanks a lot")

print()

-- ============================================
-- RESULTS
-- ============================================
print("=" .. string.rep("=", 80))
print(string.format("Results: %d passed, %d failed", passed, failed))
local total = passed + failed
local passRate = total > 0 and (passed / total * 100) or 0
print(string.format("Pass rate: %.1f%%", passRate))
print("=" .. string.rep("=", 80))

if failed > 0 then
    print()
    print("=== FAILED TESTS ===")
    print()
    for i, test in ipairs(failedTests) do
        print(string.format("%d. %s", i, test.description))
        print(string.format("   French: '%s'", test.french))
        print(string.format("   Expected: '%s'", test.expected))
        print(string.format("   Got: '%s'", test.got))
        print(string.format("   Confidence: %.2f", test.confidence))
        print()
    end
end

-- Check language pack status
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

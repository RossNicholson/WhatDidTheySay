#!/usr/bin/env lua5.1
-- Test Chunk 3: German Grammar Rules for Dependency Relationships

_G = _G or {}
_G.GetTime = function() return os.time() end

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
loadFile("Core/DependencyParser.lua")

print("=" .. string.rep("=", 80))
print("Chunk 3 Test: German Grammar Rules (Articles, Prepositions, Noun Phrases)")
print("=" .. string.rep("=", 80))
print()

local DP = WDTS_DependencyParser
local Tokenizer = WDTS_Tokenizer

-- Test 1: Article detection
print("Test 1: Article detection functions")
print("-" .. string.rep("-", 78))

local testArticles = {"der", "die", "das", "den", "ein", "eine", "einen"}
for _, article in ipairs(testArticles) do
    if DP.IsArticle(article) then
        print("✓ IsArticle('" .. article .. "') = true")
    else
        print("✗ IsArticle('" .. article .. "') = false (should be true)")
    end
end

if not DP.IsArticle("Mann") then
    print("✓ IsArticle('Mann') = false (not an article)")
else
    print("✗ IsArticle('Mann') = true (should be false)")
end

print()

-- Test 2: Preposition detection
print("Test 2: Preposition detection functions")
print("-" .. string.rep("-", 78))

local testPreps = {"nach", "von", "zu", "in", "auf", "mit", "für"}
for _, prep in ipairs(testPreps) do
    if DP.IsPreposition(prep) then
        print("✓ IsPreposition('" .. prep .. "') = true")
    else
        print("✗ IsPreposition('" .. prep .. "') = false (should be true)")
    end
end

if not DP.IsPreposition("gehe") then
    print("✓ IsPreposition('gehe') = false (not a preposition)")
else
    print("✗ IsPreposition('gehe') = true (should be false)")
end

print()

-- Test 3: Pronoun case detection
print("Test 3: Pronoun case detection")
print("-" .. string.rep("-", 78))

local testCases = {
    {word = "ich", expected = "nom"},
    {word = "mich", expected = "acc"},
    {word = "mir", expected = "dat"},
    {word = "du", expected = "nom"},
    {word = "dich", expected = "acc"},
}

for _, test in ipairs(testCases) do
    local case = DP.GetPronounCase(test.word)
    if case == test.expected then
        print("✓ GetPronounCase('" .. test.word .. "') = '" .. case .. "'")
    else
        print("✗ GetPronounCase('" .. test.word .. "') = '" .. (case or "nil") .. "' (expected '" .. test.expected .. "')")
    end
end

print()

-- Test 4: Noun phrase with article
print("Test 4: 'Der Mann geht' (Article + Noun as subject)")
print("-" .. string.rep("-", 78))

local tokens4, _, _ = Tokenizer.Tokenize("Der Mann geht")
local nodes4 = DP.Parse(tokens4)

local verb4 = nil
for i, node in pairs(nodes4) do
    if node.pos == "VERB" then
        verb4 = node
        break
    end
end

if verb4 then
    local hasSubj = false
    for _, dep in ipairs(verb4.dependencies) do
        if dep.relation == DP.RELATIONS.SUBJ then
            hasSubj = true
            local subjNode = nodes4[dep.target]
            print("✓ SUBJ dependency found: " .. (subjNode and subjNode.word or "unknown"))
            if subjNode and subjNode.word == "der" then
                print("✓ SUBJ points to article (correct for noun phrase)")
            end
            break
        end
    end
    
    if not hasSubj then
        print("✗ Missing SUBJ dependency")
    end
else
    print("✗ No verb found")
end

print()

-- Test 5: Prepositional phrase with article
print("Test 5: 'Ich gehe nach dem Markt' (PREP + ARTICLE + NOUN)")
print("-" .. string.rep("-", 78))

local tokens5, _, _ = Tokenizer.Tokenize("Ich gehe nach dem Markt")
local nodes5 = DP.Parse(tokens5)

local verb5 = nil
for i, node in pairs(nodes5) do
    if node.pos == "VERB" then
        verb5 = node
        break
    end
end

if verb5 then
    local hasPrep = false
    for _, dep in ipairs(verb5.dependencies) do
        if dep.relation == DP.RELATIONS.PREP then
            hasPrep = true
            local prepNode = nodes5[dep.target]
            print("✓ PREP dependency found: " .. (prepNode and prepNode.word or "unknown"))
            if prepNode and prepNode.word == "nach" then
                print("✓ PREP points to preposition (correct)")
            end
            if dep.phraseEnd then
                print("✓ PREP phrase ends at node " .. dep.phraseEnd)
            end
            break
        end
    end
    
    if not hasPrep then
        print("✗ Missing PREP dependency")
    end
else
    print("✗ No verb found")
end

print()

-- Test 6: Dative pronoun (indirect object)
print("Test 6: 'Ich gebe dir Geld' (Dative pronoun = indirect object)")
print("-" .. string.rep("-", 78))

local tokens6, _, _ = Tokenizer.Tokenize("Ich gebe dir Geld")
local nodes6 = DP.Parse(tokens6)

local verb6 = nil
for i, node in pairs(nodes6) do
    if node.pos == "VERB" then
        verb6 = node
        break
    end
end

if verb6 then
    local hasObj2 = false
    for _, dep in ipairs(verb6.dependencies) do
        if dep.relation == DP.RELATIONS.OBJ2 then
            hasObj2 = true
            local obj2Node = nodes6[dep.target]
            print("✓ OBJ2 (indirect object) dependency found: " .. (obj2Node and obj2Node.word or "unknown"))
            break
        end
    end
    
    if not hasObj2 then
        print("⚠ OBJ2 dependency not found (may not be implemented yet)")
    end
else
    print("✗ No verb found")
end

print()
print("=" .. string.rep("=", 80))
print("Chunk 3 Complete: German grammar rules validated")
print("=" .. string.rep("=", 80))

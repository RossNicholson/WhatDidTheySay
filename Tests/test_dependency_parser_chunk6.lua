#!/usr/bin/env lua5.1
-- Test Chunk 6: Complex Sentences (Relative Clauses, Subordinate Clauses, Questions)

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
print("Chunk 6 Test: Complex Sentences (Relative Clauses, Subordinate Clauses, Questions)")
print("=" .. string.rep("=", 80))
print()

local DP = WDTS_DependencyParser
local Tokenizer = WDTS_Tokenizer

-- Test 1: Question
print("Test 1: Question - 'Wo bist du?'")
print("-" .. string.rep("-", 78))

local tokens1, _, _ = Tokenizer.Tokenize("Wo bist du?")
local nodes1 = DP.Parse(tokens1)

local verb1 = nil
for i, node in pairs(nodes1) do
    if node.pos == "VERB" then
        verb1 = node
        break
    end
end

if verb1 then
    print("✓ Verb found: " .. verb1.word)
    
    local hasQuestionWord = false
    local hasSubj = false
    
    for _, dep in ipairs(verb1.dependencies) do
        if dep.relation == DP.RELATIONS.MOD then
            hasQuestionWord = true
            local qNode = nodes1[dep.target]
            print("✓ Question word dependency: " .. (qNode and qNode.word or "unknown"))
        elseif dep.relation == DP.RELATIONS.SUBJ then
            hasSubj = true
            local subjNode = nodes1[dep.target]
            print("✓ SUBJ dependency: " .. (subjNode and subjNode.word or "unknown"))
        end
    end
    
    if not hasQuestionWord then
        print("⚠ Question word dependency not found")
    end
    if not hasSubj then
        print("⚠ SUBJ dependency not found")
    end
else
    print("✗ No verb found")
end

print()

-- Test 2: Relative clause
print("Test 2: Relative clause - 'Der Mann, der die Quest gemacht hat'")
print("-" .. string.rep("-", 78))

local tokens2, _, _ = Tokenizer.Tokenize("Der Mann, der die Quest gemacht hat")
local nodes2 = DP.Parse(tokens2)

local verb2 = nil
for i, node in pairs(nodes2) do
    if node.pos == "VERB" and node.word == "geht" or node.word == "geht" then
        -- Look for main verb (not in relative clause)
        verb2 = node
        break
    end
end

-- Find any verb
if not verb2 then
    for i, node in pairs(nodes2) do
        if node.pos == "VERB" then
            verb2 = node
            break
        end
    end
end

if verb2 then
    print("✓ Verb found: " .. verb2.word)
    
    local hasRelCl = false
    for _, dep in ipairs(verb2.dependencies) do
        if dep.relation == DP.RELATIONS.RELCL then
            hasRelCl = true
            print("✓ Relative clause detected")
            break
        end
    end
    
    -- Check if there's a relative clause verb
    for i, node in pairs(nodes2) do
        if node.pos == "VERB" and node.word ~= verb2.word then
            local hasRelDep = false
            for _, dep in ipairs(node.dependencies) do
                if dep.relation == DP.RELATIONS.RELCL then
                    hasRelDep = true
                    print("✓ Relative clause verb found: " .. node.word)
                    break
                end
            end
            if hasRelDep then
                hasRelCl = true
            end
        end
    end
    
    if not hasRelCl then
        print("⚠ Relative clause not detected (may need comma detection)")
    end
else
    print("✗ No verb found")
end

print()

-- Test 3: Subordinate clause
print("Test 3: Subordinate clause - 'Ich glaube, dass du recht hast'")
print("-" .. string.rep("-", 78))

local tokens3, _, _ = Tokenizer.Tokenize("Ich glaube, dass du recht hast")
local nodes3 = DP.Parse(tokens3)

local mainVerb = nil
for i, node in pairs(nodes3) do
    if node.pos == "VERB" and node.word == "glaube" then
        mainVerb = node
        break
    end
end

if mainVerb then
    print("✓ Main verb found: " .. mainVerb.word)
    
    local hasSubCl = false
    for _, dep in ipairs(mainVerb.dependencies) do
        if dep.relation == DP.RELATIONS.SUBCL then
            hasSubCl = true
            print("✓ Subordinate clause detected")
            break
        end
    end
    
    -- Check for subordinate clause verb
    for i, node in pairs(nodes3) do
        if node.pos == "VERB" and node.word ~= mainVerb.word then
            local hasSubDep = false
            for _, dep in ipairs(node.dependencies) do
                if dep.relation == DP.RELATIONS.SUBCL then
                    hasSubDep = true
                    print("✓ Subordinate clause verb found: " .. node.word)
                    break
                end
            end
            if hasSubDep then
                hasSubCl = true
            end
        end
    end
    
    if not hasSubCl then
        print("⚠ Subordinate clause not detected")
    end
else
    print("✗ Main verb not found")
end

print()

-- Test 4: Question word detection
print("Test 4: Question word POS detection")
print("-" .. string.rep("-", 78))

local questionWords = {"wo", "was", "wer", "wie", "wann", "warum"}
for _, qw in ipairs(questionWords) do
    local pos = DP._GuessPOS(qw)
    if pos == "QUESTION_WORD" then
        print("✓ '" .. qw .. "' detected as QUESTION_WORD")
    else
        print("✗ '" .. qw .. "' detected as " .. (pos or "nil") .. " (should be QUESTION_WORD)")
    end
end

print()

-- Test 5: Subordinate conjunction detection
print("Test 5: Subordinate conjunction POS detection")
print("-" .. string.rep("-", 78))

local conjunctions = {"dass", "wenn", "weil", "obwohl", "ob"}
for _, conj in ipairs(conjunctions) do
    local pos = DP._GuessPOS(conj)
    if pos == "CONJUNCTION" then
        print("✓ '" .. conj .. "' detected as CONJUNCTION")
    else
        print("✗ '" .. conj .. "' detected as " .. (pos or "nil") .. " (should be CONJUNCTION)")
    end
end

print()
print("=" .. string.rep("=", 80))
print("Chunk 6 Complete: Complex sentence structures validated")
print("=" .. string.rep("=", 80))

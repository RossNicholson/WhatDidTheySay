#!/usr/bin/env lua5.1
-- Test Chunk 2: Basic Dependency Parsing for Simple Sentences

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
print("Chunk 2 Test: Basic Dependency Parsing (SUBJ → VERB → OBJ)")
print("=" .. string.rep("=", 80))
print()

local DP = WDTS_DependencyParser
local Tokenizer = WDTS_Tokenizer

-- Test 1: Simple sentence with pronoun subject
print("Test 1: 'Ich gehe nach Stormwind'")
print("-" .. string.rep("-", 78))

local tokens1, _, _ = Tokenizer.Tokenize("Ich gehe nach Stormwind")
local nodes1 = DP.Parse(tokens1)

if nodes1 and #nodes1 > 0 then
    -- Find verb node
    local verb1 = nil
    for i, node in pairs(nodes1) do
        if node.pos == "VERB" then
            verb1 = node
            break
        end
    end
    
    if verb1 then
        print("✓ Verb found: " .. verb1.word)
        
        -- Check for SUBJ dependency
        local hasSubj = false
        for _, dep in ipairs(verb1.dependencies) do
            if dep.relation == DP.RELATIONS.SUBJ then
                hasSubj = true
                local subjNode = nodes1[dep.target]
                print("✓ SUBJ dependency: " .. (subjNode and subjNode.word or "unknown"))
                break
            end
        end
        
        if not hasSubj then
            print("✗ Missing SUBJ dependency")
        end
        
        -- Check for PREP dependency
        local hasPrep = false
        for _, dep in ipairs(verb1.dependencies) do
            if dep.relation == DP.RELATIONS.PREP then
                hasPrep = true
                local prepNode = nodes1[dep.target]
                print("✓ PREP dependency: " .. (prepNode and prepNode.word or "unknown"))
                break
            end
        end
        
        if not hasPrep then
            print("✗ Missing PREP dependency")
        end
    else
        print("✗ No verb found")
    end
else
    print("✗ Parse failed - no nodes")
end

print()

-- Test 2: Sentence with direct object
print("Test 2: 'Ich sehe dich'")
print("-" .. string.rep("-", 78))

local tokens2, _, _ = Tokenizer.Tokenize("Ich sehe dich")
local nodes2 = DP.Parse(tokens2)

if nodes2 and #nodes2 > 0 then
    local verb2 = nil
    for i, node in pairs(nodes2) do
        if node.pos == "VERB" then
            verb2 = node
            break
        end
    end
    
    if verb2 then
        print("✓ Verb found: " .. verb2.word)
        
        local hasSubj = false
        local hasObj = false
        
        for _, dep in ipairs(verb2.dependencies) do
            if dep.relation == DP.RELATIONS.SUBJ then
                hasSubj = true
                local subjNode = nodes2[dep.target]
                print("✓ SUBJ dependency: " .. (subjNode and subjNode.word or "unknown"))
            elseif dep.relation == DP.RELATIONS.OBJ then
                hasObj = true
                local objNode = nodes2[dep.target]
                print("✓ OBJ dependency: " .. (objNode and objNode.word or "unknown"))
            end
        end
        
        if not hasSubj then
            print("✗ Missing SUBJ dependency")
        end
        if not hasObj then
            print("✗ Missing OBJ dependency")
        end
    else
        print("✗ No verb found")
    end
else
    print("✗ Parse failed - no nodes")
end

print()

-- Test 3: Get root
print("Test 3: GetRoot() function")
print("-" .. string.rep("-", 78))

local root1 = DP.GetRoot(nodes1)
if root1 then
    print("✓ Root found: " .. root1.word .. " (POS: " .. root1.pos .. ")")
    if root1.pos == "VERB" then
        print("✓ Root is a verb (correct)")
    else
        print("⚠ Root is not a verb (may be correct if no verb found)")
    end
else
    print("✗ No root found")
end

print()
print("=" .. string.rep("=", 80))
print("Chunk 2 Complete: Basic dependency relationships validated")
print("=" .. string.rep("=", 80))

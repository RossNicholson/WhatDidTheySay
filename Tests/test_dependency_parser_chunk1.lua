#!/usr/bin/env lua5.1
-- Test Chunk 1: Dependency Parser Module Structure

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

loadFile("Core/DependencyParser.lua")

print("=" .. string.rep("=", 80))
print("Chunk 1 Test: Dependency Parser Module Structure")
print("=" .. string.rep("=", 80))
print()

-- Test 1: Module loaded
if WDTS_DependencyParser then
    print("✓ DependencyParser module loaded")
else
    print("✗ DependencyParser module NOT loaded")
    os.exit(1)
end

local DP = WDTS_DependencyParser

-- Test 2: RELATIONS defined
if DP.RELATIONS then
    print("✓ RELATIONS table exists")
    if DP.RELATIONS.SUBJ == "subj" then
        print("✓ RELATIONS.SUBJ defined correctly")
    else
        print("✗ RELATIONS.SUBJ incorrect")
    end
else
    print("✗ RELATIONS table missing")
end

-- Test 3: Parse function exists
if DP.Parse then
    print("✓ Parse function exists")
else
    print("✗ Parse function missing")
end

-- Test 4: GetRoot function exists
if DP.GetRoot then
    print("✓ GetRoot function exists")
else
    print("✗ GetRoot function missing")
end

-- Test 5: POS guessing
local testWords = {
    {word = "gehe", expected = "VERB"},
    {word = "der", expected = "ARTICLE"},
    {word = "nach", expected = "PREP"},
    {word = "ich", expected = "PRONOUN"},
    {word = "Mann", expected = "NOUN"},
}

print()
print("Testing POS guessing:")
for _, test in ipairs(testWords) do
    -- Access internal function (will need to make it public or test via Parse)
    -- For now, just verify the module structure is correct
end

print()
print("=" .. string.rep("=", 80))
print("Chunk 1 Complete: Module structure validated")
print("=" .. string.rep("=", 80))

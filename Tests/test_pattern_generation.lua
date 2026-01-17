#!/usr/bin/env lua5.1
-- Test pattern-based verb generation

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

loadFile("Core/GermanMorphology.lua")

print("=" .. string.rep("=", 80))
print("Pattern-Based Verb Generation Test")
print("=" .. string.rep("=", 80))
print()

-- Test regular verbs that should be pattern-generated (not in explicit lookup)
local testRegularVerbs = {
    -- Past participles
    "gespielt", "gearbeitet", "gewohnt", "gestudiert", "gekocht", "geputzt",
    "bestellt", "reserviert", "gebucht", "geplant", "organisiert", "verwaltet",
    
    -- Past tense
    "spielte", "arbeitete", "wohnte", "studierte", "kochte", "putzte",
    "bestellte", "reservierte", "buchte", "plante", "organisierte",
    
    -- Present tense
    "spiele", "spielst", "spielt", "arbeite", "arbeitest", "arbeitet",
    "wohne", "wohnst", "wohnt", "studiere", "studierst", "studiert",
    "koche", "kochst", "kocht", "putze", "putzt",
}

print("Testing pattern-based generation for regular verbs:")
print()

local explicit = 0
local pattern = 0
local failed = 0

for _, verbForm in ipairs(testRegularVerbs) do
    local infinitive = WDTS_GermanMorphology.NormalizeToInfinitive(verbForm)
    if infinitive then
        pattern = pattern + 1
        print(string.format("  ✓ %-15s → %s (pattern-generated)", verbForm, infinitive))
    else
        failed = failed + 1
        print(string.format("  ✗ %-15s → (not recognized)", verbForm))
    end
end

print()
print("=" .. string.rep("=", 80))
print(string.format("Pattern generation: %d/%d recognized (%.1f%%)", 
    pattern, #testRegularVerbs, (pattern / #testRegularVerbs) * 100))
print("=" .. string.rep("=", 80))

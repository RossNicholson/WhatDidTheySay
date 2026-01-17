#!/usr/bin/env lua5.1
-- Test expanded verb conjugation lookup

-- Mock WoW API
_G = _G or {}
_G.GetTime = function() return os.time() end

-- Load GermanMorphology
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
print("Verb Conjugation Expansion Test")
print("=" .. string.rep("=", 80))
print()

local testVerbs = {
    -- Modal verbs
    "kann", "kannst", "konnte", "muss", "musst", "musste", "soll", "sollst", "sollte",
    "will", "willst", "wollte", "darf", "darfst", "durfte", "mag", "magst", "möchte",
    
    -- sein/haben
    "bin", "bist", "ist", "sind", "war", "warst", "waren",
    "habe", "hast", "hat", "habt", "hatte", "hatten",
    
    -- Common verbs
    "komme", "kommst", "kommt", "kam", "kamen", "gekommen",
    "gehe", "gehst", "geht", "ging", "gingen", "gegangen",
    "mache", "machst", "macht", "machte", "gemacht",
    "sage", "sagst", "sagt", "sagte", "gesagt",
    "suche", "suchst", "sucht", "suchte", "gesucht",
    "brauche", "brauchst", "braucht", "brauchte",
    "nehme", "nimmst", "nimmt", "nahm", "genommen",
    "gebe", "gibst", "gibt", "gab", "gegeben",
    "finde", "findest", "findet", "fand", "gefunden",
    "kaufe", "kaufst", "kauft", "kaufte", "gekauft",
    
    -- Less common but important
    "sehe", "siehst", "sieht", "sah", "gesehen",
    "denke", "denkst", "denkt", "dachte", "gedacht",
    "glaube", "glaubst", "glaubt", "glaubte",
    "weiß", "weißt", "wusste", "gewusst",
    "laufe", "läufst", "läuft", "lief", "gelaufen",
    "spiele", "spielst", "spielt", "spielte",
    "warte", "wartest", "wartet", "wartete",
    "bring", "bringst", "bringt", "brachte", "gebracht",
    
    -- Gaming-specific
    "heile", "heilst", "heilt", "heilte",
    "sterbe", "stirbst", "stirbt", "starb", "gestorben",
    "schaffe", "schaffst", "schafft", "schaffte", "geschafft",
}

print("Testing verb normalization to infinitive:")
print()

local success = 0
local failed = 0
local results = {}

for _, verbForm in ipairs(testVerbs) do
    local infinitive = WDTS_GermanMorphology.NormalizeToInfinitive(verbForm)
    if infinitive then
        success = success + 1
        results[verbForm] = infinitive
        print(string.format("  ✓ %-12s → %s", verbForm, infinitive))
    else
        failed = failed + 1
        print(string.format("  ✗ %-12s → (not recognized)", verbForm))
    end
end

print()
print("=" .. string.rep("=", 80))
print(string.format("Results: %d/%d verbs recognized (%.1f%%)", 
    success, #testVerbs, (success / #testVerbs) * 100))
print("=" .. string.rep("=", 80))

if failed > 0 then
    print()
    print("Failed verbs:")
    for _, verbForm in ipairs(testVerbs) do
        if not WDTS_GermanMorphology.NormalizeToInfinitive(verbForm) then
            print("  - " .. verbForm)
        end
    end
end

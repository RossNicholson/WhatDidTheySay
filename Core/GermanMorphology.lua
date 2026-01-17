-- German Morphology Helper
-- Provides utilities for German word forms, verb conjugation, and morphological analysis
-- This helps improve translation accuracy by recognizing word variations

local GermanMorphology = {}

-- Common German verb prefixes that can be separable
GermanMorphology.SEPARABLE_PREFIXES = {
    ["ab"] = true,
    ["an"] = true,
    ["auf"] = true,
    ["aus"] = true,
    ["bei"] = true,
    ["ein"] = true,
    ["fern"] = true,
    ["fest"] = true,
    ["fort"] = true,
    ["her"] = true,
    ["hin"] = true,
    ["los"] = true,
    ["mit"] = true,
    ["nach"] = true,
    ["vor"] = true,
    ["weg"] = true,
    ["weiter"] = true,
    ["zurück"] = true,
    ["zusammen"] = true,
    ["zu"] = true,
    ["durch"] = true,
    ["über"] = true,
    ["um"] = true,
    ["unter"] = true,
    ["wieder"] = true,
}

-- Common German verb endings for conjugation patterns
GermanMorphology.VERB_ENDINGS = {
    -- Present tense
    ["en"] = "infinitive", -- machen, gehen
    ["e"] = "first_person_singular", -- mache, gehe
    ["st"] = "second_person_singular", -- machst, gehst
    ["t"] = "third_person_singular", -- macht, geht
    ["n"] = "first_third_person_plural", -- machen, gehen
    
    -- Past tense (imperfect/Präteritum)
    ["te"] = "past_weak", -- machte, glaubte
    ["test"] = "past_second_person", -- machtest
    ["ten"] = "past_plural", -- machten
    
    -- Past participle (Perfekt/Partizip II)
    ["t"] = "past_participle_weak", -- gemacht, geglaubt (with ge- prefix)
    ["en"] = "past_participle_strong", -- gegangen, gesehen (with ge- prefix)
}

-- Try to extract verb stem and detect conjugation
function GermanMorphology.ExtractVerbStem(word)
    local wordLower = word:lower()
    
    -- Remove past participle prefix "ge-"
    if wordLower:sub(1, 3) == "ge" and #wordLower >= 6 then
        local withoutGe = wordLower:sub(4)
        -- Check if it's a past participle
        if withoutGe:sub(-1) == "t" or withoutGe:sub(-2) == "en" then
            return withoutGe:sub(1, -2), "past_participle"
        end
    end
    
    -- Remove infinitive ending "-en"
    if wordLower:sub(-2) == "en" and #wordLower >= 4 then
        return wordLower:sub(1, -3), "infinitive"
    end
    
    -- Remove present tense endings
    if wordLower:sub(-2) == "st" and #wordLower >= 5 then
        return wordLower:sub(1, -3), "second_person_singular"
    elseif wordLower:sub(-1) == "t" and #wordLower >= 4 then
        return wordLower:sub(1, -2), "third_person_singular"
    elseif wordLower:sub(-1) == "e" and #wordLower >= 4 then
        return wordLower:sub(1, -2), "first_person_singular"
    end
    
    -- Remove past tense endings
    if wordLower:sub(-2) == "te" and #wordLower >= 5 then
        return wordLower:sub(1, -3), "past_weak"
    elseif wordLower:sub(-3) == "test" and #wordLower >= 6 then
        return wordLower:sub(1, -4), "past_second_person"
    elseif wordLower:sub(-3) == "ten" and #wordLower >= 6 then
        return wordLower:sub(1, -4), "past_plural"
    end
    
    return wordLower, "unknown"
end

-- Check if a word is a separable verb (prefix + verb)
function GermanMorphology.IsSeparableVerb(word)
    local wordLower = word:lower()
    
    -- Check if word starts with a separable prefix
    for prefix, _ in pairs(GermanMorphology.SEPARABLE_PREFIXES) do
        if wordLower:sub(1, #prefix) == prefix then
            local rest = wordLower:sub(#prefix + 1)
            if #rest >= 3 then
                -- Could be a separable verb
                return true, prefix, rest
            end
        end
    end
    
    return false, nil, nil
end

-- Comprehensive verb conjugation lookup table
-- Maps all verb forms (present, past, participle) to their infinitive
-- Expanded for Phase 1: Grammar Improvement Plan
local VERB_CONJUGATION_LOOKUP = {
    -- Modal verbs (high frequency)
    ["kann"] = "können", ["kannst"] = "können", ["könnt"] = "können", ["könne"] = "können",
    ["konnte"] = "können", ["konntest"] = "können", ["konnten"] = "können", ["gekonnt"] = "können",
    ["muss"] = "müssen", ["musst"] = "müssen", ["müsst"] = "müssen", ["müsse"] = "müssen",
    ["musste"] = "müssen", ["musstest"] = "müssen", ["mussten"] = "müssen", ["gemusst"] = "müssen",
    ["soll"] = "sollen", ["sollst"] = "sollen", ["sollt"] = "sollen", ["solle"] = "sollen",
    ["sollte"] = "sollen", ["solltest"] = "sollen", ["sollten"] = "sollen", ["gesollt"] = "sollen",
    ["will"] = "wollen", ["willst"] = "wollen", ["wollt"] = "wollen", ["wolle"] = "wollen",
    ["wollte"] = "wollen", ["wolltest"] = "wollen", ["wollten"] = "wollen", ["gewollt"] = "wollen",
    ["darf"] = "dürfen", ["darfst"] = "dürfen", ["dürft"] = "dürfen", ["dürfe"] = "dürfen",
    ["durfte"] = "dürfen", ["durftest"] = "dürfen", ["durften"] = "dürfen", ["gedurft"] = "dürfen",
    ["mag"] = "mögen", ["magst"] = "mögen", ["mögt"] = "mögen", ["möge"] = "mögen",
    ["mochte"] = "mögen", ["mochtest"] = "mögen", ["mochten"] = "mögen", ["gemocht"] = "mögen",
    ["möchte"] = "möchten", ["möchtest"] = "möchten", ["möchtet"] = "möchten", ["möchten"] = "möchten",
    
    -- "sein" (to be) - all forms
    ["bin"] = "sein", ["bist"] = "sein", ["ist"] = "sein", ["sind"] = "sein", ["seid"] = "sein",
    ["war"] = "sein", ["warst"] = "sein", ["waren"] = "sein", ["wart"] = "sein",
    ["gewesen"] = "sein",
    
    -- "haben" (to have) - all forms
    ["habe"] = "haben", ["hab"] = "haben", ["hast"] = "haben", ["hat"] = "haben",
    ["habt"] = "haben", ["hatte"] = "haben", ["hattest"] = "haben", ["hatten"] = "haben",
    ["gehabt"] = "haben",
    
    -- "werden" (to become/will) - all forms
    ["werde"] = "werden", ["wirst"] = "werden", ["wird"] = "werden", ["werdet"] = "werden",
    ["wurde"] = "werden", ["wurdest"] = "werden", ["wurden"] = "werden", ["geworden"] = "werden",
    
    -- Common action verbs - "kommen" (to come)
    ["komme"] = "kommen", ["komm"] = "kommen", ["kommst"] = "kommen", ["kommt"] = "kommen",
    ["kam"] = "kommen", ["kamst"] = "kommen", ["kamen"] = "kommen", ["gekommen"] = "kommen",
    
    -- "gehen" (to go)
    ["gehe"] = "gehen", ["geh"] = "gehen", ["gehst"] = "gehen", ["geht"] = "gehen",
    ["ging"] = "gehen", ["gingst"] = "gehen", ["gingen"] = "gehen", ["gegangen"] = "gehen",
    
    -- "machen" (to make/do)
    ["mache"] = "machen", ["mach"] = "machen", ["machst"] = "machen", ["macht"] = "machen",
    ["machte"] = "machen", ["machtest"] = "machen", ["machten"] = "machen", ["gemacht"] = "machen",
    
    -- "sagen" (to say)
    ["sage"] = "sagen", ["sag"] = "sagen", ["sagst"] = "sagen", ["sagt"] = "sagen",
    ["sagte"] = "sagen", ["sagtest"] = "sagen", ["sagten"] = "sagen", ["gesagt"] = "sagen",
    
    -- "suchen" (to look for)
    ["suche"] = "suchen", ["such"] = "suchen", ["suchst"] = "suchen", ["sucht"] = "suchen",
    ["suchte"] = "suchen", ["suchtest"] = "suchen", ["suchten"] = "suchen", ["gesucht"] = "suchen",
    
    -- "brauchen" (to need)
    ["brauche"] = "brauchen", ["brauch"] = "brauchen", ["brauchst"] = "brauchen", ["braucht"] = "brauchen",
    ["brauchte"] = "brauchen", ["brauchtest"] = "brauchen", ["brauchten"] = "brauchen", ["gebraucht"] = "brauchen",
    
    -- "nehmen" (to take)
    ["nehme"] = "nehmen", ["nimm"] = "nehmen", ["nimmst"] = "nehmen", ["nimmt"] = "nehmen",
    ["nahm"] = "nehmen", ["nahmst"] = "nehmen", ["nahmen"] = "nehmen", ["genommen"] = "nehmen",
    
    -- "geben" (to give)
    ["gebe"] = "geben", ["gib"] = "geben", ["gibst"] = "geben", ["gibt"] = "geben",
    ["gab"] = "geben", ["gabst"] = "geben", ["gaben"] = "geben", ["gegeben"] = "geben",
    
    -- "finden" (to find)
    ["finde"] = "finden", ["find"] = "finden", ["findest"] = "finden", ["findet"] = "finden",
    ["fand"] = "finden", ["fandest"] = "finden", ["fanden"] = "finden", ["gefunden"] = "finden",
    
    -- "kaufen" (to buy)
    ["kaufe"] = "kaufen", ["kauf"] = "kaufen", ["kaufst"] = "kaufen", ["kauft"] = "kaufen",
    ["kaufte"] = "kaufen", ["kauftest"] = "kaufen", ["kauften"] = "kaufen", ["gekauft"] = "kaufen",
    
    -- "verkaufen" (to sell)
    ["verkaufe"] = "verkaufen", ["verkauf"] = "verkaufen", ["verkaufst"] = "verkaufen", ["verkauft"] = "verkaufen",
    ["verkaufte"] = "verkaufen", ["verkauftest"] = "verkaufen", ["verkauften"] = "verkaufen", ["verkauft"] = "verkaufen",
    
    -- "lassen" (to let/leave)
    ["lasse"] = "lassen", ["lässt"] = "lassen", ["lasst"] = "lassen",
    ["ließ"] = "lassen", ["ließt"] = "lassen", ["ließen"] = "lassen", ["gelassen"] = "lassen",
    
    -- "sehen" (to see)
    ["sehe"] = "sehen", ["seh"] = "sehen", ["siehst"] = "sehen", ["sieht"] = "sehen",
    ["sah"] = "sehen", ["sahst"] = "sehen", ["sahen"] = "sehen", ["gesehen"] = "sehen",
    
    -- "denken" (to think)
    ["denke"] = "denken", ["denk"] = "denken", ["denkst"] = "denken", ["denkt"] = "denken",
    ["dachte"] = "denken", ["dachtest"] = "denken", ["dachten"] = "denken", ["gedacht"] = "denken",
    
    -- "glauben" (to believe/think)
    ["glaube"] = "glauben", ["glaub"] = "glauben", ["glaubst"] = "glauben", ["glaubt"] = "glauben",
    ["glaubte"] = "glauben", ["glaubtest"] = "glauben", ["glaubten"] = "glauben", ["geglaubt"] = "glauben",
    
    -- "wissen" (to know)
    ["weiß"] = "wissen", ["weißt"] = "wissen", ["wisst"] = "wissen", ["wisse"] = "wissen",
    ["wusste"] = "wissen", ["wusstest"] = "wissen", ["wussten"] = "wissen", ["gewusst"] = "wissen",
    
    -- "laufen" (to run/walk)
    ["laufe"] = "laufen", ["lauf"] = "laufen", ["läufst"] = "laufen", ["läuft"] = "laufen",
    ["lief"] = "laufen", ["liefst"] = "laufen", ["liefen"] = "laufen", ["gelaufen"] = "laufen",
    
    -- "spielen" (to play)
    ["spiele"] = "spielen", ["spiel"] = "spielen", ["spielst"] = "spielen", ["spielt"] = "spielen",
    ["spielte"] = "spielen", ["spieltest"] = "spielen", ["spielten"] = "spielen", ["gespielt"] = "spielen",
    
    -- "arbeiten" (to work)
    ["arbeite"] = "arbeiten", ["arbeit"] = "arbeiten", ["arbeitest"] = "arbeiten", ["arbeitet"] = "arbeiten",
    ["arbeitete"] = "arbeiten", ["arbeitetest"] = "arbeiten", ["arbeiteten"] = "arbeiten", ["gearbeitet"] = "arbeiten",
    
    -- "warten" (to wait)
    ["warte"] = "warten", ["wart"] = "warten", ["wartest"] = "warten", ["wartet"] = "warten",
    ["wartete"] = "warten", ["wartetest"] = "warten", ["warteten"] = "warten", ["gewartet"] = "warten",
    
    -- "bringen" (to bring)
    ["bringe"] = "bringen", ["bring"] = "bringen", ["bringst"] = "bringen", ["bringt"] = "bringen",
    ["brachte"] = "bringen", ["brachtest"] = "bringen", ["brachten"] = "bringen", ["gebracht"] = "bringen",
    
    -- "holen" (to get/fetch)
    ["hole"] = "holen", ["hol"] = "holen", ["holst"] = "holen", ["holt"] = "holen",
    ["holte"] = "holen", ["holtest"] = "holen", ["holten"] = "holen", ["geholt"] = "holen",
    
    -- "lernen" (to learn)
    ["lerne"] = "lernen", ["lern"] = "lernen", ["lernst"] = "lernen", ["lernt"] = "lernen",
    ["lernte"] = "lernen", ["lerntest"] = "lernen", ["lernten"] = "lernen", ["gelernt"] = "lernen",
    
    -- "begleiten" (to accompany)
    ["begleite"] = "begleiten", ["begleit"] = "begleiten", ["begleitest"] = "begleiten", ["begleitet"] = "begleiten",
    ["begleitete"] = "begleiten", ["begleitetest"] = "begleiten", ["begleiteten"] = "begleiten", ["begleitet"] = "begleiten",
    
    -- "öffnen" (to open)
    ["öffne"] = "öffnen", ["öffnest"] = "öffnen", ["öffnet"] = "öffnen",
    ["öffnete"] = "öffnen", ["öffnetest"] = "öffnen", ["öffneten"] = "öffnen", ["geöffnet"] = "öffnen",
    
    -- "schließen" (to close)
    ["schließe"] = "schließen", ["schließt"] = "schließen", ["schließt"] = "schließen",
    ["schloss"] = "schließen", ["schlosst"] = "schließen", ["schlossen"] = "schließen", ["geschlossen"] = "schließen",
    
    -- "kosten" (to cost)
    ["koste"] = "kosten", ["kost"] = "kosten", ["kostest"] = "kosten", ["kostet"] = "kosten",
    ["kostete"] = "kosten", ["kostetest"] = "kosten", ["kosteten"] = "kosten", ["gekostet"] = "kosten",
    
    -- "nutzen" (to use)
    ["nutze"] = "nutzen", ["nutz"] = "nutzen", ["nutzt"] = "nutzen",
    ["nutzte"] = "nutzen", ["nutztest"] = "nutzen", ["nutzten"] = "nutzen", ["genutzt"] = "nutzen",
    
    -- "benutzen" (to use - formal)
    ["benutze"] = "benutzen", ["benutz"] = "benutzen", ["benutzt"] = "benutzen",
    ["benutzte"] = "benutzen", ["benutztest"] = "benutzen", ["benutzten"] = "benutzen", ["benutzt"] = "benutzen",
    
    -- "einladen" (to invite)
    ["lade"] = "einladen", ["lädst"] = "einladen", ["lädt"] = "einladen", ["ladet"] = "einladen",
    ["lud"] = "einladen", ["ludst"] = "einladen", ["luden"] = "einladen", ["eingeladen"] = "einladen",
    
    -- "starten" (to start)
    ["starte"] = "starten", ["start"] = "starten", ["startest"] = "starten", ["startet"] = "starten",
    ["startete"] = "starten", ["startetest"] = "starten", ["starteten"] = "starten", ["gestartet"] = "starten",
    
    -- "beginnen" (to begin)
    ["beginne"] = "beginnen", ["beginn"] = "beginnen", ["beginnt"] = "beginnen",
    ["begann"] = "beginnen", ["begannst"] = "beginnen", ["begannen"] = "beginnen", ["begonnen"] = "beginnen",
    
    -- "heilen" (to heal)
    ["heile"] = "heilen", ["heil"] = "heilen", ["heilst"] = "heilen", ["heilt"] = "heilen",
    ["heilte"] = "heilen", ["heiltest"] = "heilen", ["heilten"] = "heilen", ["geheilt"] = "heilen",
    
    -- "sterben" (to die)
    ["sterbe"] = "sterben", ["stirbst"] = "sterben", ["stirbt"] = "sterben", ["sterbt"] = "sterben",
    ["starb"] = "sterben", ["starbst"] = "sterben", ["starben"] = "sterben", ["gestorben"] = "sterben",
    
    -- "leben" (to live)
    ["lebe"] = "leben", ["lebst"] = "leben", ["lebt"] = "leben",
    ["lebte"] = "leben", ["lebtest"] = "leben", ["lebten"] = "leben", ["gelebt"] = "leben",
    
    -- "schaffen" (to manage/achieve)
    ["schaffe"] = "schaffen", ["schaff"] = "schaffen", ["schaffst"] = "schaffen", ["schafft"] = "schaffen",
    ["schaffte"] = "schaffen", ["schafftest"] = "schaffen", ["schafften"] = "schaffen", ["geschafft"] = "schaffen",
    
    -- "nennen" (to call/name)
    ["nenne"] = "nennen", ["nenn"] = "nennen", ["nennst"] = "nennen", ["nennt"] = "nennen",
    ["nannte"] = "nennen", ["nanntest"] = "nennen", ["nannten"] = "nennen", ["genannt"] = "nennen",
    
    -- "spendieren" (to donate/give)
    ["spendiere"] = "spendieren", ["spendier"] = "spendieren", ["spendierst"] = "spendieren", ["spendiert"] = "spendieren",
    ["spendierte"] = "spendieren", ["spendiertest"] = "spendieren", ["spendierten"] = "spendieren", ["spendiert"] = "spendieren",
    
    -- "besorgen" (to get/buy)
    ["besorge"] = "besorgen", ["besorg"] = "besorgen", ["besorgst"] = "besorgen", ["besorgt"] = "besorgen",
    ["besorgte"] = "besorgen", ["besorgtest"] = "besorgen", ["besorgten"] = "besorgen", ["besorgt"] = "besorgen",
    
    -- "verkaufen" already above
    -- "schnorren" (to borrow/beg)
    ["schnorre"] = "schnorren", ["schnorr"] = "schnorren", ["schnorrst"] = "schnorren", ["schnorrt"] = "schnorren",
    ["schnorrte"] = "schnorren", ["schnorrtest"] = "schnorren", ["schnorrten"] = "schnorren", ["geschnorrt"] = "schnorren",
}

-- Try to normalize a verb to infinitive form
function GermanMorphology.NormalizeToInfinitive(word)
    local wordLower = word:lower()
    
    -- First check comprehensive lookup table
    if VERB_CONJUGATION_LOOKUP[wordLower] then
        return VERB_CONJUGATION_LOOKUP[wordLower]
    end
    
    -- Fall back to pattern-based normalization (for verbs not in lookup table)
    
    -- Remove past participle "ge-" prefix
    if wordLower:sub(1, 3) == "ge" and #wordLower >= 6 then
        local stem = wordLower:sub(4)
        if stem:sub(-1) == "t" then
            -- Weak verb: ge + stem + t -> stem + en
            return stem:sub(1, -2) .. "en"
        elseif stem:sub(-2) == "en" then
            -- Strong verb: ge + stem + en -> stem (already has en)
            return stem
        end
    end
    
    -- Remove present/past tense endings and add "en"
    if wordLower:sub(-2) == "st" then
        return wordLower:sub(1, -3) .. "en" -- machst -> machen
    elseif wordLower:sub(-1) == "t" and wordLower ~= "hat" then
        return wordLower:sub(1, -2) .. "en" -- macht -> machen
    elseif wordLower:sub(-1) == "e" then
        return wordLower:sub(1, -2) .. "en" -- mache -> machen
    elseif wordLower:sub(-2) == "te" then
        return wordLower:sub(1, -3) .. "en" -- machte -> machen
    elseif wordLower:sub(-3) == "test" then
        return wordLower:sub(1, -4) .. "en" -- machtest -> machen
    end
    
    -- If already ends in "en", likely already infinitive
    if wordLower:sub(-2) == "en" then
        return wordLower
    end
    
    return nil
end

-- Common noun plural patterns (for future use)
GermanMorphology.NOUN_PLURAL_PATTERNS = {
    -- Many nouns add -e or -en for plural
    -- This is a simplified pattern set
}

WDTS_GermanMorphology = GermanMorphology

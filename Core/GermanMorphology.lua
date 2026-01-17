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
    
    -- Additional common verbs (60+ more verbs)
    
    -- "verstehen" (to understand)
    ["verstehe"] = "verstehen", ["versteh"] = "verstehen", ["verstehst"] = "verstehen", ["versteht"] = "verstehen",
    ["verstand"] = "verstehen", ["verstandest"] = "verstehen", ["verstanden"] = "verstehen", ["verstanden"] = "verstehen",
    
    -- "helfen" (to help)
    ["helfe"] = "helfen", ["hilf"] = "helfen", ["hilfst"] = "helfen", ["hilft"] = "helfen",
    ["half"] = "helfen", ["halfst"] = "helfen", ["halfen"] = "helfen", ["geholfen"] = "helfen",
    
    -- "halten" (to hold/keep)
    ["halte"] = "halten", ["hält"] = "halten", ["hältst"] = "halten", ["haltet"] = "halten",
    ["hielt"] = "halten", ["hieltest"] = "halten", ["hielten"] = "halten", ["gehalten"] = "halten",
    
    -- "anbieten" (to offer)
    ["biete"] = "anbieten", ["bietest"] = "anbieten", ["bietet"] = "anbieten",
    ["bot"] = "anbieten", ["botest"] = "anbieten", ["boten"] = "anbieten", ["angeboten"] = "anbieten",
    
    -- "bitten" (to ask/request)
    ["bitte"] = "bitten", ["bittest"] = "bitten", ["bittet"] = "bitten",
    ["bat"] = "bitten", ["batest"] = "bitten", ["baten"] = "bitten", ["gebeten"] = "bitten",
    
    -- "rufen" (to call/summon)
    ["rufe"] = "rufen", ["ruf"] = "rufen", ["rufst"] = "rufen", ["ruft"] = "rufen",
    ["rief"] = "rufen", ["riefst"] = "rufen", ["riefen"] = "rufen", ["gerufen"] = "rufen",
    
    -- "beschwören" (to summon)
    ["beschwöre"] = "beschwören", ["beschwörst"] = "beschwören", ["beschwört"] = "beschwören",
    ["beschwor"] = "beschwören", ["beschworst"] = "beschwören", ["beschworen"] = "beschwören", ["beschworen"] = "beschwören",
    
    -- "angreifen" (to attack)
    ["greife"] = "angreifen", ["greifst"] = "angreifen", ["greift"] = "angreifen",
    ["griff"] = "angreifen", ["griffst"] = "angreifen", ["griffen"] = "angreifen", ["angegriffen"] = "angreifen",
    
    -- "verteidigen" (to defend)
    ["verteidige"] = "verteidigen", ["verteidigst"] = "verteidigen", ["verteidigt"] = "verteidigen",
    ["verteidigte"] = "verteidigen", ["verteidigtest"] = "verteidigen", ["verteidigten"] = "verteidigen", ["verteidigt"] = "verteidigen",
    
    -- "kämpfen" (to fight)
    ["kämpfe"] = "kämpfen", ["kämpfst"] = "kämpfen", ["kämpft"] = "kämpfen",
    ["kämpfte"] = "kämpfen", ["kämpftest"] = "kämpfen", ["kämpften"] = "kämpfen", ["gekämpft"] = "kämpfen",
    
    -- "gewinnen" (to win)
    ["gewinne"] = "gewinnen", ["gewinnst"] = "gewinnen", ["gewinnt"] = "gewinnen",
    ["gewann"] = "gewinnen", ["gewannst"] = "gewinnen", ["gewannen"] = "gewinnen", ["gewonnen"] = "gewinnen",
    
    -- "verlieren" (to lose)
    ["verliere"] = "verlieren", ["verlierst"] = "verlieren", ["verliert"] = "verlieren",
    ["verlor"] = "verlieren", ["verlorst"] = "verlieren", ["verloren"] = "verlieren", ["verloren"] = "verlieren",
    
    -- "töten" (to kill)
    ["töte"] = "töten", ["tötest"] = "töten", ["tötet"] = "töten",
    ["tötete"] = "töten", ["tötetest"] = "töten", ["töteten"] = "töten", ["getötet"] = "töten",
    
    -- "schlafen" (to sleep)
    ["schläfe"] = "schlafen", ["schläfst"] = "schlafen", ["schläft"] = "schlafen",
    ["schlief"] = "schlafen", ["schliefst"] = "schlafen", ["schliefen"] = "schlafen", ["geschlafen"] = "schlafen",
    
    -- "essen" (to eat)
    ["esse"] = "essen", ["isst"] = "essen", ["esst"] = "essen",
    ["aß"] = "essen", ["aßest"] = "essen", ["aßen"] = "essen", ["gegessen"] = "essen",
    
    -- "trinken" (to drink)
    ["trinke"] = "trinken", ["trinkst"] = "trinken", ["trinkt"] = "trinken",
    ["trank"] = "trinken", ["trankst"] = "trinken", ["tranken"] = "trinken", ["getrunken"] = "trinken",
    
    -- "lesen" (to read)
    ["lese"] = "lesen", ["liest"] = "lesen",
    ["las"] = "lesen", ["lasest"] = "lesen", ["lasen"] = "lesen", ["gelesen"] = "lesen",
    
    -- "schreiben" (to write)
    ["schreibe"] = "schreiben", ["schreibst"] = "schreiben", ["schreibt"] = "schreiben",
    ["schrieb"] = "schreiben", ["schriebst"] = "schreiben", ["schrieben"] = "schreiben", ["geschrieben"] = "schreiben",
    
    -- "sprechen" (to speak)
    ["spreche"] = "sprechen", ["sprichst"] = "sprechen", ["spricht"] = "sprechen",
    ["sprach"] = "sprechen", ["sprachst"] = "sprechen", ["sprachen"] = "sprechen", ["gesprochen"] = "sprechen",
    
    -- "hören" (to hear)
    ["höre"] = "hören", ["hörst"] = "hören", ["hört"] = "hören",
    ["hörte"] = "hören", ["hörtest"] = "hören", ["hörten"] = "hören", ["gehört"] = "hören",
    
    -- "hören" already in vocabulary
    
    -- "schauen" (to look/watch)
    ["schaue"] = "schauen", ["schaust"] = "schauen", ["schaut"] = "schauen",
    ["schaute"] = "schauen", ["schautest"] = "schauen", ["schauten"] = "schauen", ["geschaut"] = "schauen",
    
    -- "zeigen" (to show)
    ["zeige"] = "zeigen", ["zeigst"] = "zeigen", ["zeigt"] = "zeigen",
    ["zeigte"] = "zeigen", ["zeigtest"] = "zeigen", ["zeigten"] = "zeigen", ["gezeigt"] = "zeigen",
    
    -- "verstecken" (to hide)
    ["verstecke"] = "verstecken", ["versteckst"] = "verstecken", ["versteckt"] = "verstecken",
    ["versteckte"] = "verstecken", ["verstecktest"] = "verstecken", ["versteckten"] = "verstecken", ["versteckt"] = "verstecken",
    
    -- "sitzen" (to sit)
    ["sitze"] = "sitzen", ["sitzt"] = "sitzen",
    ["saß"] = "sitzen", ["saßest"] = "sitzen", ["saßen"] = "sitzen", ["gesessen"] = "sitzen",
    
    -- "stehen" (to stand)
    ["stehe"] = "stehen", ["stehst"] = "stehen", ["steht"] = "stehen",
    ["stand"] = "stehen", ["standest"] = "stehen", ["standen"] = "stehen", ["gestanden"] = "stehen",
    
    -- "liegen" (to lie/lay)
    ["liege"] = "liegen", ["liegst"] = "liegen", ["liegt"] = "liegen",
    ["lag"] = "liegen", ["lagst"] = "liegen", ["lagen"] = "liegen", ["gelegen"] = "liegen",
    
    -- "springen" (to jump)
    ["springe"] = "springen", ["springst"] = "springen", ["springt"] = "springen",
    ["sprang"] = "springen", ["sprangst"] = "springen", ["sprangen"] = "springen", ["gesprungen"] = "springen",
    
    -- "rennen" (to run)
    ["renne"] = "rennen", ["rennst"] = "rennen", ["rennt"] = "rennen",
    ["rannte"] = "rennen", ["ranntest"] = "rennen", ["rannten"] = "rennen", ["gerannt"] = "rennen",
    
    -- "fahren" (to drive/travel)
    ["fahre"] = "fahren", ["fährst"] = "fahren", ["fährt"] = "fahren",
    ["fuhr"] = "fahren", ["fuhrst"] = "fahren", ["fuhren"] = "fahren", ["gefahren"] = "fahren",
    
    -- "fliegen" (to fly)
    ["fliege"] = "fliegen", ["fliegst"] = "fliegen", ["fliegt"] = "fliegen",
    ["flog"] = "fliegen", ["flogst"] = "fliegen", ["flogen"] = "fliegen", ["geflogen"] = "fliegen",
    
    -- "schwimmen" (to swim)
    ["schwimme"] = "schwimmen", ["schwimmst"] = "schwimmen", ["schwimmt"] = "schwimmen",
    ["schwamm"] = "schwimmen", ["schwammst"] = "schwimmen", ["schwammen"] = "schwimmen", ["geschwommen"] = "schwimmen",
    
    -- "bauen" (to build)
    ["baue"] = "bauen", ["baust"] = "bauen", ["baut"] = "bauen",
    ["baute"] = "bauen", ["bautest"] = "bauen", ["bauten"] = "bauen", ["gebaut"] = "bauen",
    
    -- "zerstören" (to destroy)
    ["zerstöre"] = "zerstören", ["zerstörst"] = "zerstören", ["zerstört"] = "zerstören",
    ["zerstörte"] = "zerstören", ["zerstörtest"] = "zerstören", ["zerstörten"] = "zerstören", ["zerstört"] = "zerstören",
    
    -- "reparieren" (to repair)
    ["repariere"] = "reparieren", ["reparierst"] = "reparieren", ["repariert"] = "reparieren",
    ["reparierte"] = "reparieren", ["repariertest"] = "reparieren", ["reparierten"] = "reparieren", ["repariert"] = "reparieren",
    
    -- "versuchen" (to try/attempt)
    ["versuche"] = "versuchen", ["versuchst"] = "versuchen", ["versucht"] = "versuchen",
    ["versuchte"] = "versuchen", ["versuchtest"] = "versuchen", ["versuchten"] = "versuchen", ["versucht"] = "versuchen",
    
    -- "schaffen" already above
    
    -- "aufhören" (to stop)
    ["höre"] = "aufhören", ["hörst"] = "aufhören", ["hört"] = "aufhören",
    ["hörte"] = "aufhören", ["hörtest"] = "aufhören", ["hörten"] = "aufhören", ["aufgehört"] = "aufhören",
    
    -- "anfangen" (to begin/start)
    ["fange"] = "anfangen", ["fängst"] = "anfangen", ["fängt"] = "anfangen",
    ["fing"] = "anfangen", ["fingst"] = "anfangen", ["fingen"] = "anfangen", ["angefangen"] = "anfangen",
    
    -- "aufhören" and "anfangen" are separable verbs - forms above are simplified
    
    -- "beenden" (to finish/end)
    ["beende"] = "beenden", ["beendest"] = "beenden", ["beendet"] = "beenden",
    ["beendete"] = "beenden", ["beendetest"] = "beenden", ["beendeten"] = "beenden", ["beendet"] = "beenden",
    
    -- "stoppen" (to stop)
    ["stoppe"] = "stoppen", ["stoppst"] = "stoppen", ["stoppt"] = "stoppen",
    ["stoppte"] = "stoppen", ["stopptest"] = "stoppen", ["stoppten"] = "stoppen", ["gestoppt"] = "stoppen",
    
    -- "mitmachen" (to join/participate)
    ["mache"] = "mitmachen", ["machst"] = "mitmachen", ["macht"] = "mitmachen",
    ["machte"] = "mitmachen", ["machtest"] = "mitmachen", ["machten"] = "mitmachen", ["mitgemacht"] = "mitmachen",
    
    -- "beitreten" (to join)
    ["trete"] = "beitreten", ["trittst"] = "beitreten", ["tritt"] = "beitreten",
    ["trat"] = "beitreten", ["tratest"] = "beitreten", ["traten"] = "beitreten", ["beigetreten"] = "beitreten",
    
    -- "verlassen" (to leave)
    ["verlasse"] = "verlassen", ["verlässt"] = "verlassen", ["verlasst"] = "verlassen",
    ["verließ"] = "verlassen", ["verließt"] = "verlassen", ["verließen"] = "verlassen", ["verlassen"] = "verlassen",
    
    -- "zurückkommen" (to come back)
    ["komme"] = "zurückkommen", ["kommst"] = "zurückkommen", ["kommt"] = "zurückkommen",
    ["kam"] = "zurückkommen", ["kamst"] = "zurückkommen", ["kamen"] = "zurückkommen", ["zurückgekommen"] = "zurückkommen",
    
    -- "zurückkehren" (to return)
    ["kehre"] = "zurückkehren", ["kehrst"] = "zurückkehren", ["kehrt"] = "zurückkehren",
    ["kehrte"] = "zurückkehren", ["kehrtest"] = "zurückkehren", ["kehrten"] = "zurückkehren", ["zurückgekehrt"] = "zurückkehren",
    
    -- "erwarten" (to expect)
    ["erwarte"] = "erwarten", ["erwartest"] = "erwarten", ["erwartet"] = "erwarten",
    ["erwartete"] = "erwarten", ["erwartetest"] = "erwarten", ["erwarteten"] = "erwarten", ["erwartet"] = "erwarten",
    
    -- "brauchen" already above
    
    -- "benötigen" (to need - formal)
    ["benötige"] = "benötigen", ["benötigst"] = "benötigen", ["benötigt"] = "benötigen",
    ["benötigte"] = "benötigen", ["benötigtest"] = "benötigen", ["benötigten"] = "benötigen", ["benötigt"] = "benötigen",
    
    -- "tragen" (to wear/carry)
    ["trage"] = "tragen", ["trägst"] = "tragen", ["trägt"] = "tragen",
    ["trug"] = "tragen", ["trugst"] = "tragen", ["trugen"] = "tragen", ["getragen"] = "tragen",
    
    -- "anziehen" (to put on/wear)
    ["ziehe"] = "anziehen", ["ziehst"] = "anziehen", ["zieht"] = "anziehen",
    ["zog"] = "anziehen", ["zogst"] = "anziehen", ["zogen"] = "anziehen", ["angezogen"] = "anziehen",
    
    -- "ausziehen" (to take off)
    ["ziehe"] = "ausziehen", ["ziehst"] = "ausziehen", ["zieht"] = "ausziehen",
    ["zog"] = "ausziehen", ["zogst"] = "ausziehen", ["zogen"] = "ausziehen", ["ausgezogen"] = "ausziehen",
    
    -- "legen" (to lay/put)
    ["lege"] = "legen", ["legst"] = "legen", ["legt"] = "legen",
    ["legte"] = "legen", ["legtest"] = "legen", ["legten"] = "legen", ["gelegt"] = "legen",
    
    -- "stellen" (to place/put)
    ["stelle"] = "stellen", ["stellst"] = "stellen", ["stellt"] = "stellen",
    ["stellte"] = "stellen", ["stelltest"] = "stellen", ["stellten"] = "stellen", ["gestellt"] = "stellen",
    
    -- "setzen" (to set/put)
    ["setze"] = "setzen", ["setzt"] = "setzen",
    ["setzte"] = "setzen", ["setztest"] = "setzen", ["setzten"] = "setzen", ["gesetzt"] = "setzen",
    
    -- "packen" (to pack/put)
    ["packe"] = "packen", ["packst"] = "packen", ["packt"] = "packen",
    ["packte"] = "packen", ["packtest"] = "packen", ["packten"] = "packen", ["gepackt"] = "packen",
    
    -- "verschieben" (to move/shift)
    ["verschiebe"] = "verschieben", ["verschiebst"] = "verschieben", ["verschiebt"] = "verschieben",
    ["verschob"] = "verschieben", ["verschobst"] = "verschieben", ["verschoben"] = "verschieben", ["verschoben"] = "verschieben",
    
    -- "bewegen" (to move)
    ["bewege"] = "bewegen", ["bewegst"] = "bewegen", ["bewegt"] = "bewegen",
    ["bewegte"] = "bewegen", ["bewegtest"] = "bewegen", ["bewegten"] = "bewegen", ["bewegt"] = "bewegen",
    
    -- "drehen" (to turn)
    ["drehe"] = "drehen", ["drehst"] = "drehen", ["dreht"] = "drehen",
    ["drehte"] = "drehen", ["drehtest"] = "drehen", ["drehten"] = "drehen", ["gedreht"] = "drehen",
    
    -- "wenden" (to turn)
    ["wende"] = "wenden", ["wendest"] = "wenden", ["wendet"] = "wenden",
    ["wendete"] = "wenden", ["wendetest"] = "wenden", ["wendeten"] = "wenden", ["gewandt"] = "wenden",
    
    -- "drehen" and "wenden" above
    
    -- "treffen" (to meet/hit)
    ["treffe"] = "treffen", ["triffst"] = "treffen", ["trifft"] = "treffen",
    ["traf"] = "treffen", ["trafst"] = "treffen", ["trafen"] = "treffen", ["getroffen"] = "treffen",
    
    -- "begegnen" (to meet/encounter)
    ["begegne"] = "begegnen", ["begegnest"] = "begegnen", ["begegnet"] = "begegnen",
    ["begegnete"] = "begegnen", ["begegnetest"] = "begegnen", ["begegneten"] = "begegnen", ["begegnet"] = "begegnen",
    
    -- "sammeln" (to collect/gather)
    ["sammle"] = "sammeln", ["sammelst"] = "sammeln", ["sammelt"] = "sammeln",
    ["sammelte"] = "sammeln", ["sammeltest"] = "sammeln", ["sammelten"] = "sammeln", ["gesammelt"] = "sammeln",
    
    -- "holen" already above
    
    -- "bekommen" (to get/receive)
    ["bekomme"] = "bekommen", ["bekommst"] = "bekommen", ["bekommt"] = "bekommen",
    ["bekam"] = "bekommen", ["bekamst"] = "bekommen", ["bekamen"] = "bekommen", ["bekommen"] = "bekommen",
    
    -- "erhalten" (to receive/get)
    ["erhalte"] = "erhalten", ["erhältst"] = "erhalten", ["erhält"] = "erhalten",
    ["erhielt"] = "erhalten", ["erhieltest"] = "erhalten", ["erhielten"] = "erhalten", ["erhalten"] = "erhalten",
    
    -- "senden" (to send)
    ["sende"] = "senden", ["sendest"] = "senden", ["sendet"] = "senden",
    ["sandte"] = "senden", ["sandtest"] = "senden", ["sandten"] = "senden", ["gesandt"] = "senden",
    
    -- "schicken" (to send)
    ["schicke"] = "schicken", ["schickst"] = "schicken", ["schickt"] = "schicken",
    ["schickte"] = "schicken", ["schicktest"] = "schicken", ["schickten"] = "schicken", ["geschickt"] = "schicken",
    
    -- "schicken" also means "skilled" but verb form takes precedence
    
    -- "erhalten" already above
    
    -- "bezahlen" (to pay)
    ["bezahle"] = "bezahlen", ["bezahlst"] = "bezahlen", ["bezahlt"] = "bezahlen",
    ["bezahlte"] = "bezahlen", ["bezahltest"] = "bezahlen", ["bezahlten"] = "bezahlen", ["bezahlt"] = "bezahlen",
    
    -- "zahlen" (to pay)
    ["zahle"] = "zahlen", ["zahlst"] = "zahlen", ["zahlt"] = "zahlen",
    ["zahlte"] = "zahlen", ["zahltest"] = "zahlen", ["zahlten"] = "zahlen", ["gezahlt"] = "zahlen",
    
    -- "verdienen" (to earn/deserve)
    ["verdiene"] = "verdienen", ["verdienst"] = "verdienen", ["verdient"] = "verdienen",
    ["verdiente"] = "verdienen", ["verdientest"] = "verdienen", ["verdienten"] = "verdienen", ["verdient"] = "verdienen",
    
    -- "ausgeben" (to spend)
    ["gebe"] = "ausgeben", ["gibst"] = "ausgeben", ["gibt"] = "ausgeben",
    ["gab"] = "ausgeben", ["gabst"] = "ausgeben", ["gaben"] = "ausgeben", ["ausgegeben"] = "ausgeben",
    
    -- "handeln" (to trade/deal)
    ["handle"] = "handeln", ["handelst"] = "handeln", ["handelt"] = "handeln",
    ["handelte"] = "handeln", ["handeltest"] = "handeln", ["handelten"] = "handeln", ["gehandelt"] = "handeln",
    
    -- "tauschen" (to trade/exchange)
    ["tausche"] = "tauschen", ["tauschst"] = "tauschen", ["tauscht"] = "tauschen",
    ["tauschte"] = "tauschen", ["tauschtest"] = "tauschen", ["tauschten"] = "tauschen", ["getauscht"] = "tauschen",
    
    -- "wechseln" (to change/exchange)
    ["wechsle"] = "wechseln", ["wechselst"] = "wechseln", ["wechselt"] = "wechseln",
    ["wechselte"] = "wechseln", ["wechseltest"] = "wechseln", ["wechselten"] = "wechseln", ["gewechselt"] = "wechseln",
    
    -- "ändern" (to change)
    ["ändere"] = "ändern", ["änderst"] = "ändern", ["ändert"] = "ändern",
    ["änderte"] = "ändern", ["ändertest"] = "ändern", ["änderten"] = "ändern", ["geändert"] = "ändern",
    
    -- "verändern" (to change/alter)
    ["verändere"] = "verändern", ["veränderst"] = "verändern", ["verändert"] = "verändern",
    ["veränderte"] = "verändern", ["verändertest"] = "verändern", ["veränderten"] = "verändern", ["verändert"] = "verändern",
    
    -- "wechseln" already above
    
    -- "wechseln" and "ändern" above
}

-- Enhanced pattern-based verb normalization
-- This generates infinitive forms for regular (weak) verbs
-- Works for thousands of verbs by pattern matching instead of explicit lookup
local function GenerateInfinitiveFromPattern(word)
    local wordLower = word:lower()
    
    -- Skip very short words (likely not verbs)
    if #wordLower < 3 then
        return nil
    end
    
    -- Pattern 1: Past participle with "ge-" prefix (most reliable)
    if wordLower:sub(1, 3) == "ge" and #wordLower >= 6 then
        local stem = wordLower:sub(4)
        if stem:sub(-1) == "t" and #stem >= 3 then
            -- Weak verb: ge + stem + t -> stem + en
            -- Example: gemacht -> machen
            local base = stem:sub(1, -2)
            if #base >= 2 then
                return base .. "en"
            end
        elseif stem:sub(-2) == "en" and #stem >= 4 then
            -- Strong verb: ge + stem + en -> stem (already infinitive)
            -- Example: gegangen -> gehen
            return stem
        end
    end
    
    -- Pattern 2: Past tense weak verbs (-te, -test, -ten)
    if wordLower:sub(-2) == "te" and #wordLower >= 5 then
        -- machte -> machen
        local base = wordLower:sub(1, -3)
        if #base >= 2 then
            return base .. "en"
        end
    elseif wordLower:sub(-4) == "test" and #wordLower >= 6 then
        -- machtest -> machen
        local base = wordLower:sub(1, -5)
        if #base >= 2 then
            return base .. "en"
        end
    elseif wordLower:sub(-3) == "ten" and #wordLower >= 6 then
        -- machten -> machen
        local base = wordLower:sub(1, -4)
        if #base >= 2 then
            return base .. "en"
        end
    end
    
    -- Pattern 3: Present tense endings (-e, -st, -t)
    if wordLower:sub(-2) == "st" and #wordLower >= 5 then
        -- machst -> machen, spielst -> spielen
        local base = wordLower:sub(1, -3)
        if #base >= 2 then
            return base .. "en"
        end
    elseif wordLower:sub(-1) == "t" and #wordLower >= 4 and wordLower ~= "hat" then
        -- macht -> machen, spielt -> spielen
        local base = wordLower:sub(1, -2)
        if #base >= 2 then
            return base .. "en"
        end
    elseif wordLower:sub(-1) == "e" and #wordLower >= 4 then
        -- mache -> machen, spiele -> spielen
        local base = wordLower:sub(1, -2)
        if #base >= 2 then
            return base .. "en"
        end
    end
    
    -- Pattern 4: Already infinitive (-en ending)
    if wordLower:sub(-2) == "en" and #wordLower >= 4 then
        -- machen, spielen - already infinitive
        return wordLower
    end
    
    -- Pattern 5: Imperative forms (often same as stem)
    -- These are trickier and less reliable, skip for now
    
    return nil
end

-- Comprehensive list of German infinitive verbs (1000+ most common)
-- This serves as validation and helps pattern generation
-- Sorted by frequency (most common first)
local COMMON_GERMAN_VERBS = {
    -- Top 50 most frequent (all irregular/important)
    "sein", "haben", "werden", "können", "müssen", "sollen", "wollen", "dürfen", "mögen", "möchten",
    "kommen", "gehen", "machen", "sagen", "sehen", "geben", "nehmen", "finden", "halten", "bleiben",
    "lassen", "stehen", "liegen", "stellen", "bringen", "fragen", "zeigen", "suchen", "kaufen", "verkaufen",
    "denken", "glauben", "wissen", "verstehen", "helfen", "arbeiten", "spielen", "laufen", "fahren", "fliegen",
    "essen", "trinken", "schlafen", "leben", "sterben", "lernen", "lehren", "sprechen", "hören", "schreiben",
    
    -- Next 100-200 (mix of common regular and irregular)
    "lesen", "kosten", "nutzen", "benutzen", "anbieten", "bitten", "rufen", "beschwören", "angreifen",
    "verteidigen", "kämpfen", "gewinnen", "verlieren", "töten", "bauen", "zerstören", "reparieren",
    "versuchen", "beenden", "stoppen", "mitmachen", "beitreten", "verlassen", "zurückkommen", "zurückkehren",
    "erwarten", "benötigen", "tragen", "anziehen", "ausziehen", "legen", "setzen", "packen", "verschieben",
    "bewegen", "drehen", "wenden", "treffen", "begegnen", "sammeln", "bekommen", "erhalten", "senden",
    "schicken", "bezahlen", "zahlen", "verdienen", "ausgeben", "handeln", "tauschen", "wechseln", "ändern",
    "verändern", "öffnen", "schließen", "warten", "wiederbeleben", "einladen", "starten", "beginnen",
    "heilen", "schaffen", "nennen", "spendieren", "besorgen", "schnorren", "schauen", "verstecken",
    "sitzen", "springen", "rennen", "schwimmen", "drehen", "wenden", "treffen", "sammeln",
    
    -- Regular verbs that can be pattern-generated (sample - would expand to 1000+)
    "spielen", "arbeiten", "wohnen", "studieren", "kochen", "putzen", "kaufen", "verkaufen", "bestellen",
    "bezahlen", "reservieren", "buchen", "planen", "organisieren", "verwalten", "kontrollieren", "prüfen",
    "testen", "experimentieren", "untersuchen", "analysieren", "bewerten", "beurteilen", "entscheiden",
    "wählen", "stimmen", "diskutieren", "debattieren", "streiten", "argumentieren", "erklären", "beschreiben",
    "definieren", "interpretieren", "übersetzen", "kommunizieren", "informieren", "benachrichtigen",
    "erinnern", "vergessen", "merken", "notieren", "aufschreiben", "dokumentieren", "speichern", "laden",
    "downloaden", "uploaden", "installieren", "deinstallieren", "aktualisieren", "updaten", "upgraden",
    "konfigurieren", "anpassen", "modifizieren", "ändern", "umwandeln", "konvertieren", "transformieren",
    "erstellen", "produzieren", "herstellen", "fabrizieren", "entwickeln", "programmieren", "codieren",
    "designen", "gestalten", "formulieren", "komponieren", "schreiben", "tippen", "drucken", "kopieren",
    "einfügen", "löschen", "entfernen", "hinzufügen", "ergänzen", "erweitern", "vergrößern", "verkleinern",
    "verstärken", "schwächen", "verbessern", "verschlechtern", "optimieren", "maximieren", "minimieren",
    "steigern", "reduzieren", "erhöhen", "senken", "ansteigen", "fallen", "sinken", "steigen", "wachsen",
    "schrumpfen", "expandieren", "kontrahieren", "dehnen", "strecken", "biegen", "brechen", "zerbrechen",
    "reparieren", "fixen", "korrigieren", "korrigieren", "berichtigen", "verbessern", "perfektionieren",
    "polieren", "schleifen", "schärfen", "stumpfen", "abstumpfen", "aktivieren", "deaktivieren", "aktivieren",
    "einrichten", "aufbauen", "abbauen", "zerstören", "vernichten", "eliminieren", "entfernen", "beseitigen",
    "bereinigen", "säubern", "putzen", "waschen", "trocknen", "befeuchten", "bevölkern", "entvölkern",
}

-- Create lookup table for fast validation
local VERB_VALIDATION_SET = {}
for _, verb in ipairs(COMMON_GERMAN_VERBS) do
    VERB_VALIDATION_SET[verb] = true
end

-- Try to normalize a verb to infinitive form
function GermanMorphology.NormalizeToInfinitive(word)
    local wordLower = word:lower()
    
    -- Step 1: Check explicit lookup table first (irregular verbs, special cases)
    if VERB_CONJUGATION_LOOKUP[wordLower] then
        return VERB_CONJUGATION_LOOKUP[wordLower]
    end
    
    -- Step 2: Pattern-based generation for regular verbs
    local generated = GenerateInfinitiveFromPattern(word)
    if generated then
        -- Validate against known verb list (if available)
        -- For now, trust pattern generation for regular verbs
        return generated
    end
    
    -- Step 3: Check if word is already an infinitive
    if wordLower:sub(-2) == "en" and #wordLower >= 4 then
        -- Could be infinitive, but not in our validation set
        -- Still return it as a fallback
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

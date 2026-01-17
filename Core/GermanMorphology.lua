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

-- Try to normalize a verb to infinitive form
function GermanMorphology.NormalizeToInfinitive(word)
    local wordLower = word:lower()
    
    -- Special irregular verbs
    local irregularVerbs = {
        ["wurdest"] = "werden",
        ["wurde"] = "werden",
        ["wurden"] = "werden",
        ["warst"] = "sein",
        ["war"] = "sein",
        ["waren"] = "sein",
        ["ist"] = "sein",
        ["sind"] = "sein",
        ["bin"] = "sein",
        ["bist"] = "sein",
        ["hat"] = "haben",
        ["hast"] = "haben",
        ["hab"] = "haben",
        ["habe"] = "haben",
        ["geht"] = "gehen",
        ["gehe"] = "gehen",
        ["gehst"] = "gehen",
        ["macht"] = "machen",
        ["mache"] = "machen",
        ["machst"] = "machen",
        ["sage"] = "sagen",
        ["sagst"] = "sagen",
        ["sagt"] = "sagen",
        ["gelassen"] = "lassen",
    }
    
    if irregularVerbs[wordLower] then
        return irregularVerbs[wordLower]
    end
    
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

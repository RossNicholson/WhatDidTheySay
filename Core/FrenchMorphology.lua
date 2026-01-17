-- French Morphology Helper
-- Provides utilities for French word forms, verb conjugation, and morphological analysis
-- This helps improve translation accuracy by recognizing word variations

local FrenchMorphology = {}

-- Common French verb endings for conjugation patterns
FrenchMorphology.VERB_ENDINGS = {
    -- Present tense (-er verbs: parler, chercher)
    ["e"] = "first_person_singular", -- je parle, je cherche
    ["es"] = "second_person_singular", -- tu parles, tu cherches
    ["ent"] = "third_person_plural", -- ils/elles parlent, cherchent
    
    -- Present tense (-ir verbs: finir, partir)
    ["is"] = "first_person_singular", -- je finis
    ["it"] = "third_person_singular", -- il/elle finit
    ["issons"] = "first_person_plural", -- nous finissons
    ["issez"] = "second_person_plural", -- vous finissez
    ["issent"] = "third_person_plural", -- ils/elles finissent
    
    -- Present tense (-re verbs: vendre, rendre)
    ["s"] = "first_person_singular_re", -- je vends
    ["ons"] = "first_person_plural", -- nous vendons
    ["ez"] = "second_person_plural", -- vous vendez
    
    -- Past participle (-é, -i, -u endings)
    ["é"] = "past_participle_er", -- parlé, cherché
    ["ée"] = "past_participle_er_feminine", -- parlée, cherchée
    ["és"] = "past_participle_er_plural", -- parlés
    ["ées"] = "past_participle_er_feminine_plural", -- parlées
    ["i"] = "past_participle_ir", -- fini, parti
    ["ie"] = "past_participle_ir_feminine", -- finie
    ["is"] = "past_participle_ir_plural", -- finis
    ["ies"] = "past_participle_ir_feminine_plural", -- finies
    ["u"] = "past_participle_re", -- vendu, rendu
    ["ue"] = "past_participle_re_feminine", -- vendue
    ["us"] = "past_participle_re_plural", -- vendus
    ["ues"] = "past_participle_re_feminine_plural", -- vendues
    
    -- Infinitive endings
    ["er"] = "infinitive_er", -- parler, chercher
    ["ir"] = "infinitive_ir", -- finir, partir
    ["re"] = "infinitive_re", -- vendre, rendre
    ["oir"] = "infinitive_oir", -- pouvoir, vouloir, voir
}

-- Try to extract verb stem and detect conjugation
function FrenchMorphology.ExtractVerbStem(word)
    local wordLower = word:lower()
    
    -- Remove infinitive endings
    if wordLower:sub(-2) == "er" and #wordLower >= 4 then
        return wordLower:sub(1, -3), "infinitive_er"
    elseif wordLower:sub(-2) == "ir" and #wordLower >= 4 then
        return wordLower:sub(1, -3), "infinitive_ir"
    elseif wordLower:sub(-2) == "re" and #wordLower >= 4 then
        return wordLower:sub(1, -3), "infinitive_re"
    elseif wordLower:sub(-3) == "oir" and #wordLower >= 5 then
        return wordLower:sub(1, -4), "infinitive_oir"
    end
    
    -- Remove present tense endings (-er verbs)
    if wordLower:sub(-3) == "ent" and #wordLower >= 6 then
        return wordLower:sub(1, -4), "third_person_plural"
    elseif wordLower:sub(-2) == "es" and #wordLower >= 5 then
        return wordLower:sub(1, -3), "second_person_singular"
    elseif wordLower:sub(-1) == "e" and #wordLower >= 4 then
        return wordLower:sub(1, -2), "first_person_singular"
    end
    
    -- Remove present tense endings (-ir verbs)
    if wordLower:sub(-6) == "issons" and #wordLower >= 9 then
        return wordLower:sub(1, -7), "first_person_plural"
    elseif wordLower:sub(-5) == "issez" and #wordLower >= 8 then
        return wordLower:sub(1, -6), "second_person_plural"
    elseif wordLower:sub(-6) == "issent" and #wordLower >= 9 then
        return wordLower:sub(1, -7), "third_person_plural"
    elseif wordLower:sub(-2) == "it" and #wordLower >= 5 then
        return wordLower:sub(1, -3), "third_person_singular"
    elseif wordLower:sub(-2) == "is" and #wordLower >= 5 then
        return wordLower:sub(1, -3), "first_person_singular"
    end
    
    -- Remove present tense endings (-re verbs)
    if wordLower:sub(-3) == "ons" and #wordLower >= 6 then
        return wordLower:sub(1, -4), "first_person_plural"
    elseif wordLower:sub(-2) == "ez" and #wordLower >= 5 then
        return wordLower:sub(1, -3), "second_person_plural"
    elseif wordLower:sub(-1) == "s" and #wordLower >= 4 then
        -- Could be first person singular (-re) or plural past participle
        return wordLower:sub(1, -2), "first_person_singular_re"
    end
    
    -- Remove past participle endings
    if wordLower:sub(-3) == "ées" and #wordLower >= 6 then
        return wordLower:sub(1, -4), "past_participle_er_feminine_plural"
    elseif wordLower:sub(-3) == "ées" and #wordLower >= 6 then
        return wordLower:sub(1, -4), "past_participle_ir_feminine_plural"
    elseif wordLower:sub(-3) == "ues" and #wordLower >= 6 then
        return wordLower:sub(1, -4), "past_participle_re_feminine_plural"
    elseif wordLower:sub(-2) == "ée" and #wordLower >= 5 then
        return wordLower:sub(1, -3), "past_participle_er_feminine"
    elseif wordLower:sub(-2) == "ie" and #wordLower >= 5 then
        return wordLower:sub(1, -3), "past_participle_ir_feminine"
    elseif wordLower:sub(-2) == "ue" and #wordLower >= 5 then
        return wordLower:sub(1, -3), "past_participle_re_feminine"
    elseif wordLower:sub(-2) == "és" and #wordLower >= 5 then
        return wordLower:sub(1, -3), "past_participle_er_plural"
    elseif wordLower:sub(-2) == "is" and #wordLower >= 5 then
        return wordLower:sub(1, -3), "past_participle_ir_plural"
    elseif wordLower:sub(-2) == "us" and #wordLower >= 5 then
        return wordLower:sub(1, -3), "past_participle_re_plural"
    elseif wordLower:sub(-1) == "é" and #wordLower >= 4 then
        return wordLower:sub(1, -2), "past_participle_er"
    elseif wordLower:sub(-1) == "i" and #wordLower >= 4 then
        return wordLower:sub(1, -2), "past_participle_ir"
    elseif wordLower:sub(-1) == "u" and #wordLower >= 4 then
        return wordLower:sub(1, -2), "past_participle_re"
    end
    
    return wordLower, "unknown"
end

-- Comprehensive verb conjugation lookup table
-- Maps all verb forms (present, past, participle) to their infinitive
local VERB_CONJUGATION_LOOKUP = {
    -- "être" (to be) - all forms
    ["suis"] = "être", ["es"] = "être", ["est"] = "être", ["sommes"] = "être", ["êtes"] = "être", ["sont"] = "être",
    ["étais"] = "être", ["étais"] = "être", ["était"] = "être", ["étions"] = "être", ["étiez"] = "être", ["étaient"] = "être",
    ["serai"] = "être", ["seras"] = "être", ["sera"] = "être", ["serons"] = "être", ["serez"] = "être", ["seront"] = "être",
    ["été"] = "être", ["étée"] = "être", ["étés"] = "être", ["étées"] = "être",
    
    -- "avoir" (to have) - all forms
    ["ai"] = "avoir", ["as"] = "avoir", ["a"] = "avoir", ["avons"] = "avoir", ["avez"] = "avoir", ["ont"] = "avoir",
    ["avais"] = "avoir", ["avait"] = "avoir", ["avions"] = "avoir", ["aviez"] = "avoir", ["avaient"] = "avoir",
    ["aurai"] = "avoir", ["auras"] = "avoir", ["aura"] = "avoir", ["aurons"] = "avoir", ["aurez"] = "avoir", ["auront"] = "avoir",
    ["eu"] = "avoir", ["eue"] = "avoir", ["eus"] = "avoir", ["eues"] = "avoir",
    
    -- "aller" (to go) - all forms
    ["vais"] = "aller", ["vas"] = "aller", ["va"] = "aller", ["allons"] = "aller", ["allez"] = "aller", ["vont"] = "aller",
    ["allais"] = "aller", ["allait"] = "aller", ["allions"] = "aller", ["alliez"] = "aller", ["allaient"] = "aller",
    ["irai"] = "aller", ["iras"] = "aller", ["ira"] = "aller", ["irons"] = "aller", ["irez"] = "aller", ["iront"] = "aller",
    ["allé"] = "aller", ["allée"] = "aller", ["allés"] = "aller", ["allées"] = "aller",
    
    -- "faire" (to do/make) - all forms
    ["fais"] = "faire", ["fait"] = "faire", ["faisons"] = "faire", ["faites"] = "faire", ["font"] = "faire",
    ["faisais"] = "faire", ["faisait"] = "faire", ["faisions"] = "faire", ["faisiez"] = "faire", ["faisaient"] = "faire",
    ["ferai"] = "faire", ["feras"] = "faire", ["fera"] = "faire", ["ferons"] = "faire", ["ferez"] = "faire", ["feront"] = "faire",
    ["fait"] = "faire", ["faite"] = "faire", ["faits"] = "faire", ["faites"] = "faire",
    
    -- "pouvoir" (can/to be able) - all forms
    ["peux"] = "pouvoir", ["peut"] = "pouvoir", ["pouvons"] = "pouvoir", ["pouvez"] = "pouvoir", ["peuvent"] = "pouvoir",
    ["pouvais"] = "pouvoir", ["pouvait"] = "pouvoir", ["pouvions"] = "pouvoir", ["pouviez"] = "pouvoir", ["pouvaient"] = "pouvoir",
    ["pourrai"] = "pouvoir", ["pourras"] = "pouvoir", ["pourra"] = "pouvoir", ["pourrons"] = "pouvoir", ["pourrez"] = "pouvoir", ["pourront"] = "pouvoir",
    ["pu"] = "pouvoir", ["pue"] = "pouvoir", ["pus"] = "pouvoir", ["pues"] = "pouvoir",
    
    -- "vouloir" (to want) - all forms
    ["veux"] = "vouloir", ["veut"] = "vouloir", ["voulons"] = "vouloir", ["voulez"] = "vouloir", ["veulent"] = "vouloir",
    ["voulais"] = "vouloir", ["voulait"] = "vouloir", ["voulions"] = "vouloir", ["vouliez"] = "vouloir", ["voulaient"] = "vouloir",
    ["voudrai"] = "vouloir", ["voudras"] = "vouloir", ["voudra"] = "vouloir", ["voudrons"] = "vouloir", ["voudrez"] = "vouloir", ["voudront"] = "vouloir",
    ["voulu"] = "vouloir", ["voulue"] = "vouloir", ["voulus"] = "vouloir", ["voulues"] = "vouloir",
    
    -- "devoir" (must/to have to) - all forms
    ["dois"] = "devoir", ["doit"] = "devoir", ["devons"] = "devoir", ["devez"] = "devoir", ["doivent"] = "devoir",
    ["devais"] = "devoir", ["devait"] = "devoir", ["devions"] = "devoir", ["deviez"] = "devoir", ["devaient"] = "devoir",
    ["devrai"] = "devoir", ["devras"] = "devoir", ["devra"] = "devoir", ["devrons"] = "devoir", ["devrez"] = "devoir", ["devront"] = "devoir",
    ["dû"] = "devoir", ["due"] = "devoir", ["dus"] = "devoir", ["dues"] = "devoir",
    
    -- "savoir" (to know) - common forms
    ["sais"] = "savoir", ["sait"] = "savoir", ["savons"] = "savoir", ["savez"] = "savoir", ["savent"] = "savoir",
    ["savais"] = "savoir", ["savait"] = "savoir", ["savions"] = "savoir", ["saviez"] = "savoir", ["savaient"] = "savoir",
    ["saurai"] = "savoir", ["sauras"] = "savoir", ["saura"] = "savoir", ["saurons"] = "savoir", ["saurez"] = "savoir", ["sauront"] = "savoir",
    ["su"] = "savoir", ["sue"] = "savoir", ["sus"] = "savoir", ["sues"] = "savoir",
    
    -- "venir" (to come) - common forms
    ["viens"] = "venir", ["vient"] = "venir", ["venons"] = "venir", ["venez"] = "venir", ["viennent"] = "venir",
    ["venais"] = "venir", ["venait"] = "venir", ["venions"] = "venir", ["veniez"] = "venir", ["venaient"] = "venir",
    ["viendrai"] = "venir", ["viendras"] = "venir", ["viendra"] = "venir", ["viendrons"] = "venir", ["viendrez"] = "venir", ["viendront"] = "venir",
    ["venu"] = "venir", ["venue"] = "venir", ["venus"] = "venir", ["venues"] = "venir",
    
    -- "chercher" (to look for) - common forms
    ["cherche"] = "chercher", ["cherches"] = "chercher", ["cherchons"] = "chercher", ["cherchez"] = "chercher", ["cherchent"] = "chercher",
    ["cherchais"] = "chercher", ["cherchait"] = "chercher", ["cherchions"] = "chercher", ["cherchiez"] = "chercher", ["cherchaient"] = "chercher",
    ["cherché"] = "chercher", ["cherchée"] = "chercher", ["cherchés"] = "chercher", ["cherchées"] = "chercher",
    
    -- "trouver" (to find) - common forms
    ["trouve"] = "trouver", ["trouves"] = "trouver", ["trouvons"] = "trouver", ["trouvez"] = "trouver", ["trouvent"] = "trouver",
    ["trouvais"] = "trouver", ["trouvait"] = "trouver", ["trouvions"] = "trouver", ["trouviez"] = "trouver", ["trouvaient"] = "trouver",
    ["trouvé"] = "trouver", ["trouvée"] = "trouver", ["trouvés"] = "trouver", ["trouvées"] = "trouver",
    
    -- "acheter" (to buy) - common forms
    ["achète"] = "acheter", ["achètes"] = "acheter", ["achetons"] = "acheter", ["achetez"] = "acheter", ["achètent"] = "acheter",
    ["achetais"] = "acheter", ["achetait"] = "acheter", ["achetions"] = "acheter", ["achetiez"] = "acheter", ["achetaient"] = "acheter",
    ["acheté"] = "acheter", ["achetée"] = "acheter", ["achetés"] = "acheter", ["achetées"] = "acheter",
    
    -- "vendre" (to sell) - common forms
    ["vends"] = "vendre", ["vend"] = "vendre", ["vendons"] = "vendre", ["vendez"] = "vendre", ["vendent"] = "vendre",
    ["vendais"] = "vendre", ["vendait"] = "vendre", ["vendions"] = "vendre", ["vendiez"] = "vendre", ["vendaient"] = "vendre",
    ["vendu"] = "vendre", ["vendue"] = "vendre", ["vendus"] = "vendre", ["vendues"] = "vendre",
    
    -- "partir" (to leave/go) - common forms
    ["pars"] = "partir", ["part"] = "partir", ["partons"] = "partir", ["partez"] = "partir", ["partent"] = "partir",
    ["partais"] = "partir", ["partait"] = "partir", ["partions"] = "partir", ["partiez"] = "partir", ["partaient"] = "partir",
    ["parti"] = "partir", ["partie"] = "partir", ["partis"] = "partir", ["parties"] = "partir",
    
    -- "arriver" (to arrive) - common forms
    ["arrive"] = "arriver", ["arrives"] = "arriver", ["arrivons"] = "arriver", ["arrivez"] = "arriver", ["arrivent"] = "arriver",
    ["arrivais"] = "arriver", ["arrivait"] = "arriver", ["arrivions"] = "arriver", ["arriviez"] = "arriver", ["arrivaient"] = "arriver",
    ["arrivé"] = "arriver", ["arrivée"] = "arriver", ["arrivés"] = "arriver", ["arrivées"] = "arriver",
}

-- Helper function to generate infinitive from pattern (for regular verbs)
local function GenerateInfinitiveFromPattern(word)
    local wordLower = word:lower()
    
    -- Past participle (-é, -i, -u) -> infinitive
    if wordLower:sub(-2) == "ée" or wordLower:sub(-3) == "ées" or wordLower:sub(-1) == "é" or wordLower:sub(-2) == "és" then
        local stem = wordLower:gsub("[ée]+s?$", "")
        return stem .. "er"
    elseif wordLower:sub(-2) == "ie" or wordLower:sub(-3) == "ies" or wordLower:sub(-1) == "i" or wordLower:sub(-2) == "is" then
        local stem = wordLower:gsub("[ie]+s?$", "")
        return stem .. "ir"
    elseif wordLower:sub(-2) == "ue" or wordLower:sub(-3) == "ues" or wordLower:sub(-1) == "u" or wordLower:sub(-2) == "us" then
        local stem = wordLower:gsub("[ue]+s?$", "")
        return stem .. "re"
    end
    
    -- Present tense -er verbs: remove -e, -es, -ent, add -er
    if wordLower:sub(-3) == "ent" then
        return wordLower:sub(1, -4) .. "er"
    elseif wordLower:sub(-2) == "es" then
        return wordLower:sub(1, -3) .. "er"
    elseif wordLower:sub(-1) == "e" and #wordLower >= 4 then
        return wordLower:sub(1, -2) .. "er"
    end
    
    -- Present tense -ir verbs: remove -is, -it, -issons, -issez, -issent, add -ir
    if wordLower:sub(-6) == "issent" then
        return wordLower:sub(1, -7) .. "ir"
    elseif wordLower:sub(-5) == "issez" then
        return wordLower:sub(1, -6) .. "ir"
    elseif wordLower:sub(-6) == "issons" then
        return wordLower:sub(1, -7) .. "ir"
    elseif wordLower:sub(-2) == "it" then
        return wordLower:sub(1, -3) .. "ir"
    elseif wordLower:sub(-2) == "is" and #wordLower >= 4 then
        return wordLower:sub(1, -3) .. "ir"
    end
    
    -- Present tense -re verbs: remove -s, -ons, -ez, add -re
    if wordLower:sub(-3) == "ons" then
        return wordLower:sub(1, -4) .. "re"
    elseif wordLower:sub(-2) == "ez" then
        return wordLower:sub(1, -3) .. "re"
    elseif wordLower:sub(-1) == "s" and #wordLower >= 4 then
        return wordLower:sub(1, -2) .. "re"
    end
    
    return nil
end

-- Try to normalize a verb to infinitive form
function FrenchMorphology.NormalizeToInfinitive(word)
    local wordLower = word:lower()
    
    -- Step 1: Check explicit lookup table first (irregular verbs, special cases)
    if VERB_CONJUGATION_LOOKUP[wordLower] then
        return VERB_CONJUGATION_LOOKUP[wordLower]
    end
    
    -- Step 2: Pattern-based generation for regular verbs
    local generated = GenerateInfinitiveFromPattern(word)
    if generated then
        return generated
    end
    
    -- Step 3: Check if word is already an infinitive
    if wordLower:sub(-2) == "er" or wordLower:sub(-2) == "ir" or wordLower:sub(-2) == "re" or wordLower:sub(-3) == "oir" then
        if #wordLower >= 4 then
            return wordLower
        end
    end
    
    return nil
end

WDTS_FrenchMorphology = FrenchMorphology

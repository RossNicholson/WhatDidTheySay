-- WhatDidTheySay - Dependency Parser
-- Parses German sentences into dependency trees showing grammatical relationships
-- This enables structure-based translation instead of word-by-word translation

local DependencyParser = {}

-- Dependency relationships
DependencyParser.RELATIONS = {
    -- Core relationships
    SUBJ = "subj",           -- Subject
    VERB = "verb",           -- Main verb
    OBJ = "obj",             -- Direct object
    OBJ2 = "obj2",           -- Indirect object
    PREP = "prep",           -- Prepositional phrase
    MOD = "mod",             -- Modifier (adjective, adverb)
    
    -- Complex structures
    RELCL = "relcl",         -- Relative clause
    SUBCL = "subcl",         -- Subordinate clause
    CONJ = "conj",           -- Conjunction
    AUX = "aux",             -- Auxiliary verb
    
    -- German-specific
    SEPARABLE_PREFIX = "separable_prefix",  -- Separable verb prefix
    PARTICIPLE = "participle",              -- Past participle
    INFINITIVE = "infinitive",              -- Infinitive verb
}

-- Dependency node structure
-- {
--     word = "gehe",
--     pos = "VERB",
--     index = 2,
--     dependencies = {
--         {relation = "subj", target = 1},  -- "ich" is subject
--         {relation = "prep", target = 3},  -- "nach Stormwind" is prep phrase
--     }
-- }

-- Parse a sentence into a dependency tree
-- Input: tokens (from Tokenizer)
-- Output: dependency tree (array of nodes with dependencies)
function DependencyParser.Parse(tokens)
    if not tokens or #tokens == 0 then
        return {}
    end
    
    local nodes = {}
    
    -- Create initial nodes for each word token
    local nodeMap = {}  -- Map token index to node index
    local nodeIndex = 1
    for i, token in ipairs(tokens) do
        if token.type == "word" then
            nodes[nodeIndex] = {
                word = token.value:lower(),
                original = token.original,
                pos = DependencyParser._GuessPOS(token.value:lower()),
                tokenIndex = i,  -- Original token position
                nodeIndex = nodeIndex,  -- Node position in nodes array
                dependencies = {},
            }
            nodeMap[i] = nodeIndex
            nodeIndex = nodeIndex + 1
        end
    end
    
    -- Build dependency relationships for simple sentences
    -- German word order: V2 (verb in second position in main clauses)
    -- Pattern: [SUBJ/Topic] [VERB] [OBJ/PREP/MOD]
    
    local verbNode = nil
    local verbIndex = nil
    
    -- Step 1: Find the main verb
    for i, node in pairs(nodes) do
        if node.pos == "VERB" and not verbNode then
            verbNode = node
            verbIndex = i
            break
        end
    end
    
    if not verbNode then
        -- No verb found, return nodes without dependencies
        return nodes
    end
    
    -- Step 2: Find subject (typically before verb in V2 word order)
    -- Look for nominative pronouns (ich, du, er, sie, es, wir, ihr)
    -- or nouns with nominative articles (der, die, das)
    for i = verbIndex - 1, 1, -1 do
        local node = nodes[i]
        if node then
            if node.pos == "PRONOUN" then
                -- Nominative pronouns: ich, du, er, sie (singular), es, wir, ihr, sie (plural)
                local nomPronouns = {
                    ["ich"] = true, ["du"] = true, ["er"] = true,
                    ["sie"] = true, ["es"] = true, ["wir"] = true, ["ihr"] = true
                }
                if nomPronouns[node.word] then
                    -- Add SUBJ dependency
                    verbNode.dependencies[#verbNode.dependencies + 1] = {
                        relation = DependencyParser.RELATIONS.SUBJ,
                        target = i,
                    }
                    break
                end
            elseif node.pos == "NOUN" or node.pos == "ARTICLE" then
                -- Could be subject noun phrase
                -- Simple heuristic: if article or noun before verb, likely subject
                if i == verbIndex - 1 or (nodes[i-1] and nodes[i-1].pos == "ARTICLE") then
                    verbNode.dependencies[#verbNode.dependencies + 1] = {
                        relation = DependencyParser.RELATIONS.SUBJ,
                        target = i,
                    }
                    break
                end
            end
        end
    end
    
    -- Step 3: Find objects and prepositional phrases (after verb)
    local i = verbIndex + 1
    while nodes[i] do
        local node = nodes[i]
        
        -- Prepositional phrases: PREP + (ARTICLE) + NOUN
        if node.pos == "PREP" then
            -- Check if preposition has a noun phrase following
            local prepPhraseEnd = i + 1
            -- Check for article + noun (e.g., "nach dem Markt")
            if nodes[i+1] and nodes[i+1].pos == "ARTICLE" and nodes[i+2] and nodes[i+2].pos == "NOUN" then
                prepPhraseEnd = i + 2
            -- Check for just noun (e.g., "nach Stormwind")
            elseif nodes[i+1] and nodes[i+1].pos == "NOUN" then
                prepPhraseEnd = i + 1
            end
            
            if prepPhraseEnd > i then
                -- Found prepositional phrase
                verbNode.dependencies[#verbNode.dependencies + 1] = {
                    relation = DependencyParser.RELATIONS.PREP,
                    target = i,  -- Points to preposition (head of phrase)
                    phraseEnd = prepPhraseEnd,  -- End of phrase for reference
                }
                i = prepPhraseEnd + 1
            else
                i = i + 1
            end
        -- Direct object (accusative pronoun or noun phrase)
        elseif node.pos == "PRONOUN" then
            -- Check pronoun case
            local pronounCase = DependencyParser.GetPronounCase(node.word) or DependencyParser.GetPronounCase(node.original)
            if pronounCase == "acc" then
                -- Accusative pronoun = direct object
                verbNode.dependencies[#verbNode.dependencies + 1] = {
                    relation = DependencyParser.RELATIONS.OBJ,
                    target = i,
                }
                i = i + 1
            elseif pronounCase == "dat" then
                -- Dative pronoun = indirect object
                verbNode.dependencies[#verbNode.dependencies + 1] = {
                    relation = DependencyParser.RELATIONS.OBJ2,
                    target = i,
                }
                i = i + 1
            else
                i = i + 1
            end
        -- Noun phrase: ARTICLE + NOUN or just NOUN
        elseif node.pos == "NOUN" or node.pos == "ARTICLE" then
            -- Check if this is part of a noun phrase
            local nounPhraseStart = i
            local nounPhraseEnd = i
            
            -- If article, check if noun follows
            if node.pos == "ARTICLE" and nodes[i+1] and nodes[i+1].pos == "NOUN" then
                nounPhraseEnd = i + 1
            -- If noun, check if article precedes
            elseif node.pos == "NOUN" and nodes[i-1] and nodes[i-1].pos == "ARTICLE" then
                -- Noun phrase already started with article, skip
                i = i + 1
            else
                -- Standalone noun, likely object
                verbNode.dependencies[#verbNode.dependencies + 1] = {
                    relation = DependencyParser.RELATIONS.OBJ,
                    target = nounPhraseStart,
                }
                i = nounPhraseEnd + 1
            end
        else
            i = i + 1
        end
    end
    
    return nodes
end

-- German grammar constants
DependencyParser.GERMAN_ARTICLES = {
    -- Definite articles
    ["der"] = "def_masc_nom",
    ["die"] = "def_fem_nom_acc",
    ["das"] = "def_neut_nom_acc",
    ["den"] = "def_masc_acc",
    ["dem"] = "def_dat",
    ["des"] = "def_gen",
    -- Indefinite articles
    ["ein"] = "indef_masc_nom",
    ["eine"] = "indef_fem_nom_acc",
    ["einen"] = "indef_masc_acc",
    ["einer"] = "indef_dat",
    ["einem"] = "indef_dat",
    ["eines"] = "indef_gen",
}

DependencyParser.GERMAN_PREPOSITIONS = {
    -- Accusative prepositions
    ["durch"] = "acc", ["für"] = "acc", ["gegen"] = "acc",
    ["ohne"] = "acc", ["um"] = "acc", ["bis"] = "acc",
    -- Dative prepositions
    ["aus"] = "dat", ["außer"] = "dat", ["bei"] = "dat",
    ["mit"] = "dat", ["nach"] = "dat", ["seit"] = "dat",
    ["von"] = "dat", ["zu"] = "dat", ["gegenüber"] = "dat",
    -- Two-way (accusative or dative)
    ["an"] = "two_way", ["auf"] = "two_way", ["hinter"] = "two_way",
    ["in"] = "two_way", ["neben"] = "two_way", ["über"] = "two_way",
    ["unter"] = "two_way", ["vor"] = "two_way", ["zwischen"] = "two_way",
}

DependencyParser.GERMAN_PRONOUNS = {
    -- Nominative (subject)
    nom = {["ich"] = true, ["du"] = true, ["er"] = true,
           ["sie"] = true, ["es"] = true, ["wir"] = true,
           ["ihr"] = true, ["Sie"] = true},
    -- Accusative (direct object)
    acc = {["mich"] = true, ["dich"] = true, ["ihn"] = true,
           ["sie"] = true, ["es"] = true, ["uns"] = true,
           ["euch"] = true, ["Sie"] = true},
    -- Dative (indirect object)
    dat = {["mir"] = true, ["dir"] = true, ["ihm"] = true,
           ["ihr"] = true, ["ihm"] = true, ["uns"] = true,
           ["euch"] = true, ["Ihnen"] = true},
}

-- Guess part-of-speech (enhanced with German grammar)
function DependencyParser._GuessPOS(word)
    local wordLower = word:lower()
    
    -- Check articles first
    if DependencyParser.GERMAN_ARTICLES[wordLower] then
        return "ARTICLE"
    end
    
    -- Check prepositions
    if DependencyParser.GERMAN_PREPOSITIONS[wordLower] then
        return "PREP"
    end
    
    -- Check pronouns
    if DependencyParser.GERMAN_PRONOUNS.nom[wordLower] or
       DependencyParser.GERMAN_PRONOUNS.nom[word] then
        return "PRONOUN"
    end
    if DependencyParser.GERMAN_PRONOUNS.acc[wordLower] or
       DependencyParser.GERMAN_PRONOUNS.acc[word] then
        return "PRONOUN"
    end
    if DependencyParser.GERMAN_PRONOUNS.dat[wordLower] or
       DependencyParser.GERMAN_PRONOUNS.dat[word] then
        return "PRONOUN"
    end
    
    -- Verb endings (common patterns)
    -- Past participle: ge- prefix
    if wordLower:sub(1, 3) == "ge" and (wordLower:sub(-1) == "t" or wordLower:sub(-2) == "en") then
        return "VERB"
    end
    -- Present tense: -en, -st, -t, -e endings
    if wordLower:match("en$") or wordLower:match("st$") or 
       wordLower:match("t$") or wordLower:match("e$") then
        -- But not if it's clearly a noun ending (length check)
        if #wordLower >= 4 then
            return "VERB"
        end
    end
    
    -- Default to NOUN (most common in German)
    return "NOUN"
end

-- Check if a word is a German article
function DependencyParser.IsArticle(word)
    local wordLower = word and word:lower() or ""
    return DependencyParser.GERMAN_ARTICLES[wordLower] ~= nil
end

-- Check if a word is a German preposition
function DependencyParser.IsPreposition(word)
    local wordLower = word and word:lower() or ""
    return DependencyParser.GERMAN_PREPOSITIONS[wordLower] ~= nil
end

-- Check if a pronoun is in a specific case
function DependencyParser.GetPronounCase(word)
    local wordLower = word and word:lower() or ""
    local wordOriginal = word or ""
    
    if DependencyParser.GERMAN_PRONOUNS.nom[wordLower] or 
       DependencyParser.GERMAN_PRONOUNS.nom[wordOriginal] then
        return "nom"
    elseif DependencyParser.GERMAN_PRONOUNS.acc[wordLower] or
            DependencyParser.GERMAN_PRONOUNS.acc[wordOriginal] then
        return "acc"
    elseif DependencyParser.GERMAN_PRONOUNS.dat[wordLower] or
            DependencyParser.GERMAN_PRONOUNS.dat[wordOriginal] then
        return "dat"
    end
    return nil
end

-- Get the root of the dependency tree (usually the main verb)
function DependencyParser.GetRoot(nodes)
    if not nodes or #nodes == 0 then
        return nil
    end
    
    -- Find the verb with most dependencies (likely the main verb)
    local root = nil
    local maxDeps = 0
    
    for i, node in pairs(nodes) do
        if node.pos == "VERB" then
            local depCount = #node.dependencies
            if depCount > maxDeps then
                maxDeps = depCount
                root = node
            end
        end
    end
    
    -- If no verb found, return first node
    return root or nodes[1]
end

-- Make module globally available (WoW addon pattern)
WDTS_DependencyParser = DependencyParser

return DependencyParser

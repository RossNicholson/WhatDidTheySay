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
        
        -- Prepositional phrases (preposition + noun)
        if node.pos == "PREP" and nodes[i+1] then
            -- Prepositional phrase: PREP + NOUN
            verbNode.dependencies[#verbNode.dependencies + 1] = {
                relation = DependencyParser.RELATIONS.PREP,
                target = i,  -- Points to preposition, will handle phrase later
            }
            i = i + 2  -- Skip preposition and its object
        -- Direct object (accusative noun/pronoun)
        elseif node.pos == "PRONOUN" or node.pos == "NOUN" then
            -- Check if it's accusative pronoun (mich, dich, ihn, sie, es, uns, euch)
            local accPronouns = {
                ["mich"] = true, ["dich"] = true, ["ihn"] = true,
                ["sie"] = true, ["es"] = true, ["uns"] = true, ["euch"] = true
            }
            if accPronouns[node.word] then
                -- Accusative pronoun = direct object
                verbNode.dependencies[#verbNode.dependencies + 1] = {
                    relation = DependencyParser.RELATIONS.OBJ,
                    target = i,
                }
                i = i + 1
            elseif node.pos == "NOUN" then
                -- Noun after verb, likely object
                verbNode.dependencies[#verbNode.dependencies + 1] = {
                    relation = DependencyParser.RELATIONS.OBJ,
                    target = i,
                }
                i = i + 1
            else
                i = i + 1
            end
        else
            i = i + 1
        end
    end
    
    return nodes
end

-- Guess part-of-speech (simplified - will be enhanced)
function DependencyParser._GuessPOS(word)
    -- Verb endings
    if word:match("en$") or word:match("st$") or word:match("t$") or word:match("e$") then
        return "VERB"
    end
    
    -- Articles
    if word == "der" or word == "die" or word == "das" or 
       word == "den" or word == "dem" or word == "des" or
       word == "ein" or word == "eine" or word == "einen" or
       word == "einer" or word == "einem" then
        return "ARTICLE"
    end
    
    -- Prepositions
    if word == "nach" or word == "von" or word == "zu" or 
       word == "in" or word == "auf" or word == "über" or
       word == "unter" or word == "für" or word == "mit" then
        return "PREP"
    end
    
    -- Pronouns
    if word == "ich" or word == "du" or word == "er" or
       word == "sie" or word == "es" or word == "wir" or
       word == "ihr" or word == "mich" or word == "dir" or
       word == "mir" or word == "dich" then
        return "PRONOUN"
    end
    
    -- Default to NOUN (most common in German)
    return "NOUN"
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

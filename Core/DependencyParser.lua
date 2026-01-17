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
    for i, token in ipairs(tokens) do
        if token.type == "word" then
            nodes[i] = {
                word = token.value:lower(),
                original = token.original,
                pos = DependencyParser._GuessPOS(token.value:lower()),
                index = i,
                dependencies = {},
            }
        end
    end
    
    -- TODO: Build dependency relationships (will implement in next chunk)
    
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

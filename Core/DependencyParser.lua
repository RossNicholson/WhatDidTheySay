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

-- German grammar constants (defined before Parse function uses them)
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

-- Subordinate clause conjunctions
DependencyParser.GERMAN_SUBORDINATE_CONJUNCTIONS = {
    ["dass"] = true,  -- "that" - introduces subordinate clause
    ["wenn"] = true,  -- "if/when" - conditional/temporal
    ["weil"] = true,  -- "because" - causal
    ["obwohl"] = true, -- "although" - concessive
    ["ob"] = true,    -- "if/whether" - indirect question
    ["als"] = true,   -- "when/as" - temporal
    ["bevor"] = true, -- "before" - temporal
    ["nachdem"] = true, -- "after" - temporal
    ["während"] = true, -- "while/during" - temporal
}

-- Question words
DependencyParser.GERMAN_QUESTION_WORDS = {
    ["wo"] = true,    -- "where"
    ["was"] = true,   -- "what"
    ["wer"] = true,   -- "who"
    ["wie"] = true,   -- "how"
    ["wann"] = true,  -- "when"
    ["warum"] = true, -- "why"
    ["wohin"] = true, -- "where to"
    ["woher"] = true, -- "where from"
    ["wessen"] = true, -- "whose"
    ["welche"] = true, -- "which"
    ["welcher"] = true, -- "which" (masc)
    ["welches"] = true, -- "which" (neut)
}

-- Relative pronouns (der, die, das, dem, den, dessen, deren)
DependencyParser.GERMAN_RELATIVE_PRONOUNS = {
    ["der"] = true, ["die"] = true, ["das"] = true,
    ["den"] = true, ["dem"] = true, ["dessen"] = true,
    ["deren"] = true,
}

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
    
    -- Build dependency relationships for simple and complex sentences
    -- German word order: V2 (verb in second position in main clauses)
    -- Pattern: [SUBJ/Topic] [VERB] [OBJ/PREP/MOD]
    
    -- Step 0: Detect if this is a question (question word at start)
    local isQuestion = false
    local questionWord = nil
    if #nodes > 0 and nodes[1] and nodes[1].pos == "QUESTION_WORD" then
        isQuestion = true
        questionWord = nodes[1]
    end
    
    -- Step 0b: Detect relative clauses and subordinate clauses
    -- Look for relative pronouns (der, die, das after comma or noun)
    -- Look for subordinate conjunctions (dass, wenn, weil, etc.)
    local relativeClauses = {}  -- {start = i, end = j, head = k}
    local subordinateClauses = {}  -- {start = i, end = j, head = k}
    
    for i, node in pairs(nodes) do
        -- Check for relative pronoun (der, die, das after comma or after noun)
        if DependencyParser.GERMAN_RELATIVE_PRONOUNS[node.word] then
            -- Check if previous token was comma or noun
            local prevTokenIdx = node.tokenIndex - 1
            if prevTokenIdx > 0 then
                local prevToken = tokens[prevTokenIdx]
                if prevToken and (prevToken.type == "punctuation" and prevToken.value == ",") then
                    -- Relative clause starts here
                    -- Find the end (next comma or end of sentence)
                    local clauseEnd = #nodes
                    for j = i + 1, #nodes do
                        local nextNode = nodes[j]
                        if nextNode and nextNode.tokenIndex then
                            local nextToken = tokens[nextNode.tokenIndex]
                            if nextToken and nextToken.type == "punctuation" and nextToken.value == "," then
                                clauseEnd = j - 1
                                break
                            end
                        end
                    end
                    table.insert(relativeClauses, {start = i, ["end"] = clauseEnd, head = i})
                end
            end
        end
        
        -- Check for subordinate conjunction (dass, wenn, weil, etc.)
        if node.pos == "CONJUNCTION" then
            -- Subordinate clause starts here
            -- Find the end (comma or end of sentence)
            local clauseEnd = #nodes
            for j = i + 1, #nodes do
                local nextNode = nodes[j]
                if nextNode and nextNode.tokenIndex then
                    local nextToken = tokens[nextNode.tokenIndex]
                    if nextToken and nextToken.type == "punctuation" and nextToken.value == "," then
                        clauseEnd = j - 1
                        break
                    end
                end
            end
            table.insert(subordinateClauses, {start = i, ["end"] = clauseEnd, head = i})
        end
    end
    
    local verbNode = nil
    local verbIndex = nil
    
    -- Step 1: Find the main verb (skip verbs in subordinate/relative clauses for now)
    for i, node in pairs(nodes) do
        if node.pos == "VERB" and not verbNode then
            -- Check if this verb is in a subordinate/relative clause
            local inSubordinate = false
            for _, subcl in ipairs(subordinateClauses) do
                if i >= subcl.start and i <= subcl.end then
                    inSubordinate = true
                    break
                end
            end
            for _, relcl in ipairs(relativeClauses) do
                if i >= relcl.start and i <= relcl["end"] then
                    inSubordinate = true
                    break
                end
            end
            
            if not inSubordinate then
                verbNode = node
                verbIndex = i
                break
            end
        end
    end
    
    -- If no main verb found, try to find any verb (for questions or complex structures)
    if not verbNode then
        for i, node in pairs(nodes) do
            if node.pos == "VERB" then
                verbNode = node
                verbIndex = i
                break
            end
        end
    end
    
    if not verbNode then
        -- No verb found, return nodes without dependencies
        return nodes
    end
    
    -- Step 2: Find subject (typically before verb in V2 word order, or after verb in questions)
    -- For questions: subject comes after verb (V1 word order: Question word + Verb + Subject)
    -- For statements: subject comes before verb (V2 word order: Subject + Verb)
    
    if isQuestion then
        -- Question: Question word + Verb + Subject
        -- Look for subject AFTER verb
        for i = verbIndex + 1, #nodes do
            local node = nodes[i]
            if node then
                -- Skip if in subordinate/relative clause
                local inSubordinate = false
                for _, subcl in ipairs(subordinateClauses) do
                    if i >= subcl.start and i <= subcl.end then
                        inSubordinate = true
                        break
                    end
                end
                if inSubordinate then
                    break
                end
                
                if node.pos == "PRONOUN" then
                    local pronounCase = DependencyParser.GetPronounCase(node.word) or DependencyParser.GetPronounCase(node.original)
                    if pronounCase == "nom" then
                        verbNode.dependencies[#verbNode.dependencies + 1] = {
                            relation = DependencyParser.RELATIONS.SUBJ,
                            target = i,
                        }
                        break
                    end
                elseif node.pos == "NOUN" or node.pos == "ARTICLE" then
                    -- Noun phrase after verb in question
                    if node.pos == "NOUN" and nodes[i-1] and nodes[i-1].pos == "ARTICLE" then
                        verbNode.dependencies[#verbNode.dependencies + 1] = {
                            relation = DependencyParser.RELATIONS.SUBJ,
                            target = i - 1,
                            phraseEnd = i,
                        }
                        break
                    elseif node.pos == "NOUN" then
                        verbNode.dependencies[#verbNode.dependencies + 1] = {
                            relation = DependencyParser.RELATIONS.SUBJ,
                            target = i,
                        }
                        break
                    end
                end
            end
        end
        
        -- Question word is also a dependency
        if questionWord then
            verbNode.dependencies[#verbNode.dependencies + 1] = {
                relation = DependencyParser.RELATIONS.MOD,  -- Question word modifies the verb
                target = 1,  -- Question word is first node
            }
        end
    else
        -- Statement: Subject + Verb (V2 word order)
        for i = verbIndex - 1, 1, -1 do
            local node = nodes[i]
            if node then
                -- Skip if in subordinate/relative clause
                local inSubordinate = false
                for _, subcl in ipairs(subordinateClauses) do
                    if i >= subcl.start and i <= subcl.end then
                        inSubordinate = true
                        break
                    end
                end
                for _, relcl in ipairs(relativeClauses) do
                    if i >= relcl.start and i <= relcl["end"] then
                        inSubordinate = true
                        break
                    end
                end
                if inSubordinate then
                    break
                end
                
                if node.pos == "PRONOUN" then
                    local pronounCase = DependencyParser.GetPronounCase(node.word) or DependencyParser.GetPronounCase(node.original)
                    if pronounCase == "nom" then
                        verbNode.dependencies[#verbNode.dependencies + 1] = {
                            relation = DependencyParser.RELATIONS.SUBJ,
                            target = i,
                        }
                        break
                    end
                elseif node.pos == "NOUN" then
                    if nodes[i-1] and nodes[i-1].pos == "ARTICLE" then
                        verbNode.dependencies[#verbNode.dependencies + 1] = {
                            relation = DependencyParser.RELATIONS.SUBJ,
                            target = i - 1,
                            phraseEnd = i,
                        }
                        break
                    elseif i == verbIndex - 1 then
                        verbNode.dependencies[#verbNode.dependencies + 1] = {
                            relation = DependencyParser.RELATIONS.SUBJ,
                            target = i,
                        }
                        break
                    end
                elseif node.pos == "ARTICLE" then
                    if nodes[i+1] and nodes[i+1].pos == "NOUN" and i + 1 < verbIndex then
                        verbNode.dependencies[#verbNode.dependencies + 1] = {
                            relation = DependencyParser.RELATIONS.SUBJ,
                            target = i,
                            phraseEnd = i + 1,
                        }
                        break
                    end
                end
            end
        end
    end
    
    -- Step 3: Handle relative clauses (attach to their head noun)
    for _, relcl in ipairs(relativeClauses) do
        -- Find the verb in the relative clause
        local relVerb = nil
        local relVerbIdx = nil
        for j = relcl.start, relcl.end do
            if nodes[j] and nodes[j].pos == "VERB" then
                relVerb = nodes[j]
                relVerbIdx = j
                break
            end
        end
        
        if relVerb then
            -- Relative clause verb depends on the relative pronoun
            relVerb.dependencies[#relVerb.dependencies + 1] = {
                relation = DependencyParser.RELATIONS.RELCL,
                target = relcl.head,  -- Points to relative pronoun
            }
            
            -- Find subject and objects in relative clause (similar to main clause)
            -- Subject of relative clause is typically the relative pronoun itself
            -- But it can also be another noun/pronoun
            -- For now, mark relative pronoun as subject of relative clause verb
            if nodes[relcl.head] then
                relVerb.dependencies[#relVerb.dependencies + 1] = {
                    relation = DependencyParser.RELATIONS.SUBJ,
                    target = relcl.head,
                }
            end
            
            -- Find objects in relative clause
            for j = relVerbIdx + 1, relcl.end do
                local relNode = nodes[j]
                if relNode then
                    if relNode.pos == "PRONOUN" then
                        local pronounCase = DependencyParser.GetPronounCase(relNode.word) or DependencyParser.GetPronounCase(relNode.original)
                        if pronounCase == "acc" then
                            relVerb.dependencies[#relVerb.dependencies + 1] = {
                                relation = DependencyParser.RELATIONS.OBJ,
                                target = j,
                            }
                        end
                    elseif relNode.pos == "NOUN" then
                        relVerb.dependencies[#relVerb.dependencies + 1] = {
                            relation = DependencyParser.RELATIONS.OBJ,
                            target = j,
                        }
                    end
                end
            end
        end
    end
    
    -- Step 4: Handle subordinate clauses (attach to main verb)
    for _, subcl in ipairs(subordinateClauses) do
        -- Find the verb in the subordinate clause
        local subVerb = nil
        local subVerbIdx = nil
        for j = subcl.start, subcl.end do
            if nodes[j] and nodes[j].pos == "VERB" then
                subVerb = nodes[j]
                subVerbIdx = j
                break
            end
        end
        
        if subVerb then
            -- Subordinate clause depends on main verb
            verbNode.dependencies[#verbNode.dependencies + 1] = {
                relation = DependencyParser.RELATIONS.SUBCL,
                target = subcl.head,  -- Points to conjunction
            }
            
            -- Subordinate clause verb depends on conjunction
            subVerb.dependencies[#subVerb.dependencies + 1] = {
                relation = DependencyParser.RELATIONS.SUBCL,
                target = subcl.head,
            }
            
            -- Find subject and objects in subordinate clause
            for j = subcl.start + 1, subVerbIdx - 1 do
                local subNode = nodes[j]
                if subNode and subNode.pos == "PRONOUN" then
                    local pronounCase = DependencyParser.GetPronounCase(subNode.word) or DependencyParser.GetPronounCase(subNode.original)
                    if pronounCase == "nom" then
                        subVerb.dependencies[#subVerb.dependencies + 1] = {
                            relation = DependencyParser.RELATIONS.SUBJ,
                            target = j,
                        }
                        break
                    end
                end
            end
            
            for j = subVerbIdx + 1, subcl.end do
                local subNode = nodes[j]
                if subNode then
                    if subNode.pos == "PRONOUN" then
                        local pronounCase = DependencyParser.GetPronounCase(subNode.word) or DependencyParser.GetPronounCase(subNode.original)
                        if pronounCase == "acc" then
                            subVerb.dependencies[#subVerb.dependencies + 1] = {
                                relation = DependencyParser.RELATIONS.OBJ,
                                target = j,
                            }
                        end
                    elseif subNode.pos == "NOUN" then
                        subVerb.dependencies[#subVerb.dependencies + 1] = {
                            relation = DependencyParser.RELATIONS.OBJ,
                            target = j,
                        }
                    end
                end
            end
        end
    end
    
    -- Step 5: Find objects and prepositional phrases (after verb, but skip subordinate/relative clauses)
    local i = verbIndex + 1
    while nodes[i] do
        local node = nodes[i]
        
        -- Skip if in subordinate/relative clause
        local inSubordinate = false
        for _, subcl in ipairs(subordinateClauses) do
            if i >= subcl.start and i <= subcl.end then
                inSubordinate = true
                break
            end
        end
        for _, relcl in ipairs(relativeClauses) do
            if i >= relcl.start and i <= relcl.end then
                inSubordinate = true
                break
            end
        end
        
        if inSubordinate then
            i = i + 1
        elseif node.pos == "PREP" then
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
    
    -- Check subordinate conjunctions
    if DependencyParser.GERMAN_SUBORDINATE_CONJUNCTIONS[wordLower] then
        return "CONJUNCTION"
    end
    
    -- Check question words
    if DependencyParser.GERMAN_QUESTION_WORDS[wordLower] then
        return "QUESTION_WORD"
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

-- WhatDidTheySay - French Language Pack - Grammar
-- Post-processing rules for French to English word order and grammar fixes

WDTS_Lang_fr_Grammar = {
    rules = {
        -- Basic word order adjustments (simple cases)
        -- "you can" -> "can you" (for questions)
        {
            from = "^you can ",
            to = "can you ",
        },
        -- Article corrections
        {
            from = " a ([aeiouAEIOU])",
            to = " an %1",
        },
        
        -- Fix double articles
        {
            from = "the the ",
            to = "the ",
        },
        {
            from = " a a ",
            to = " a ",
        },
        
        -- Fix common mistranslations
        {
            from = "the who ",
            to = "who ",
        },
        {
            from = "the that ",
            to = "that ",
        },
        
        -- Remove redundant words in some patterns
        {
            from = "has has ",
            to = "has ",
        },
        {
            from = "is is ",
            to = "is ",
        },
        
        -- ============================================
        -- FRENCH-SPECIFIC GRAMMAR RULES
        -- ============================================
        
        -- Negation: "ne...pas" → "don't/doesn't" (HIGH PRIORITY)
        -- "je ne sais pas" → "I not know" → "I don't know"
        {
            from = "^I not ",
            to = "I don't ",
            priority = 25,
        },
        {
            from = "^he not ",
            to = "he doesn't ",
            priority = 25,
        },
        {
            from = "^she not ",
            to = "she doesn't ",
            priority = 25,
        },
        {
            from = "^it not ",
            to = "it doesn't ",
            priority = 25,
        },
        {
            from = "^we not ",
            to = "we don't ",
            priority = 25,
        },
        {
            from = "^you not ",
            to = "you don't ",
            priority = 25,
        },
        {
            from = "^they not ",
            to = "they don't ",
            priority = 25,
        },
        
        -- Negation: "ne...pas" with modals/auxiliaries
        -- "je ne peux pas" → "I not can" → "I can't"
        {
            from = "^I not can ",
            to = "I can't ",
            priority = 25,
        },
        {
            from = "^he not can ",
            to = "he can't ",
            priority = 25,
        },
        {
            from = "^she not can ",
            to = "she can't ",
            priority = 25,
        },
        {
            from = "^we not can ",
            to = "we can't ",
            priority = 25,
        },
        {
            from = "^you not can ",
            to = "you can't ",
            priority = 25,
        },
        {
            from = "^they not can ",
            to = "they can't ",
            priority = 25,
        },
        
        -- Questions: "Est-ce que..." → simplified (HIGH PRIORITY)
        -- "Est-ce que tu veux?" → "Is it that you want?" → "Do you want?"
        {
            from = "^Is it that you ",
            to = "Do you ",
            priority = 20,
        },
        {
            from = "^Is it that he ",
            to = "Does he ",
            priority = 20,
        },
        {
            from = "^Is it that she ",
            to = "Does she ",
            priority = 20,
        },
        {
            from = "^Is it that it ",
            to = "Does it ",
            priority = 20,
        },
        {
            from = "^Is it that we ",
            to = "Do we ",
            priority = 20,
        },
        {
            from = "^Is it that they ",
            to = "Do they ",
            priority = 20,
        },
        
        -- "Qu'est-ce que c'est?" → "What is it that it is?" → "What is it?"
        {
            from = "^What is it that it is",
            to = "What is it",
            priority = 20,
        },
        {
            from = "^What is it that ",
            to = "What ",
            priority = 20,
        },
        
        -- "Où est-ce que" → "Where is it that" → "Where"
        {
            from = "^Where is it that ",
            to = "Where ",
            priority = 20,
        },
        
        -- "Comment est-ce que" → "How is it that" → "How"
        {
            from = "^How is it that ",
            to = "How ",
            priority = 20,
        },
        
        -- "Quand est-ce que" → "When is it that" → "When"
        {
            from = "^When is it that ",
            to = "When ",
            priority = 20,
        },
        
        -- "Pourquoi est-ce que" → "Why is it that" → "Why"
        {
            from = "^Why is it that ",
            to = "Why ",
            priority = 20,
        },
        
        -- Fix "you can me" → "can you help me" (common French → English error)
        {
            from = "you can me (.+)$",
            to = "can you help me %1",
            priority = 15,
        },
        {
            from = "you can me$",
            to = "can you help me",
            priority = 15,
        },
        
        -- Fix "you can me " → "can you help me "
        {
            from = "you can me ",
            to = "can you help me ",
            priority = 15,
        },
        
        -- Fix common French word order issues
        -- "I am not" → ensure proper negation
        {
            from = "^I am not (.+)",
            to = "I am not %1",
            priority = 10,
        },
        {
            from = "^I do not (.+)",
            to = "I do not %1",
            priority = 10,
        },
        {
            from = "^you do not (.+)",
            to = "you do not %1",
            priority = 10,
        },
        {
            from = "^we do not (.+)",
            to = "we do not %1",
            priority = 10,
        },
        {
            from = "^they do not (.+)",
            to = "they do not %1",
            priority = 10,
        },
        {
            from = "^he does not (.+)",
            to = "he does not %1",
            priority = 10,
        },
        {
            from = "^she does not (.+)",
            to = "she does not %1",
            priority = 10,
        },
        {
            from = "^it does not (.+)",
            to = "it does not %1",
            priority = 10,
        },
        
        -- Fix "there is it" → "there is" or "it is there"
        {
            from = "there is it ",
            to = "there is ",
            priority = 15,
        },
        {
            from = "there is it$",
            to = "there is",
            priority = 15,
        },
        
        -- Fix "il y a" → "there is/there are" (usually handled by phrases, but backup rule)
        {
            from = "^it there has ",
            to = "there is ",
            priority = 15,
        },
        {
            from = "^it there has",
            to = "there is",
            priority = 15,
        },
        
        -- Fix "c'est" → "it is" or "that is"
        {
            from = "^that is ",
            to = "it is ",
            priority = 10,
        },
        
        -- Fix double spaces after removing "est-ce que"
        {
            from = "  ",
            to = " ",
            priority = 5,
        },
        
        -- Common French→English word order fixes
        -- "where is is" → "where is"
        {
            from = "where is is ",
            to = "where is ",
            priority = 15,
        },
        {
            from = "where is is$",
            to = "where is",
            priority = 15,
        },
        
        -- "how is you" → "how are you"
        {
            from = "^how is you ",
            to = "how are you ",
            priority = 15,
        },
        {
            from = "^how is you$",
            to = "how are you",
            priority = 15,
        },
        
        -- "I cannot" → "I can't"
        {
            from = "^I cannot ",
            to = "I can't ",
            priority = 20,
        },
        {
            from = "^I cannot$",
            to = "I can't",
            priority = 20,
        },
        
        -- "how much costs" → "how much does it cost" / "how much does X cost"
        {
            from = "how much costs ",
            to = "how much does %1 cost ",
            priority = 20,
        },
        {
            from = "how much costs$",
            to = "how much does it cost",
            priority = 20,
        },
        
        -- "looking for one X" → "looking for a X" (when "un" → "one" but should be "a")
        {
            from = "looking for one tank",
            to = "looking for a tank",
            priority = 18,
        },
        {
            from = "looking for one heal",
            to = "looking for a heal",
            priority = 18,
        },
        {
            from = "looking for one dps",
            to = "looking for a dps",
            priority = 18,
        },
        {
            from = "looking for one ",
            to = "looking for a ",
            priority = 15,
        },
        
        -- "looking for has X" → "looking for a X" (when "un" mistranslated as "has")
        {
            from = "looking for has ",
            to = "looking for a ",
            priority = 22,
        },
        
        -- "do you X" / "does he X" consistency
        {
            from = " do you you ",
            to = " do you ",
            priority = 10,
        },
        {
            from = " does he he ",
            to = " does he ",
            priority = 10,
        },
        
        -- Remove "Est-ce que" remnants that might leak through
        {
            from = " is it that you ",
            to = " do you ",
            priority = 18,
        },
        {
            from = "^is it that you ",
            to = "do you ",
            priority = 18,
        },
        
        -- "they not" → "they don't"
        {
            from = "^they not ",
            to = "they don't ",
            priority = 25,
        },
        
        -- Double space cleanup
        {
            from = "  ",
            to = " ",
            priority = 1,
        },
    },
}

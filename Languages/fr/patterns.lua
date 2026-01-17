-- WhatDidTheySay - French Language Pack - Patterns
-- Reusable phrase structures with captures

WDTS_Lang_fr_Patterns = {
    -- "cherche X pour Y" -> "looking for X for Y"
    {
        from = "cherche (.+) pour (.+)",
        to = "looking for %1 for %2",
    },
    {
        from = "recherche (.+) pour (.+)",
        to = "looking for %1 for %2",
    },
    -- "peux-tu X" -> "can you X"
    {
        from = "peux%-tu (.+)",
        to = "can you %1",
    },
    {
        from = "peux tu (.+)",
        to = "can you %1",
    },
    {
        from = "pouvez%-vous (.+)",
        to = "can you %1",
    },
    {
        from = "pouvez vous (.+)",
        to = "can you %1",
    },
    -- "lfg X" -> "lfg X"
    {
        from = "lfg (.+)",
        to = "lfg %1",
    },
    -- "lfm X" -> "lfm X"
    {
        from = "lfm (.+)",
        to = "lfm %1",
    },
    -- "cherche X pour Y" -> "looking for X for Y" (mixed language pattern)
    {
        from = "lfg%s+(.+)%s+pour%s+(.+)",
        to = "LFG %1 for %2",
    },
    {
        from = "lfm%s+(.+)%s+pour%s+(.+)",
        to = "LFM %1 for %2",
    },
    
    -- "je cherche X pour Y" -> "I'm looking for X for Y"
    {
        from = "je cherche (.+) pour (.+)",
        to = "I'm looking for %1 for %2",
    },
    {
        from = "je recherche (.+) pour (.+)",
        to = "I'm looking for %1 for %2",
    },
    
    -- "quelqu'un peut X" -> "someone can X"
    {
        from = "quelqu'un peut (.+)",
        to = "someone can %1",
    },
    {
        from = "quelqu'un peut%-il (.+)",
        to = "can someone %1",
    },
    
    -- "combien coûte X" -> "how much does X cost"
    {
        from = "combien coûte (.+)",
        to = "how much does %1 cost",
    },
    {
        from = "combien (.+) coûte",
        to = "how much does %1 cost",
    },
    {
        from = "combien ça coûte",
        to = "how much does it cost",
    },
    
    -- "où est X" -> "where is X"
    {
        from = "où est (.+)",
        to = "where is %1",
    },
    {
        from = "où sont (.+)",
        to = "where are %1",
    },
    
    -- "je suis X" -> "I am X"
    {
        from = "je suis (.+)",
        to = "I am %1",
    },
    
    -- "nous sommes X" -> "we are X"
    {
        from = "nous sommes (.+)",
        to = "we are %1",
    },
    
    -- "vous êtes X" -> "you are X"
    {
        from = "vous êtes (.+)",
        to = "you are %1",
    },
    
    -- "il y a X" -> "there is X"
    {
        from = "il y a (.+)",
        to = "there is %1",
    },
    
    -- "il n'y a pas de X" -> "there is no X"
    {
        from = "il n'y a pas de (.+)",
        to = "there is no %1",
    },
    {
        from = "il n'y a pas (.+)",
        to = "there is no %1",
    },
    
    -- "cherche un X" -> "looking for a X"
    {
        from = "cherche un (.+)",
        to = "looking for a %1",
    },
    
    -- "cherche une X" -> "looking for a X"
    {
        from = "cherche une (.+)",
        to = "looking for a %1",
    },
    
    -- "cherche des X" -> "looking for X"
    {
        from = "cherche des (.+)",
        to = "looking for %1",
    },
    
    -- "cherche le X" -> "looking for the X"
    {
        from = "cherche le (.+)",
        to = "looking for the %1",
    },
    
    -- "cherche la X" -> "looking for the X"
    {
        from = "cherche la (.+)",
        to = "looking for the %1",
    },
    
    -- "cherche les X" -> "looking for the X"
    {
        from = "cherche les (.+)",
        to = "looking for the %1",
    },
    
    -- "veux acheter X" -> "want to buy X"
    {
        from = "veux acheter (.+)",
        to = "want to buy %1",
    },
    {
        from = "je veux acheter (.+)",
        to = "I want to buy %1",
    },
    
    -- "veux vendre X" -> "want to sell X"
    {
        from = "veux vendre (.+)",
        to = "want to sell %1",
    },
    {
        from = "je veux vendre (.+)",
        to = "I want to sell %1",
    },
    
    -- "peux-tu m'aider avec X" -> "can you help me with X"
    {
        from = "peux%-tu m'aider avec (.+)",
        to = "can you help me with %1",
    },
    {
        from = "pouvez%-vous m'aider avec (.+)",
        to = "can you help me with %1",
    },
    
    -- "peux-tu inviter X" -> "can you invite X"
    {
        from = "peux%-tu inviter (.+)",
        to = "can you invite %1",
    },
    {
        from = "pouvez%-vous inviter (.+)",
        to = "can you invite %1",
    },
    
    -- "peux-tu invoquer X" -> "can you summon X"
    {
        from = "peux%-tu invoquer (.+)",
        to = "can you summon %1",
    },
    {
        from = "pouvez%-vous invoquer (.+)",
        to = "can you summon %1",
    },
    
    -- "combien de X" -> "how many X"
    {
        from = "combien de (.+)",
        to = "how many %1",
    },
    
    -- "qui est X" -> "who is X"
    {
        from = "qui est (.+)",
        to = "who is %1",
    },
    
    -- "quand est X" -> "when is X"
    {
        from = "quand est (.+)",
        to = "when is %1",
    },
    
    -- "comment faire X" -> "how to do X"
    {
        from = "comment faire (.+)",
        to = "how to do %1",
    },
    
    -- "pourquoi X" -> "why X"
    {
        from = "pourquoi (.+)",
        to = "why %1",
    },
    
    -- Guild recruitment patterns
    {
        from = "la guilde (.+) cherche (.+)",
        to = "the guild %1 is looking for %2",
    },
    {
        from = "guilde (.+) cherche (.+)",
        to = "guild %1 is looking for %2",
    },
    
    -- Trading patterns
    {
        from = "vente (.+) (.+) or",
        to = "selling %1 %2 gold",
    },
    {
        from = "achat (.+) (.+) or",
        to = "buying %1 %2 gold",
    },
    
    -- Question patterns with "est-ce que" (HIGH PRIORITY - must match before other patterns)
    {
        from = "est%-ce que tu veux (.+)%?",
        to = "do you want %1",
        priority = 15,
    },
    {
        from = "est%-ce que tu veux (.+)",
        to = "do you want %1",
        priority = 15,
    },
    {
        from = "est%-ce que tu (.+)",
        to = "do you %1",
        priority = 14,
    },
    {
        from = "est%-ce que vous (.+)",
        to = "do you %1",
        priority = 14,
    },
    {
        from = "est%-ce qu'il (.+)",
        to = "does he %1",
        priority = 14,
    },
    {
        from = "est%-ce qu'elle (.+)",
        to = "does she %1",
        priority = 14,
    },
    
    -- "quelqu'un peut me donner X" -> "can someone give me X"
    {
        from = "quelqu'un peut me donner (.+)",
        to = "can someone give me %1",
    },
    {
        from = "quelqu'un peut me (.+) donner",
        to = "can someone give me %1",
    },
    
    -- "quelqu'un peut me téléporter à X" / "quelqu'un peut me port à X" -> "can someone port me to X"
    {
        from = "quelqu'un peut me téléporter à (.+)",
        to = "can someone port me to %1",
    },
    {
        from = "quelqu'un peut me port à (.+)",
        to = "can someone port me to %1",
    },
    {
        from = "quelqu'un peut me tp à (.+)",
        to = "can someone port me to %1",
    },
    
    -- "j'arrive dans X minutes" -> "coming in X minutes"
    {
        from = "j'arrive dans (.+) minutes",
        to = "coming in %1 minutes",
    },
    {
        from = "j'arrive dans (.+) min",
        to = "coming in %1 min",
    },
    
    -- Trading: "vente X" -> "selling X", "achat X" -> "buying X"
    {
        from = "vente (.+)",
        to = "selling %1",
    },
    {
        from = "achat (.+)",
        to = "buying %1",
    },
    {
        from = "je vends (.+)",
        to = "I'm selling %1",
    },
    {
        from = "j'achète (.+)",
        to = "I'm buying %1",
    },
    
    -- "combien pour X" -> "how much for X"
    {
        from = "combien pour (.+)",
        to = "how much for %1",
    },
    {
        from = "prix de (.+)",
        to = "price of %1",
    },
    
    -- "qui veut X" -> "who wants X"
    {
        from = "qui veut (.+)",
        to = "who wants %1",
    },
    
    -- Guild: "est-ce que tu cherches une X guilde" -> "are you looking for a X guild"
    {
        from = "est%-ce que tu cherches une (.+) guilde",
        to = "are you looking for a %1 guild",
    },
    {
        from = "tu cherches une (.+) guilde",
        to = "are you looking for a %1 guild",
    },
    
    -- "est-ce que quelqu'un peut X" -> "can someone X"
    {
        from = "est%-ce que quelqu'un peut (.+)",
        to = "can someone %1",
    },
    {
        from = "quelqu'un peut (.+)",
        to = "someone can %1",
    },
    
    -- "j'ai besoin de X" -> "I need X"
    {
        from = "j'ai besoin de (.+)",
        to = "I need %1",
    },
    {
        from = "j'ai besoin d'un (.+)",
        to = "I need a %1",
    },
    {
        from = "j'ai besoin d'une (.+)",
        to = "I need a %1",
    },
    -- "j'ai besoin de" -> "I need" (without object)
    {
        from = "j'ai besoin de$",
        to = "I need",
        priority = 20,
    },
    
    -- "il me faut X" -> "I need X"
    {
        from = "il me faut (.+)",
        to = "I need %1",
    },
    {
        from = "il me faut un (.+)",
        to = "I need a %1",
    },
    
    -- "je vais à X" -> "I'm going to X"
    {
        from = "je vais à (.+)",
        to = "I'm going to %1",
    },
    {
        from = "on va à (.+)",
        to = "we're going to %1",
    },
    {
        from = "tu vas à (.+)",
        to = "you're going to %1",
    },
    
    -- "où va X" / "où allez-vous" -> "where is X going" / "where are you going"
    {
        from = "où va (.+)",
        to = "where is %1 going",
    },
    {
        from = "où allez%-vous",
        to = "where are you going",
    },
    {
        from = "où vas%-tu",
        to = "where are you going",
    },
    
    -- "dans X minutes" -> "in X minutes"
    {
        from = "dans (.+) minutes",
        to = "in %1 minutes",
    },
    {
        from = "dans (.+) min",
        to = "in %1 min",
    },
    {
        from = "dans (.+) heure",
        to = "in %1 hour",
    },
    {
        from = "dans (.+) heures",
        to = "in %1 hours",
    },
    
    -- "je cherche X" -> "I'm looking for X"
    {
        from = "je cherche (.+)",
        to = "I'm looking for %1",
    },
    {
        from = "je recherche (.+)",
        to = "I'm looking for %1",
    },
    
    -- "on cherche X" -> "we're looking for X"
    {
        from = "on cherche (.+)",
        to = "we're looking for %1",
    },
    
    -- "il/elle cherche X" -> "he/she is looking for X"
    {
        from = "il cherche (.+)",
        to = "he's looking for %1",
    },
    {
        from = "elle cherche (.+)",
        to = "she's looking for %1",
    },
    
    -- "c'est pour X" -> "it's for X"
    {
        from = "c'est pour (.+)",
        to = "it's for %1",
    },
    
    -- "combien de X" already exists; add "combien de X il y a" -> "how many X there are"
    {
        from = "combien de (.+) il y a",
        to = "how many %1 there are",
    },
    
    -- "où peut-on X" -> "where can we X"
    {
        from = "où peut%-on (.+)",
        to = "where can we %1",
    },
    {
        from = "où on peut (.+)",
        to = "where we can %1",
    },
    
    -- "comment on fait pour X" -> "how do we do to X" / "how to X"
    {
        from = "comment on fait pour (.+)",
        to = "how do we %1",
    },
    {
        from = "comment faire pour (.+)",
        to = "how to %1",
    },
    
    -- "viens à X" / "venez à X" -> "come to X"
    {
        from = "viens à (.+)",
        to = "come to %1",
    },
    {
        from = "venez à (.+)",
        to = "come to %1",
    },
    {
        from = "viens (.+)",
        to = "come %1",
    },
    {
        from = "venez (.+)",
        to = "come %1",
    },
    
    -- "combien ça coûte" / "ça coûte combien" -> "how much does it cost"
    {
        from = "ça coûte combien",
        to = "how much does it cost",
    },
    {
        from = "combien coûte (.+)",
        to = "how much does %1 cost",
    },
    
    -- "il faut X" -> "need X" / "we need X"
    {
        from = "il faut (.+)",
        to = "need %1",
    },
    {
        from = "il faut un (.+)",
        to = "need a %1",
    },
    {
        from = "il faut une (.+)",
        to = "need a %1",
    },
    
    -- "on a besoin de X" -> "we need X"
    {
        from = "on a besoin de (.+)",
        to = "we need %1",
    },
    {
        from = "on a besoin d'un (.+)",
        to = "we need a %1",
    },
    {
        from = "on a besoin d'une (.+)",
        to = "we need a %1",
    },
    
    -- "tu peux X" / "vous pouvez X" -> "can you X"
    {
        from = "tu peux (.+)",
        to = "can you %1",
    },
    {
        from = "vous pouvez (.+)",
        to = "can you %1",
    },
    {
        from = "est%-ce que tu peux (.+)",
        to = "can you %1",
    },
    {
        from = "est%-ce que vous pouvez (.+)",
        to = "can you %1",
    },
    
    -- "je peux X" -> "I can X"
    {
        from = "je peux (.+)",
        to = "I can %1",
    },
    {
        from = "on peut (.+)",
        to = "we can %1",
    },
    
    -- "il/elle peut X" -> "he/she can X"
    {
        from = "il peut (.+)",
        to = "he can %1",
    },
    {
        from = "elle peut (.+)",
        to = "she can %1",
    },
    
    -- "il y a X qui" -> "there is X who" / "there are X who"
    {
        from = "il y a (.+) qui (.+)",
        to = "there is %1 who %2",
    },
    
    -- "c'est X" -> "it's X"
    {
        from = "c'est un (.+)",
        to = "it's a %1",
    },
    {
        from = "c'est une (.+)",
        to = "it's a %1",
    },
    
    -- ============================================
    -- PAST TENSE PATTERNS (Passé Composé)
    -- ============================================
    -- "j'ai fait X" -> "I did X"
    {
        from = "j'ai fait (.+)",
        to = "I did %1",
        priority = 10,
    },
    {
        from = "tu as fait (.+)",
        to = "you did %1",
        priority = 10,
    },
    {
        from = "il a fait (.+)",
        to = "he did %1",
        priority = 10,
    },
    {
        from = "elle a fait (.+)",
        to = "she did %1",
        priority = 10,
    },
    {
        from = "nous avons fait (.+)",
        to = "we did %1",
        priority = 10,
    },
    {
        from = "vous avez fait (.+)",
        to = "you did %1",
        priority = 10,
    },
    {
        from = "ils ont fait (.+)",
        to = "they did %1",
        priority = 10,
    },
    
    -- "j'ai dit X" -> "I said X"
    {
        from = "j'ai dit (.+)",
        to = "I said %1",
        priority = 10,
    },
    {
        from = "tu as dit (.+)",
        to = "you said %1",
        priority = 10,
    },
    {
        from = "il a dit (.+)",
        to = "he said %1",
        priority = 10,
    },
    
    -- "j'ai été X" -> "I was X"
    {
        from = "j'ai été (.+)",
        to = "I was %1",
        priority = 10,
    },
    {
        from = "tu as été (.+)",
        to = "you were %1",
        priority = 10,
    },
    
    -- "je suis allé à X" -> "I went to X"
    {
        from = "je suis allé à (.+)",
        to = "I went to %1",
        priority = 10,
    },
    {
        from = "je suis allée à (.+)",
        to = "I went to %1",
        priority = 10,
    },
    {
        from = "tu es allé à (.+)",
        to = "you went to %1",
        priority = 10,
    },
    {
        from = "il est allé à (.+)",
        to = "he went to %1",
        priority = 10,
    },
    {
        from = "nous sommes allés à (.+)",
        to = "we went to %1",
        priority = 10,
    },
    
    -- "j'ai eu X" -> "I had X"
    {
        from = "j'ai eu (.+)",
        to = "I had %1",
        priority = 10,
    },
    {
        from = "tu as eu (.+)",
        to = "you had %1",
        priority = 10,
    },
    
    -- ============================================
    -- FUTURE TENSE PATTERNS (Futur Simple)
    -- ============================================
    -- "je ferai X" -> "I will do X"
    {
        from = "je ferai (.+)",
        to = "I will do %1",
        priority = 10,
    },
    {
        from = "tu feras (.+)",
        to = "you will do %1",
        priority = 10,
    },
    {
        from = "il fera (.+)",
        to = "he will do %1",
        priority = 10,
    },
    {
        from = "nous ferons (.+)",
        to = "we will do %1",
        priority = 10,
    },
    
    -- "j'irai à X" -> "I will go to X"
    {
        from = "j'irai à (.+)",
        to = "I will go to %1",
        priority = 10,
    },
    {
        from = "tu iras à (.+)",
        to = "you will go to %1",
        priority = 10,
    },
    
    -- "je vais faire X" -> "I'm going to do X" (futur proche)
    {
        from = "je vais faire (.+)",
        to = "I'm going to do %1",
        priority = 10,
    },
    {
        from = "tu vas faire (.+)",
        to = "you're going to do %1",
        priority = 10,
    },
    {
        from = "il va faire (.+)",
        to = "he's going to do %1",
        priority = 10,
    },
    {
        from = "nous allons faire (.+)",
        to = "we're going to do %1",
        priority = 10,
    },
    
    -- ============================================
    -- MODAL VERB PATTERNS
    -- ============================================
    -- "je dois faire X" -> "I must do X"
    {
        from = "je dois (.+)",
        to = "I must %1/have to %1",
        priority = 10,
    },
    {
        from = "tu dois (.+)",
        to = "you must %1/have to %1",
        priority = 10,
    },
    {
        from = "il doit (.+)",
        to = "he must %1/has to %1",
        priority = 10,
    },
    
    -- "je veux faire X" -> "I want to do X"
    {
        from = "je veux (.+)",
        to = "I want to %1",
        priority = 10,
    },
    {
        from = "tu veux (.+)",
        to = "you want to %1",
        priority = 10,
    },
    
    -- ============================================
    -- SUBORDINATE CLAUSE PATTERNS
    -- ============================================
    -- "quand X alors Y" -> "when X then Y"
    {
        from = "quand (.+) alors (.+)",
        to = "when %1 then %2",
        priority = 12,
    },
    {
        from = "quand (.+) (.+)",
        to = "when %1 %2",
        priority = 10,
    },
    
    -- "parce que X Y" -> "because X Y"
    {
        from = "parce que (.+) (.+)",
        to = "because %1 %2",
        priority = 10,
    },
    
    -- "que X Y" -> "that X Y"
    {
        from = "que (.+) (.+)",
        to = "that %1 %2",
        priority = 10,
    },
    
    -- "bien que X Y" -> "although X Y"
    {
        from = "bien que (.+) (.+)",
        to = "although %1 %2",
        priority = 10,
    },
    
    -- "avant que X Y" -> "before X Y"
    {
        from = "avant que (.+) (.+)",
        to = "before %1 %2",
        priority = 10,
    },
    
    -- "après que X Y" -> "after X Y"
    {
        from = "après que (.+) (.+)",
        to = "after %1 %2",
        priority = 10,
    },
    
    -- "pendant que X Y" -> "while X Y"
    {
        from = "pendant que (.+) (.+)",
        to = "while %1 %2",
        priority = 10,
    },
    
    -- ============================================
    -- QUESTION PATTERNS WITH MODAL VERBS
    -- ============================================
    -- "peux-tu faire X?" -> "can you do X?"
    {
        from = "peux%-tu faire (.+)%?",
        to = "can you do %1",
        priority = 12,
    },
    {
        from = "peux tu faire (.+)%?",
        to = "can you do %1",
        priority = 12,
    },
    {
        from = "pouvez%-vous faire (.+)%?",
        to = "can you do %1",
        priority = 12,
    },
    
    -- "veux-tu faire X?" -> "do you want to do X?"
    {
        from = "veux%-tu faire (.+)%?",
        to = "do you want to do %1",
        priority = 12,
    },
    {
        from = "veux tu faire (.+)%?",
        to = "do you want to do %1",
        priority = 12,
    },
    
    -- "dois-tu faire X?" -> "do you have to do X?"
    {
        from = "dois%-tu faire (.+)%?",
        to = "do you have to do %1",
        priority = 12,
    },
    
    -- ============================================
    -- IMPERATIVE PATTERNS
    -- ============================================
    -- "viens X" -> "come X"
    {
        from = "viens (.+)",
        to = "come %1",
        priority = 10,
    },
    {
        from = "venez (.+)",
        to = "come %1",
        priority = 10,
    },
    
    -- "fais X" -> "do X"
    {
        from = "fais (.+)",
        to = "do %1",
        priority = 10,
    },
    {
        from = "faites (.+)",
        to = "do %1",
        priority = 10,
    },
    
    -- "attends X" -> "wait X"
    {
        from = "attends (.+)",
        to = "wait %1",
        priority = 10,
    },
    {
        from = "attendez (.+)",
        to = "wait %1",
        priority = 10,
    },
    
    -- "aide-moi X" -> "help me X"
    {
        from = "aide%-moi (.+)",
        to = "help me %1",
        priority = 10,
    },
    {
        from = "aidez%-moi (.+)",
        to = "help me %1",
        priority = 10,
    },
    
    -- ============================================
    -- LOCATION + ACTION PATTERNS
    -- ============================================
    -- "je suis à X" -> "I am at X"
    {
        from = "je suis à (.+)",
        to = "I am at %1",
        priority = 10,
    },
    {
        from = "tu es à (.+)",
        to = "you are at %1",
        priority = 10,
    },
    {
        from = "il est à (.+)",
        to = "he is at %1",
        priority = 10,
    },
    {
        from = "nous sommes à (.+)",
        to = "we are at %1",
        priority = 10,
    },
    
    -- "je suis dans X" -> "I am in X"
    {
        from = "je suis dans (.+)",
        to = "I am in %1",
        priority = 10,
    },
    {
        from = "tu es dans (.+)",
        to = "you are in %1",
        priority = 10,
    },
    {
        from = "il est dans (.+)",
        to = "he is in %1",
        priority = 10,
    },
    
    -- ============================================
    -- POSSESSION PATTERNS
    -- ============================================
    -- "j'ai X" -> "I have X"
    {
        from = "j'ai (.+)",
        to = "I have %1",
        priority = 10,
    },
    {
        from = "tu as (.+)",
        to = "you have %1",
        priority = 10,
    },
    {
        from = "il a (.+)",
        to = "he has %1",
        priority = 10,
    },
    {
        from = "nous avons (.+)",
        to = "we have %1",
        priority = 10,
    },
    {
        from = "vous avez (.+)",
        to = "you have %1",
        priority = 10,
    },
    {
        from = "ils ont (.+)",
        to = "they have %1",
        priority = 10,
    },
    
    -- "j'ai pas de X" -> "I have no X"
    {
        from = "j'ai pas de (.+)",
        to = "I have no %1",
        priority = 10,
    },
    {
        from = "tu as pas de (.+)",
        to = "you have no %1",
        priority = 10,
    },
    
    -- ============================================
    -- ACTION + OBJECT PATTERNS
    -- ============================================
    -- "je fais X" -> "I'm doing X"
    {
        from = "je fais (.+)",
        to = "I'm doing %1",
        priority = 10,
    },
    {
        from = "tu fais (.+)",
        to = "you're doing %1",
        priority = 10,
    },
    {
        from = "il fait (.+)",
        to = "he's doing %1",
        priority = 10,
    },
    {
        from = "nous faisons (.+)",
        to = "we're doing %1",
        priority = 10,
    },
    
    -- ============================================
    -- TIME + ACTION PATTERNS
    -- ============================================
    -- "aujourd'hui X" -> "today X"
    {
        from = "aujourd'hui (.+)",
        to = "today %1",
        priority = 8,
    },
    {
        from = "demain (.+)",
        to = "tomorrow %1",
        priority = 8,
    },
    {
        from = "hier (.+)",
        to = "yesterday %1",
        priority = 8,
    },
    {
        from = "maintenant (.+)",
        to = "now %1",
        priority = 8,
    },
    {
        from = "bientôt (.+)",
        to = "soon %1",
        priority = 8,
    },
    {
        from = "plus tard (.+)",
        to = "later %1",
        priority = 8,
    },
    
    -- ============================================
    -- MORE QUESTION PATTERNS
    -- ============================================
    -- "qu'est-ce que c'est" -> "what is it"
    {
        from = "qu'est%-ce que c'est$",
        to = "what is it",
        priority = 25,
    },
    {
        from = "qu'est%-ce que c'est ",
        to = "what is it ",
        priority = 25,
    },
    {
        from = "qu'est ce que c'est$",
        to = "what is it",
        priority = 25,
    },
    {
        from = "qu'est ce que c'est ",
        to = "what is it ",
        priority = 25,
    },
    -- "qu'est-ce que tu fais X" -> "what are you doing X"
    {
        from = "qu'est%-ce que tu fais (.+)",
        to = "what are you doing %1",
        priority = 12,
    },
    {
        from = "qu'est ce que tu fais (.+)",
        to = "what are you doing %1",
        priority = 12,
    },
    -- "qu'est-ce que tu fais" -> "what are you doing" (without object)
    {
        from = "qu'est%-ce que tu fais$",
        to = "what are you doing",
        priority = 20,
    },
    {
        from = "qu'est ce que tu fais$",
        to = "what are you doing",
        priority = 20,
    },
    
    -- "où es-tu X" -> "where are you X"
    {
        from = "où es%-tu (.+)",
        to = "where are you %1",
        priority = 12,
    },
    {
        from = "où êtes%-vous (.+)",
        to = "where are you %1",
        priority = 12,
    },
    
    -- ============================================
    -- REQUEST PATTERNS
    -- ============================================
    -- "peux-tu m'aider avec X" -> "can you help me with X"
    {
        from = "peux%-tu m'aider avec (.+)",
        to = "can you help me with %1",
        priority = 12,
    },
    {
        from = "pouvez%-vous m'aider avec (.+)",
        to = "can you help me with %1",
        priority = 12,
    },
    
    -- "peux-tu me donner X" -> "can you give me X"
    {
        from = "peux%-tu me donner (.+)",
        to = "can you give me %1",
        priority = 12,
    },
    {
        from = "pouvez%-vous me donner (.+)",
        to = "can you give me %1",
        priority = 12,
    },
    
    -- "peux-tu me montrer X" -> "can you show me X"
    {
        from = "peux%-tu me montrer (.+)",
        to = "can you show me %1",
        priority = 12,
    },
    {
        from = "pouvez%-vous me montrer (.+)",
        to = "can you show me %1",
        priority = 12,
    },
    
    -- ============================================
    -- TRADING PATTERNS (EXPANDED)
    -- ============================================
    -- "je vends X pour Y or" -> "selling X for Y gold"
    {
        from = "je vends (.+) pour (.+) or",
        to = "selling %1 for %2 gold",
        priority = 10,
    },
    {
        from = "j'achète (.+) pour (.+) or",
        to = "buying %1 for %2 gold",
        priority = 10,
    },
    {
        from = "je vends (.+) pour (.+) argent",
        to = "selling %1 for %2 silver",
        priority = 10,
    },
    {
        from = "j'achète (.+) pour (.+) argent",
        to = "buying %1 for %2 silver",
        priority = 10,
    },
    
    -- "combien coûte X" -> "how much does X cost"
    {
        from = "combien coûte (.+)",
        to = "how much does %1 cost",
        priority = 10,
    },
    {
        from = "quel est le prix de (.+)",
        to = "what is the price of %1",
        priority = 10,
    },
    
    -- ============================================
    -- LFG PATTERNS (EXPANDED)
    -- ============================================
    -- "je cherche X pour Y" -> "looking for X for Y"
    {
        from = "je cherche (.+) pour (.+)",
        to = "looking for %1 for %2",
        priority = 10,
    },
    {
        from = "on cherche (.+) pour (.+)",
        to = "looking for %1 for %2",
        priority = 10,
    },
    {
        from = "j'ai besoin de (.+) pour (.+)",
        to = "need %1 for %2",
        priority = 10,
    },
    {
        from = "on a besoin de (.+) pour (.+)",
        to = "need %1 for %2",
        priority = 10,
    },
    
    -- ============================================
    -- RELATIVE CLAUSE PATTERNS
    -- ============================================
    -- "quelqu'un qui peut X" -> "someone who can X"
    {
        from = "quelqu'un qui peut (.+)",
        to = "someone who can %1",
        priority = 10,
    },
    {
        from = "quelqu'un qui veut (.+)",
        to = "someone who wants %1",
        priority = 10,
    },
    {
        from = "quelqu'un qui a (.+)",
        to = "someone who has %1",
        priority = 10,
    },
    
    -- "qui peut X" -> "who can X"
    {
        from = "qui peut (.+)",
        to = "who can %1",
        priority = 10,
    },
    {
        from = "qui veut (.+)",
        to = "who wants %1",
        priority = 10,
    },
    {
        from = "qui a (.+)",
        to = "who has %1",
        priority = 10,
    },
    
    -- ============================================
    -- COMPARISON PATTERNS
    -- ============================================
    -- "mieux que X" -> "better than X"
    {
        from = "mieux que (.+)",
        to = "better than %1",
        priority = 10,
    },
    {
        from = "pire que (.+)",
        to = "worse than %1",
        priority = 10,
    },
    {
        from = "plus que (.+)",
        to = "more than %1",
        priority = 10,
    },
    {
        from = "moins que (.+)",
        to = "less than %1",
        priority = 10,
    },
    {
        from = "comme (.+)",
        to = "like %1",
        priority = 10,
    },
    
    -- ============================================
    -- CONDITIONAL PATTERNS
    -- ============================================
    -- "si X alors Y" -> "if X then Y"
    {
        from = "si (.+) alors (.+)",
        to = "if %1 then %2",
        priority = 10,
    },
    {
        from = "si (.+) (.+)",
        to = "if %1 %2",
        priority = 8,
    },
    
    -- ============================================
    -- PURPOSE PATTERNS (pour)
    -- ============================================
    -- "pour X Y" -> "in order to Y X"
    {
        from = "pour (.+) (.+)",
        to = "in order to %2 %1",
        priority = 10,
    },
    {
        from = "afin de (.+) (.+)",
        to = "so that %1 %2",
        priority = 10,
    },
}

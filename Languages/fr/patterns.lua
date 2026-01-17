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
    
    -- Question patterns with "est-ce que"
    {
        from = "est%-ce que tu (.+)",
        to = "do you %1",
    },
    {
        from = "est%-ce que vous (.+)",
        to = "do you %1",
    },
    {
        from = "est%-ce qu'il (.+)",
        to = "does he %1",
    },
    {
        from = "est%-ce qu'elle (.+)",
        to = "does she %1",
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
}

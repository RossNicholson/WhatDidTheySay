# French Language Pack Implementation Guide

## Overview

Yes, you should follow the **same strategy** used for German. The addon architecture is language-agnostic, so the same approach works for French (and any other language).

## Strategy Summary (What We Did for German)

### 1. **Vocabulary (tokens.lua)**
   - Start with common words (greetings, basic verbs, nouns)
   - Add WoW-specific gaming terms
   - Add gaming slang and abbreviations
   - Handle typos/variants (e.g., "gearde" for "gerade")
   - Add compound words (e.g., "silbermünzen" = "silver coins")

### 2. **Phrases (phrases.lua)**
   - Common multi-word expressions
   - Idiomatic phrases
   - Gaming chat phrases (LFG, trading, etc.)
   - Colloquial expressions

### 3. **Patterns (patterns.lua)**
   - Sentence structure patterns
   - Common sentence types (questions, commands, statements)
   - Mixed-language patterns

### 4. **Grammar (grammar.lua)**
   - Word order fixes (French → English)
   - Article corrections
   - Verb position fixes
   - Common translation errors

### 5. **Metadata (metadata.lua)**
   - Articles (le, la, les, un, une, des)
   - Character hints (é, è, ê, ç, etc.)
   - Set `available = true`

### 6. **Testing**
   - Test with real-world chat messages
   - Fix missing vocabulary as you find it
   - Test edge cases (typos, mixed language, etc.)

## French-Specific Considerations

### Differences from German:

1. **Word Order**: French is SVO (Subject-Verb-Object) like English, so word order is generally easier than German
   - Less need for complex grammar rules
   - But still need rules for questions, negations, etc.

2. **Articles**: French has gendered articles (le/la/les, un/une/des)
   - Need to handle article-noun agreement
   - Similar to German but different articles

3. **Verb Conjugations**: French has more verb forms than German
   - May need more verb normalization
   - Consider creating a FrenchMorphology.lua module (like GermanMorphology.lua)

4. **Accents**: French uses many accents (é, è, ê, ç, etc.)
   - Important for character hints in metadata
   - May need to handle accent-insensitive matching

5. **Negation**: French uses "ne...pas" structure
   - Need patterns for "je ne sais pas" → "I don't know"
   - Grammar rules to handle negation word order

6. **Questions**: French question formation is different
   - "Est-ce que..." patterns
   - Inversion patterns
   - Need specific question patterns

## Implementation Steps

### Phase 1: Foundation (Start Here)
1. **Update metadata.lua**:
   ```lua
   WDTS_Lang_fr_Metadata = {
       articles = {
           ["le"] = true, ["la"] = true, ["les"] = true,
           ["un"] = true, ["une"] = true, ["des"] = true,
           ["du"] = true, ["de"] = true, ["des"] = true,
       },
       charHints = {
           ["é"] = true, ["è"] = true, ["ê"] = true, ["ë"] = true,
           ["à"] = true, ["â"] = true, ["ç"] = true, ["ô"] = true,
           ["ù"] = true, ["û"] = true, ["î"] = true, ["ï"] = true,
       },
       available = true,  -- Change from false to true
   }
   ```

2. **Add basic vocabulary to tokens.lua**:
   - Greetings: bonjour, salut, bonsoir, au revoir
   - Common verbs: être, avoir, faire, aller, vouloir, pouvoir
   - Common nouns: joueur, guilde, quête, donjon
   - Pronouns: je, tu, il, elle, nous, vous, ils, elles

3. **Add basic phrases to phrases.lua**:
   - "bonjour" = "hello"
   - "au revoir" = "goodbye"
   - "merci" = "thanks"
   - "s'il vous plaît" = "please"

### Phase 2: Gaming Terms
1. **WoW-specific vocabulary**:
   - Classes: guerrier, mage, prêtre, etc.
   - Dungeons: donjon, raid, instance
   - Trading: vendre, acheter, échanger
   - LFG: chercher groupe, besoin de

2. **Gaming slang**:
   - French gaming abbreviations
   - Common chat expressions

### Phase 3: Patterns & Grammar
1. **Common sentence patterns**:
   - Questions: "Est-ce que...", "Qu'est-ce que..."
   - Commands: "Vas-y", "Attends"
   - LFG: "Cherche groupe pour..."

2. **Grammar rules**:
   - Negation: "ne...pas" → "not"
   - Question word order
   - Article corrections

### Phase 4: Testing & Refinement
1. Test with real French chat messages
2. Add missing vocabulary as found
3. Fix grammar issues
4. Handle typos and variants

## Quick Start Checklist

- [ ] Update `Languages/fr/metadata.lua` (set `available = true`, add articles & charHints)
- [ ] Add basic vocabulary to `Languages/fr/tokens.lua` (100-200 common words)
- [ ] Add basic phrases to `Languages/fr/phrases.lua` (20-30 common phrases)
- [ ] Update `Core/LanguagePackManager.lua` (set `available = true` for French)
- [ ] Test with a simple French message
- [ ] Add WoW gaming terms
- [ ] Add patterns for common sentence structures
- [ ] Add grammar rules for word order
- [ ] Test extensively with real chat logs

## Key Files to Modify

1. `Languages/fr/metadata.lua` - Set `available = true`
2. `Languages/fr/tokens.lua` - Add vocabulary
3. `Languages/fr/phrases.lua` - Add phrases
4. `Languages/fr/patterns.lua` - Add sentence patterns
5. `Languages/fr/grammar.lua` - Add grammar rules
6. `Core/LanguagePackManager.lua` - Set `available = true` for French

## Tips

1. **Start Small**: Begin with 100-200 common words, then expand
2. **Test Early**: Test with real messages as soon as you have basic vocabulary
3. **Copy German Structure**: Use German files as templates (same structure)
4. **Focus on Gaming**: Prioritize WoW gaming terms and chat phrases
5. **Handle Typos**: Add common French typos/variants (like we did for German)
6. **Real-World Testing**: Test with actual French chat logs to find missing vocabulary

## Example: Starting French Implementation

```lua
-- Languages/fr/tokens.lua
WDTS_Lang_fr_Tokens = {
    -- Greetings
    ["bonjour"] = "hello",
    ["salut"] = "hi",
    ["bonsoir"] = "good evening",
    ["au revoir"] = "goodbye",
    
    -- Common verbs
    ["être"] = "to be",
    ["suis"] = "am",
    ["es"] = "are",
    ["est"] = "is",
    ["sommes"] = "are",
    ["êtes"] = "are",
    ["sont"] = "are",
    
    -- Gaming terms
    ["guilde"] = "guild",
    ["quête"] = "quest",
    ["donjon"] = "dungeon",
    ["raid"] = "raid",
    ["joueur"] = "player",
    
    -- LFG/Trading
    ["cherche"] = "looking for",
    ["chercher"] = "to look for",
    ["vendre"] = "sell",
    ["acheter"] = "buy",
    ["besoin"] = "need",
    ["besoin de"] = "need",
}
```

## Next Steps

1. Start with Phase 1 (Foundation)
2. Test with a simple message like "bonjour, cherche groupe"
3. Expand vocabulary based on what you see in real chat
4. Add patterns and grammar rules as needed
5. Iterate based on testing

The same systematic approach that worked for German will work for French!

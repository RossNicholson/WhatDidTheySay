# French Grammar Rules Plan

## Overview
French grammar is **SVO (Subject-Verb-Object)** like English, so word order is generally simpler than German (which uses V2). However, French has unique grammar features that need post-processing rules.

## Key French Grammar Issues to Fix

### 1. Negation: "ne...pas"
**Problem**: French uses "ne...pas" structure around verbs
- "je ne sais pas" → "I not know" (wrong) → "I don't know" (correct)
- "je ne peux pas" → "I not can" (wrong) → "I can't" (correct)
- "il ne veut pas" → "he not wants" (wrong) → "he doesn't want" (correct)

**Rules needed**:
```lua
-- Fix "I not know" → "I don't know"
{ from = "^I not ", to = "I don't ", priority = 20 }
{ from = "^he not ", to = "he doesn't ", priority = 20 }
{ from = "^she not ", to = "she doesn't ", priority = 20 }
{ from = "^we not ", to = "we don't ", priority = 20 }
{ from = "^you not ", to = "you don't ", priority = 20 }
{ from = "^they not ", to = "they don't ", priority = 20 }
```

### 2. Questions: "Est-ce que..."
**Problem**: "Est-ce que..." literally means "Is it that..." but should be simplified
- "Est-ce que tu veux?" → "Is it that you want?" (wrong) → "Do you want?" (correct)
- "Qu'est-ce que c'est?" → "What is it that it is?" (wrong) → "What is it?" (correct)

**Rules needed**:
```lua
-- Remove "Is it that" from questions
{ from = "^Is it that you ", to = "Do you ", priority = 20 }
{ from = "^Is it that he ", to = "Does he ", priority = 20 }
{ from = "^What is it that", to = "What", priority = 20 }
```

### 3. Articles: le/la/les
**Problem**: Articles may need correction based on context
- Usually handled correctly, but may need fixes for common errors

### 4. Verb Conjugations
**Problem**: Ensure correct English verb forms
- "je suis" → "I am" ✓ (usually correct)
- "tu es" → "you are" ✓ (usually correct)
- But may need fixes for complex cases

### 5. Prepositions: de, du, des
**Problem**: Context-dependent translations
- "de" can mean "of" or "from"
- "du" = "of the" or "from the"
- "des" = "of the" or "from the" (plural)

### 6. Common Errors
**Typical French → English translation mistakes to fix**:
- Double articles
- Missing articles
- Word order in questions
- Negation word order

## Grammar Rules Structure (Matching German)

Following German's grammar.lua structure:

### Basic Rules (Simple fixes)
- Article corrections ("a" → "an" before vowels)
- Double article fixes ("the the" → "the")
- Common mistranslations

### Negation Rules (High Priority)
- "ne...pas" handling
- "I not" → "I don't"
- "he not" → "he doesn't"
- etc.

### Question Rules
- "Est-ce que..." removal
- "Qu'est-ce que..." simplification
- Question word order fixes

### Verb Position Rules
- Less critical than German (SVO like English)
- But may need fixes for complex sentences

### Preposition Rules
- Handle "de", "du", "des" contextually
- Fix common preposition errors

## Implementation Priority

1. **High Priority** (Do First):
   - Negation rules ("ne...pas")
   - Question simplification ("Est-ce que...")
   - Basic article corrections

2. **Medium Priority**:
   - Preposition handling
   - Verb conjugation fixes
   - Common error fixes

3. **Low Priority**:
   - Complex sentence structures
   - Edge cases
   - Fine-tuning

## Grammar vs Patterns vs Phrases

**Phrases** (phrases.lua): Handle common multi-word expressions
- "je ne sais pas" → "I don't know" (as a phrase)
- "Est-ce que tu veux" → "Do you want" (as a phrase)

**Patterns** (patterns.lua): Handle sentence structures with captures
- "cherche X pour Y" → "looking for X for Y"

**Grammar** (grammar.lua): Post-processing fixes
- "I not know" → "I don't know" (if phrase/pattern didn't catch it)
- Article corrections
- Common errors

## Example Grammar Rules

```lua
WDTS_Lang_fr_Grammar = {
    rules = {
        -- Negation fixes (HIGH PRIORITY)
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
        -- ... more negation rules
        
        -- Question simplification
        {
            from = "^Is it that you ",
            to = "Do you ",
            priority = 20,
        },
        {
            from = "^What is it that",
            to = "What",
            priority = 20,
        },
        
        -- Basic fixes (same as German)
        {
            from = " a ([aeiouAEIOU])",
            to = " an %1",
        },
        {
            from = "the the ",
            to = "the ",
        },
        -- ... more basic rules
    },
}
```

## Summary

French grammar rules will be **simpler than German** (no V2 word order), but still need:
1. **Negation handling** (most important)
2. **Question simplification**
3. **Article/preposition fixes**
4. **Common error corrections**

Start with negation and question rules (highest impact), then add others as needed based on testing.

# French Language Pack Expansion Plan

## Current Status (Updated)

| File | Lines | % of German |
|------|-------|-------------|
| tokens.lua | 1,164 | ~22% (DE: 5,396) |
| phrases.lua | 343 | ~15% (DE: 2,241) |
| patterns.lua | 360 | ~26% (DE: 1,367) |
| grammar.lua | 321 | ~11% (DE: 3,050) |
| intents.lua | 59 | ~60% (DE: 99) |
| FrenchMorphology.lua | — | Not created (DE has GermanMorphology.lua) |

**What's Next:** See **[FRENCH_NEXT_STEPS.md](FRENCH_NEXT_STEPS.md)** for the ordered roadmap following the same process as German.

## Goal: Match German Coverage
German has:
- ~5,396 lines of tokens (thousands of words)
- ~2,241 lines of phrases
- ~1,367 lines of patterns
- ~3,050 lines of grammar rules

## Expansion Strategy

### Phase 1: Vocabulary (tokens.lua)
Organized by same categories as German:

1. **Roles** (tank, dps, healer) ✓ Done
2. **Dungeons** (French dungeon names/terms)
3. **Common verbs** (être, avoir, faire, aller, etc.) - Partial
4. **Common nouns** (groupe, joueur, guilde, etc.) - Partial
5. **Pronouns** (je, tu, il, etc.) - Partial
6. **LFG related** (pour, avec, etc.) - Partial
7. **Actions** (prêt, fini, inviter, etc.) - Partial
8. **Status** (vie, mana, santé) - Partial
9. **Question words** (qui, que, où, etc.) - Partial
10. **Trading** (vendre, acheter, etc.) - Partial
11. **Character classes** (French class names)
12. **Races** (French race names)
13. **Professions** (French profession names)
14. **Items** (French item-related terms)
15. **Gaming slang** (French gaming abbreviations)
16. **Time/frequency** (maintenant, toujours, etc.)
17. **Common words** (encore, déjà, bien, mal, etc.) - Partial
18. **Typos/variants** (common French misspellings)

### Phase 2: Phrases (phrases.lua)
- Expand from ~40 to match German's ~2,241
- Same categories as German:
  - Verb phrases
  - Common phrases
  - LFG phrases
  - Trading phrases
  - Question phrases
  - Status phrases
  - Gaming chat phrases

### Phase 3: Patterns (patterns.lua)
- Expand from ~10 to match German's ~1,367
- French sentence structures:
  - Questions (Est-ce que..., Qu'est-ce que...)
  - Negation (ne...pas)
  - LFG patterns
  - Trading patterns

### Phase 4: Grammar (grammar.lua)
- Expand from ~10 to comprehensive rules
- French-specific grammar issues:
  - Negation: "ne...pas" word order
  - Questions: "Est-ce que..." → "is it that..."
  - Article corrections (le/la/les)
  - Verb position (less complex than German, but still needed)
  - Preposition handling
  - Common errors (le/la confusion, etc.)

### Phase 5: Intents (intents.lua)
- Expand from 5 to match German's coverage
- Same intent types as German

## Grammar Plan for French

French grammar is SVO (like English), so simpler than German (V2), but still needs rules for:

1. **Negation**: "je ne sais pas" → "I don't know" (not "I not know")
2. **Questions**: "Est-ce que tu veux?" → "Do you want?" (not "Is it that you want?")
3. **Articles**: Handle le/la/les correctly
4. **Verb conjugations**: Ensure correct English verb forms
5. **Prepositions**: "de", "du", "des" → "of/from"
6. **Common errors**: Fix typical translation mistakes

## Implementation Order

1. **Vocabulary expansion** - Start with most common WoW terms
2. **Phrases expansion** - Add common French gaming phrases
3. **Patterns expansion** - Add French sentence structures
4. **Grammar expansion** - Add French-specific grammar rules
5. **Testing** - Test with real French chat messages

## Categories to Add (Matching German Structure)

Based on German tokens.lua structure:
- Roles ✓
- Dungeons
- Common verbs (expand)
- Common nouns (expand)
- Pronouns ✓
- LFG related ✓
- Common phrases ✓
- Directions
- Combat terms
- Status words (expand)
- Faction terms
- Races
- Guild terms
- Game mechanics
- Character classes
- More dungeons
- Trading and economy (expand)
- Professions and crafting
- Common WoW verbs
- Time and frequency
- Item name components
- Quality and attributes
- Articles ✓
- Possession and existence
- Pronouns and people (expand)
- Common connecting words
- Social and communication
- Practical conversation words
- Common conversational responses
- Location and meeting
- Gaming abbreviations
- And more...

## Duplicate Checking

Before adding each batch:
1. Check entire file for duplicates (case-insensitive)
2. Build set of existing keys
3. Verify new entries against set
4. Only add unique entries

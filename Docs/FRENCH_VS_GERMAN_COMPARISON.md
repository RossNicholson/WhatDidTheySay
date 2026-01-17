# French vs German Language Pack Comparison

## Overall Statistics

| Component | German | French | French % | Gap |
|-----------|--------|--------|----------|-----|
| **tokens.lua** | 5,396 lines<br/>~4,698 entries | 1,164 lines<br/>~1,058 entries | ~22% | **-4,240 lines<br/>-3,640 entries** |
| **phrases.lua** | 2,241 lines<br/>~187 categories | 343 lines<br/>~27 categories | ~15% | **-1,898 lines<br/>-160 categories** |
| **patterns.lua** | 1,367 lines | 360 lines | ~26% | **-1,007 lines** |
| **grammar.lua** | 3,050 lines | 321 lines | ~11% | **-2,729 lines** |
| **intents.lua** | 99 lines | 59 lines | ~60% | **-40 lines** |
| **Morphology Module** | ✅ GermanMorphology.lua (40KB) | ❌ None | 0% | **Missing** |

---

## Detailed Gap Analysis

### 1. TOKENS.LUA - Major Gaps

#### ✅ French Has (Basic Coverage)
- Roles (tank, dps, heal)
- Common verbs (être, avoir, faire, aller, etc.)
- Common nouns (groupe, joueur, guilde)
- Pronouns (je, tu, il, etc.)
- LFG related (pour, avec, etc.)
- Dungeons (basic set: ~30)
- Character classes
- Directions (nord, sud, est, ouest) - **just added**
- Combat terms (pull, add, aggro, etc.) - **just added**
- Faction (alliance, horde) - **just added**
- Races (humain, nain, elfe, etc.) - **just added**
- Guild terms (basic)
- Time/frequency (basic)
- Trading/economy (basic)
- Professions (basic)
- Numbers
- Gaming abbreviations

#### ❌ French Missing (German Has)

**Vocabulary Categories:**
1. **Comprehensive WoW-Specific Terms** (German has extensive section)
   - Zones and Locations (German has ~200+ zone names)
   - Major Cities and Settlements (comprehensive)
   - Dungeons - comprehensive list (German has ~50+ dungeon entries)
   - Raids (Classic raids with German names)
   - Major NPCs and Bosses (German names)
   - Item Types and Equipment (comprehensive)
   - Armor Types (detailed)
   - Armor Slots (all slots)
   - Accessories (rings, trinkets, etc.)
   - Item Quality (common, rare, epic, etc.)

2. **Detailed Item Vocabulary**
   - Weapon and item terms (comprehensive)
   - Item name components (words commonly in item names)
   - Consumables (potions, food, etc.) - French has basic, German has extensive
   - Item types (weapons, armor pieces, etc.)

3. **Gaming-Specific Vocabulary**
   - Raid/Dungeon abbreviations (comprehensive)
   - Status/AFK terms (more variants)
   - Hardcore/gold terms
   - More gaming actions
   - More location names (comprehensive)

4. **Grammar & Structure Words**
   - Articles (definite/indefinite) - more comprehensive handling
   - Prepositions/connectors (more extensive)
   - Relative pronouns (comprehensive)
   - Possessive pronouns (more forms)
   - Common connecting words (more extensive)

5. **Conversational Vocabulary**
   - Social and communication (more terms)
   - Practical conversation words (more extensive)
   - Common conversational responses (more variants)
   - More expressions (extensive)
   - More particles (extensive)

6. **Verb Expansions**
   - Past tense verbs (French has basic, German has comprehensive)
   - More verb conjugations
   - Modal verbs (comprehensive)
   - Common WoW verbs (comprehensive)

7. **Time & Frequency**
   - More time expressions (comprehensive)
   - Time/sequence connectors (more extensive)

8. **Quest & Game Mechanics**
   - Quest-related vocabulary (comprehensive)
   - Movement/departure terms (comprehensive)
   - Game mechanics terms (more extensive)

9. **Real-World Chat Vocabulary**
   - Additional words from chat log reviews (German has 3+ review passes)
   - Common gaming terms from actual usage
   - Typos and variants (extensive)

**Estimated Missing Entries:** ~3,640 token entries

---

### 2. PHRASES.LUA - Major Gaps

#### ✅ French Has (Basic Coverage)
- Common verb phrases
- Common phrases
- LFG phrases
- Trading phrases
- Common question phrases
- Status phrases
- Negation phrases
- Direction phrases - **just added**
- Guild recruitment - **just added**
- Game mechanics - **just added**
- Time-based - **just added**
- Action phrases - **just added**
- Medical/First Aid - **just added**
- More status - **just added**
- Quest/objective - **just added**
- Group coordination - **just added**
- Conversational questions - **just added**

#### ❌ French Missing (German Has ~160 More Categories)

**Phrase Categories:**
1. **Separable Verb Phrases** (German-specific, but French might have similar)
   - Prefix-verb combinations

2. **Extensive Status Phrases** (~50+ more)
   - Death and status variations
   - Not started/started variations
   - Help requests (more variants)

3. **Combat/Group Coordination** (~30+ more)
   - More combat phrases
   - More group coordination

4. **Guild and Social** (~40+ more)
   - Guild chat phrases (from chat log review)
   - Social phrases (extensive)

5. **Enchanting** (~10+ more)
   - Enchanting-specific phrases
   - Enchanting with objects

6. **Expressions** (~20+ more)
   - Gaming slang expressions
   - Common player expressions
   - More expressions

7. **Time Phrases** (~15+ more)
   - More time-based coordination
   - More temporal phrases

8. **Trading** (~20+ more)
   - More trading-specific phrases
   - Price-related phrases

9. **Quest/Item Names** (~10+ more)
   - Quest name patterns
   - Item name patterns

10. **Pet and Hunter** (~5+ more)
    - Pet-related phrases
    - Hunter-specific

**Estimated Missing:** ~150-200 phrase categories

---

### 3. PATTERNS.LUA - Major Gaps

#### ✅ French Has (Basic Coverage)
- "cherche X pour Y" patterns
- "peux-tu X" patterns
- Mixed language (LFG/LFM with pour)
- "je cherche X pour Y"
- "quelqu'un peut X"
- "combien coûte X"
- "où est X"
- "je suis X" / "nous sommes X" / "vous êtes X"
- "il y a X" / "il n'y a pas de X"
- "cherche un/une/des/le/la/les X"
- "veux acheter/vendre X"
- "peux-tu m'aider/inviter/invoquer"
- "combien de X" / "qui est X" / "quand est X" / "comment faire X" / "pourquoi X"
- Guild recruitment patterns
- Trading patterns
- "est-ce que" question patterns
- Request patterns (quelqu'un peut me donner/port) - **just added**
- Time patterns (j'arrive dans X) - **just added**
- Trading patterns (vente/achat) - **just added**
- "qui veut X" - **just added**

#### ❌ French Missing (German Has ~1,007 More Patterns)

**Pattern Types:**
1. **Complex Subordinate Clauses** (German-specific structure, French is SVO so less needed)
   - Verb-final subordinate clauses
   - Complex subordinate clause patterns

2. **More Request Patterns** (~50+ more)
   - "hat mir jemand X silber?" variations
   - "kann mir jemand X kaufen" variations
   - More request structures

3. **More Location Patterns** (~20+ more)
   - Location-based patterns
   - Movement patterns

4. **More Trading Patterns** (~30+ more)
   - Price questions (more variants)
   - Trading structures

5. **More Time/Organization Patterns** (~25+ more)
   - Time coordination patterns
   - Organization patterns

6. **More Conversational Patterns** (~40+ more)
   - Conversation structures
   - Response patterns

7. **More Quest/Dungeon Patterns** (~20+ more)
   - Quest-specific patterns
   - Dungeon coordination

8. **More Guild Recruitment Patterns** (~15+ more)
   - Recruitment variations
   - Guild-related structures

**Note:** French needs fewer complex patterns than German due to SVO word order (same as English), but still needs more coverage.

**Estimated Missing:** ~800-1,000 patterns

---

### 4. GRAMMAR.LUA - Major Gaps

#### ✅ French Has (Basic Coverage)
- Negation rules (ne...pas)
- Question simplification (Est-ce que...)
- Basic grammar fixes (~321 lines)

#### ❌ French Missing (German Has ~2,729 More Rules)

**Grammar Rule Types:**
1. **Negation Rules** (French has basic, German has extensive)
   - More negation variations
   - Negation with different verbs

2. **Question Rules** (French has basic, German has extensive)
   - More question patterns
   - Question inversion rules

3. **Article Corrections** (~200+ more)
   - Article-noun agreement fixes
   - Definite/indefinite article corrections

4. **Preposition Handling** (~150+ more)
   - Preposition corrections
   - Preposition choice fixes

5. **Verb Position/Conjugation** (~300+ more)
   - Verb form corrections
   - Tense corrections
   - Pronoun-verb agreement

6. **LanguageTool-Inspired Rules** (~500+ more)
   - Systematic grammar fixes
   - Common error patterns

7. **Word Order Fixes** (~500+ more)
   - SVO corrections
   - Phrase reordering

8. **Contextual Translations** (~200+ more)
   - Context-aware fixes
   - Disambiguation rules

9. **Common Errors** (~200+ more)
   - Typical translation mistakes
   - Confusion fixes

10. **Post-Processing Rules** (~500+ more)
    - Final polish rules
    - Edge case handling

**Note:** French needs fewer word-order rules than German (both are SVO), but still needs extensive grammar coverage.

**Estimated Missing:** ~2,500-2,700 grammar rules

---

### 5. INTENTS.LUA - Minor Gaps

#### ✅ French Has
- LFG_DUNGEON
- INVITE_REQUEST
- SUMMON_REQUEST
- READY
- WAITING
- TRADING (basic)

#### ❌ French Missing
- More intent types (German has ~10-15 intents, French has ~6)
- More patterns per intent
- Edge case intent patterns

**Estimated Missing:** ~40 lines, ~4-5 more intent types

---

### 6. MORPHOLOGY MODULE - Missing

#### ❌ French Completely Missing

**GermanMorphology.lua (40KB):**
- Verb conjugation lookup (257 forms for 150+ verbs)
- Separable prefix handling
- Verb normalization functions
- Regular verb form generation
- Helper functions (IsArticle, IsPreposition, GetPronounCase)

**French Needs:**
- FrenchMorphology.lua
- Verb conjugation lookup (être, avoir, faire, aller, vouloir, pouvoir, etc.)
- Present, past, participle forms
- Irregular verb handling
- Verb normalization (similar to German)

**Estimated Size:** ~30-40KB (similar to German)

---

## Priority Gaps Summary

### 🔴 HIGH PRIORITY (Biggest Impact)

1. **Vocabulary (tokens.lua)** - **~3,640 entries missing**
   - WoW-specific terms (zones, dungeons, items, NPCs)
   - Comprehensive item vocabulary
   - Real-world chat vocabulary (from chat logs)
   - Gaming-specific terms

2. **Grammar (grammar.lua)** - **~2,500-2,700 rules missing**
   - Negation rules (comprehensive)
   - Question rules (comprehensive)
   - Article corrections
   - Preposition handling
   - LanguageTool-inspired systematic fixes

3. **Morphology Module** - **Missing entirely**
   - FrenchMorphology.lua
   - Verb conjugation lookup
   - Verb normalization

### 🟡 MEDIUM PRIORITY (Good Coverage Impact)

4. **Phrases (phrases.lua)** - **~150-200 categories missing**
   - More status phrases
   - More combat/group coordination
   - More guild/social phrases
   - More expressions
   - More trading phrases

5. **Patterns (patterns.lua)** - **~800-1,000 patterns missing**
   - More request patterns
   - More location patterns
   - More trading patterns
   - More conversational patterns

### 🟢 LOW PRIORITY (Refinement)

6. **Intents (intents.lua)** - **~4-5 intent types missing**
   - Additional intent types
   - More patterns per intent

---

## Estimated Effort to Reach German-Level Coverage

| Component | Missing | Estimated Effort |
|-----------|---------|------------------|
| **tokens.lua** | ~3,640 entries | **High** - Requires extensive vocabulary collection |
| **grammar.lua** | ~2,700 rules | **High** - Requires systematic grammar rule creation |
| **FrenchMorphology.lua** | Complete module | **Medium-High** - Requires verb conjugation data |
| **phrases.lua** | ~150-200 categories | **Medium** - Can add incrementally |
| **patterns.lua** | ~800-1,000 patterns | **Medium** - Can add incrementally |
| **intents.lua** | ~40 lines | **Low** - Quick additions |

**Total Estimated Effort:** ~15-20x current French size to reach German coverage

---

## Next Steps (Following FRENCH_NEXT_STEPS.md)

1. **Continue Vocabulary Expansion** - Focus on WoW-specific terms
2. **Create FrenchMorphology.lua** - Verb conjugation lookup
3. **Expand Grammar Rules** - Systematic rule creation
4. **Add More Phrases** - Real-world chat phrases
5. **Add More Patterns** - Common sentence structures
6. **Real-World Testing** - Collect French chat logs and add missing terms

# Vocabulary & Grammar Improvement Plan

## Current State (v0.5.0)

### Vocabulary Coverage
- **4,411 German vocabulary entries** (massive expansion complete)
- **1,007 phrase patterns** (idiomatic expressions, multi-word constructions)
- **275 sentence structure patterns** (regex templates with captures)
- **544 grammar rules** (post-processing word order fixes)

### Grammar Coverage
- ✅ Dependency parsing for simple sentences (SUBJ→VERB→OBJ)
- ✅ Questions, relative clauses, subordinate clauses
- ✅ Basic separable verb handling
- ✅ Verb conjugation recognition (257 forms, 150+ infinitives)
- ✅ Systematic duplicate word removal
- ✅ LanguageTool-inspired grammar rules (25+ systematic fixes)

---

## How to Improve Further

### 🔴 HIGH PRIORITY - Vocabulary Expansion

#### 1. **Real-World Chat Log Testing**
**Why**: Identifies missing vocabulary from actual gameplay
**Action**:
- Collect real German chat logs from WoW Classic
- Identify untranslated words/phrases
- Add missing vocabulary to `Languages/de/tokens.lua`
- Add missing phrases to `Languages/de/phrases.lua`

**Expected Impact**: +5-10% coverage of real-world usage

#### 2. **WoW-Specific Terminology Expansion**
**Why**: Gaming chat uses specific terms not in general vocabulary
**Current**: ~200 WoW-specific terms already added
**Missing Areas**:
- More item names (weapons, armor, consumables)
- Zone/location names (all major areas)
- NPC names (quest givers, vendors, bosses)
- Profession-specific terms
- Class ability names (German names)
- Status effects and buffs/debuffs
- Raid/dungeon mechanics terms

**Action**: Systematically expand `Languages/de/tokens.lua` with WoW-specific terms

**Expected Impact**: +3-5% accuracy for gaming-specific messages

#### 3. **Colloquial/Gaming Slang**
**Why**: Real players use slang, abbreviations, typos
**Examples to Add**:
- Gaming slang: "re", "brb", "omw", "gg", "wp", "ty", "np"
- German gaming abbreviations: "vz" (verzaubern), "schmied" (blacksmith)
- Common typos/variants: "hab" vs "habe", "kannste" vs "kannst du"
- Colloquial forms: "nem" (einen), "ne" (eine), "bock" (want to)

**Action**: Expand vocabulary with colloquial variants and gaming slang

**Expected Impact**: +2-3% coverage

---

### 🔴 HIGH PRIORITY - Grammar Improvements

#### 1. **Expand Dependency Parser**
**Current**: Handles basic SUBJ→VERB→OBJ, questions, relative/subordinate clauses
**Missing**:
- **Passive Voice**: "Der Mann wurde gesehen" → "The man was seen"
- **Modal Verbs + Infinitive**: "Ich muss gehen" → "I must go" (not "I must to go")
- **Perfect Tense Improvements**: Better handling of "haben" vs "sein" perfect tense
- **Indirect Speech**: "Er sagte, dass er kommt" → "He said that he comes"
- **Conditional Clauses**: "Wenn du kommst, dann..." → "If you come, then..."

**Action**: Expand `Core/DependencyParser.lua` to handle these structures

**Expected Impact**: +10-15% accuracy for complex sentences

#### 2. **More LanguageTool-Inspired Grammar Rules**
**Current**: ~25 systematic rules added
**Missing**:
- More subordinate clause patterns
- Genitive constructions
- Complex prepositional phrases
- Better reflexive pronoun handling
- More comparative/superlative rules

**Action**: Extract more rules from LanguageTool repository (we already have the plan in `Docs/LANGUAGETOOL_EXTRACTION_PLAN.md`)

**Expected Impact**: +3-5% accuracy

#### 3. **Better Word Order in Complex Sentences**
**Current**: Grammar rules fix many issues, but some remain
**Problems**:
- "wenn" clauses still sometimes have wrong word order
- Past participle position in perfect tense
- Separable verb prefix position

**Action**: Add more specific grammar rules for these patterns

**Expected Impact**: +3-5% accuracy

---

### 🟡 MEDIUM PRIORITY - Systematic Improvements

#### 1. **Expand Verb Conjugation Recognition**
**Current**: 257 forms covering 150+ infinitives
**Target**: Expand to 300+ forms covering 200+ infinitives
**Action**: Add more verbs to `Core/GermanMorphology.lua` `VERB_CONJUGATION_LOOKUP`

**Expected Impact**: +2-3% verb recognition accuracy

#### 2. **Compound Word Decomposition**
**Current**: Basic compound splitting
**Improve**: Better decomposition for common compound words
**Action**: Expand `Engine.TryCompoundDecomposition` or add compound word database

**Expected Impact**: +1-2% accuracy for compound words

#### 3. **Template Library for Common Patterns**
**Concept**: Pre-translated sentence templates for frequent WoW chat patterns
**Examples**:
- LFG: "LFM [ROLE] für [DUNGEON]" → "LFM [ROLE] for [DUNGEON]"
- Trading: "WTS [ITEM] für [PRICE]" → "WTS [ITEM] for [PRICE]"
- Guild: "Deutsche Gilde sucht [ROLE]" → "German guild looking for [ROLE]"

**Action**: Create template matching system in `Core/Engine.lua`

**Expected Impact**: +5-8% accuracy for covered patterns

---

### 🟢 LONG-TERM - Advanced Improvements

#### 1. **Word Frequency Weighting**
**Concept**: Prioritize common translations based on word frequency
**Source**: Leipzig Corpora Collection (German word frequency lists)
**Action**: Add frequency data to vocabulary, modify confidence calculation

**Expected Impact**: Better confidence scores, fewer false positives

#### 2. **Noun Gender Database**
**Concept**: Track German noun gender (der/die/das) for better article handling
**Action**: Add gender data to vocabulary, validate article-noun agreement

**Expected Impact**: More natural English output

#### 3. **Semantic Role Understanding**
**Concept**: Better understanding of subject/object relationships
**Action**: Enhance dependency parser with semantic role labeling

**Expected Impact**: Better context-based translation

---

## Recommended Next Steps

### Immediate (This Week)
1. **Fix version display** (done - was showing 0.3.0 in TitanPanel)
2. **Real-world testing** - Collect chat logs, identify failures
3. **Add missing vocabulary** from test failures
4. **Expand phrase patterns** based on common failures

### Short-Term (Next 2 Weeks)
5. **Expand dependency parser** - Add passive voice, modal verbs, conditional clauses
6. **More LanguageTool rules** - Extract 20-30 more systematic grammar rules
7. **WoW terminology** - Add more game-specific terms

### Medium-Term (Next Month)
8. **Template library** - Implement pattern templates for common chat types
9. **Enhanced context** - Better disambiguation for ambiguous words
10. **Verb expansion** - Add 50+ more verb forms

---

## How to Measure Improvement

### Before/After Testing
1. Run `Tests/test_comprehensive_translation.lua` before changes
2. Make improvements
3. Run test again, compare pass rates
4. Track:
   - Overall pass rate (%)
   - Failed translations (count and reasons)
   - Low confidence translations (count)
   - Specific failure categories

### Real-World Validation
1. Collect 100 random German chat messages from actual gameplay
2. Manually verify translations (gold standard)
3. Calculate accuracy before/after improvements
4. Identify remaining failure patterns

---

## Key Documents

- **Current Status**: `Docs/ACCURACY_IMPROVEMENT_ROADMAP.md`
- **Grammar Plans**: `Docs/GRAMMAR_IMPROVEMENT_PLAN.md`
- **LanguageTool Integration**: `Docs/LANGUAGETOOL_EXTRACTION_PLAN.md`
- **External Resources**: `Docs/EXTERNAL_RESOURCES.md`

---

## Summary

**Vocabulary**: Focus on real-world testing and WoW-specific terminology expansion
**Grammar**: Expand dependency parser and add more LanguageTool-inspired rules

**Start with testing** to identify specific gaps, then systematically address them.

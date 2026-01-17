# Grammar Improvement Plan

## Overview
This document outlines strategies and resources for improving the addon's grammar capabilities using external sources that can be bundled as static data.

## Key Constraint
**The addon runs offline in WoW Classic using Lua 5.1.** We cannot:
- Make live API calls
- Run heavy machine learning models
- Use external services

**We CAN:**
- Bundle static data files (vocabulary, grammar rules, morphology tables)
- Convert external rule sets to Lua format
- Pre-process and compress linguistic data

## External Resources We Can Integrate

### 1. LanguageTool German Rules (HIGH PRIORITY)
- **Source**: https://github.com/languagetool-org/languagetool
- **Location**: `languagetool/languagetool-language-modules/de/src/main/resources/org/languagetool/rules/de/`
- **Format**: XML files with pattern-based rules
- **Usage**: Extract and convert XML rules to Lua patterns
- **Benefits**: 
  - Case detection (nominative, accusative, dative, genitive)
  - Gender agreement (der/die/das)
  - Verb conjugation checks
  - Word order validation
  - Separable verb detection

**Example Rule We Could Extract:**
```xml
<rule id="VERB_WORD_ORDER" name="Verb position in subordinate clauses">
  <pattern>
    <token>wenn</token>
    <token regexp="yes">.*</token>
    <token>verb</token>
  </pattern>
  <message>In subordinate clauses, verbs go to the end.</message>
</rule>
```

### 2. German Verb Conjugation Database (HIGH PRIORITY)
- **Sources**:
  - Wiktionary German verb tables (can be scraped/downloaded)
  - DEMorphy morphology database
- **Format**: Static Lua tables mapping verb forms → infinitive
- **Usage**: Expand `Core/GermanMorphology.lua` with comprehensive verb tables
- **Benefits**:
  - Better verb recognition (currently only handles common irregulars)
  - Proper tense detection
  - More accurate translations

**Example Structure:**
```lua
GermanMorphology.VERB_CONJUGATIONS = {
    ["gehen"] = {
        present = {ich = "gehe", du = "gehst", er = "geht", ...},
        past = {ich = "ging", du = "gingst", ...},
        participle = "gegangen"
    },
    ...
}
```

### 3. German Word Frequency Lists (MEDIUM PRIORITY)
- **Sources**:
  - Leipzig Corpora Collection (German word frequencies)
  - OpenSubtitles German corpus
- **Usage**: Weight vocabulary matches by frequency, prioritize common words
- **Benefits**: Better confidence scoring, prioritize likely translations

### 4. Duden Grammar Rules (Reference, Manual Extraction)
- **Source**: Duden grammar guides (official German grammar)
- **Limitation**: Not directly downloadable, would need manual extraction
- **Usage**: Reference for building our own grammar rules
- **Focus Areas**:
  - Case usage (when to use accusative vs dative)
  - Article agreement
  - Adjective declension patterns

### 5. German Compound Word Dictionary (MEDIUM PRIORITY)
- **Source**: German word decomposition databases
- **Usage**: Improve compound word splitting (currently basic)
- **Benefits**: Better translation of long compound words

### 6. Parallel Corpus Data (Tatoeba) (LOW PRIORITY)
- **Source**: Tatoeba.org (German-English sentence pairs)
- **Limitation**: Large dataset, would need filtering/reduction
- **Usage**: Extract common phrase patterns for `phrases.lua`
- **Benefits**: More natural English translations

## Implementation Strategy

### Phase 1: Expand Morphology Module (Easiest Win)
1. Download/extract German verb conjugation tables
2. Convert to Lua format
3. Expand `Core/GermanMorphology.lua`
4. **Impact**: Better verb recognition, more accurate translations

### Phase 2: Extract LanguageTool Rules (High Impact)
1. Download LanguageTool repository
2. Extract German XML rules
3. Convert XML patterns to Lua regex patterns
4. Add as new grammar rules in `Languages/de/grammar.lua`
5. **Impact**: Catch more grammar errors, improve word order

### Phase 3: Vocabulary Frequency Weighting (Medium Impact)
1. Download German word frequency lists
2. Add frequency data to vocabulary entries
3. Modify confidence calculation to use frequency
4. **Impact**: Better confidence scores, prioritize likely translations

### Phase 4: Compound Word Database (Medium Impact)
1. Extract compound word decomposition rules
2. Enhance `Engine.SplitCompoundWord` function
3. **Impact**: Better translation of compound words

## Current Grammar Limitations

Based on code review:

1. **Limited Verb Recognition**: Only ~20 irregular verbs tracked
   - **Fix**: Expand to 200+ common verbs with full conjugation tables

2. **Pattern-Based Grammar Rules**: Manual rules, no systematic coverage
   - **Fix**: Extract systematic rules from LanguageTool

3. **Basic Word Order Fixes**: Handles simple cases but misses complex structures
   - **Fix**: Add rules for subordinate clauses, relative clauses

4. **No Case/Gender Validation**: Doesn't check if articles match nouns
   - **Fix**: Add noun gender database + case checking rules

5. **Compound Word Splitting**: Basic, only tries simple splits
   - **Fix**: Use decomposition database

## Recommended Starting Point

**Start with Phase 1 (Morphology Expansion)** because:
- Easiest to implement
- Immediate impact on verb recognition
- Low risk (additive changes)
- Can be done incrementally

## Tools Needed

1. **Scripts to convert external data to Lua:**
   - Python/Node.js scripts to download and convert data
   - XML → Lua pattern converter
   - CSV → Lua table converter

2. **Data preprocessing:**
   - Filter large datasets to relevant entries
   - Compress/optimize for WoW addon size limits

3. **Testing framework:**
   - Verify converted data works correctly
   - Benchmark performance impact

## Size Considerations

WoW addons have practical size limits. We should:
- Prioritize high-frequency/common words
- Use efficient data structures
- Consider lazy loading for large datasets
- Compress data where possible

## Next Steps

1. Research specific downloadable sources for verb conjugations
2. Create conversion scripts
3. Start with Phase 1 (Morphology expansion)
4. Test and iterate

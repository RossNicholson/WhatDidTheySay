# Grammar Improvement - Summary & Action Plan

## Quick Answer: Yes, We Can Use External Sources!

There are several open-source resources we can bundle as static data to improve grammar. Here's what's practical for a WoW addon:

## ✅ Feasible Improvements (Offline Static Data)

### 1. LanguageTool German Rules (HIGHEST IMPACT)
- **Source**: GitHub - https://github.com/languagetool-org/languagetool
- **What**: XML files with pattern-based grammar rules
- **How**: Convert XML patterns → Lua regex patterns → Add to `grammar.lua`
- **Size**: ~500KB of XML, convert to ~50-100KB of Lua rules
- **Impact**: Systematic coverage of common grammar errors
- **Effort**: Medium (4-8 hours to extract and convert)

### 2. Expanded Verb Conjugation Tables (EASIEST WIN)
- **Current**: Only ~20 irregular verbs tracked
- **Target**: 100-200 common verbs with full conjugation forms
- **Sources**: 
  - Manual research (Wiktionary, online verb tables)
  - Extract from German verb databases
- **Size**: ~50-100KB for 200 verbs
- **Impact**: Better verb recognition, more accurate translations
- **Effort**: Low-Medium (2-4 hours manual compilation)

### 3. Word Frequency Data (MEDIUM IMPACT)
- **Source**: Leipzig Corpora Collection (free, downloadable)
- **What**: Word frequency lists to weight vocabulary matches
- **Usage**: Improve confidence scoring, prioritize likely translations
- **Size**: ~200KB for top 10,000 words
- **Impact**: Better confidence scores, fewer false positives
- **Effort**: Low (2-3 hours to download and convert)

### 4. Noun Gender Database (MEDIUM IMPACT)
- **What**: Common German nouns → gender (der/die/das) + plural forms
- **Usage**: Validate article-noun agreement, better translations
- **Size**: ~50KB for 2,000-3,000 common nouns
- **Impact**: More natural English output
- **Effort**: Medium (3-4 hours manual compilation)

## ❌ NOT Feasible (Requires Runtime APIs)

These would require internet connectivity or heavy processing:
- LanguageTool API calls
- Machine learning models
- Real-time parsing services
- Online dictionaries

## Recommended Implementation Order

### Phase 1: Expand Verb Conjugations (START HERE - Easiest)
**Why**: Immediate impact, low risk, easy to test
**What**: Add 100-150 more verb forms to `Core/GermanMorphology.lua`
**Example**:
```lua
GermanMorphology.IRREGULAR_VERBS = {
    -- Existing 20 verbs...
    
    -- Add 100 more common verbs
    ["kommt"] = "kommen",
    ["komme"] = "kommen",
    ["kam"] = "kommen",
    ["gekommen"] = "kommen",
    -- ... etc
}
```

### Phase 2: Extract LanguageTool Rules (HIGHEST IMPACT)
**Why**: Systematic grammar coverage
**What**: Extract 20-30 most relevant rules from LanguageTool
**Example Conversion**:
```xml
<!-- LanguageTool XML -->
<rule id="VERB_POSITION_SUBORDINATE">
  <pattern>
    <token>wenn</token>
    <token regexp="yes">.*</token>
    <token postag="VER:.*"></token>
  </pattern>
</rule>
```
↓ Convert to ↓
```lua
-- Languages/de/grammar.lua
{
    from = "wenn (.+) (.+ verb)",
    to = "%1 %2", -- Fix word order in subordinate clauses
    priority = 15,
    note = "Verb goes to end in subordinate clauses"
}
```

### Phase 3: Add Word Frequency Weighting (POLISH)
**Why**: Better confidence scores
**What**: Add frequency data to vocabulary, modify confidence calculation

## Current Grammar System Strengths

✅ **Pattern-based rules** - Flexible and maintainable
✅ **Priority system** - Specific rules apply first
✅ **Iterative application** - Rules can build on each other
✅ **Caching** - Compiled patterns for performance

## Current Limitations

❌ **Limited verb coverage** - Only ~20 irregular verbs
❌ **Manual rule creation** - No systematic coverage
❌ **Basic morphology** - Simple pattern matching, not comprehensive
❌ **No frequency weighting** - All vocabulary treated equally
❌ **No gender/agreement checking** - Doesn't validate articles

## Next Steps

1. **Research & Compile Verb List** (1-2 hours)
   - List top 100-150 German verbs used in WoW chat
   - Look up conjugation forms
   - Add to `GermanMorphology.lua`

2. **Extract LanguageTool Rules** (4-6 hours)
   - Download LanguageTool repository
   - Identify relevant German rules
   - Convert XML → Lua patterns
   - Test on chat logs

3. **Add Frequency Data** (2-3 hours)
   - Download Leipzig frequency list
   - Filter to top 10,000 words
   - Add frequency to vocabulary entries
   - Update confidence calculation

## Size Budget

Current addon size: ~220KB (language files)
Recommended additions:
- Verb conjugations: +50KB
- LanguageTool rules: +30KB
- Frequency data: +20KB
- Noun gender: +30KB
**Total**: +130KB = ~350KB total (very reasonable for WoW addon)

## Testing Strategy

After each phase:
1. Run comprehensive test suite
2. Test on real chat logs
3. Benchmark performance (ensure no FPS impact)
4. Commit and document changes

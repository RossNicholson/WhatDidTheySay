# External Resources for Grammar Improvement

## Downloadable Static Data Sources

### 1. LanguageTool German Rules
**Repository**: https://github.com/languagetool-org/languagetool
**Path**: `languagetool-language-modules/de/src/main/resources/org/languagetool/rules/de/`
**Files**: XML files with pattern-based grammar rules
**License**: LGPL 2.1 (compatible with MIT)
**Size**: ~500KB of XML rules

**How to Use:**
1. Clone/download the repository
2. Extract German rule XML files
3. Convert XML patterns to Lua regex patterns
4. Add to `Languages/de/grammar.lua` with appropriate priority

**Example Conversion:**
```xml
<!-- LanguageTool XML -->
<rule>
  <pattern>
    <token>wenn</token>
    <token regexp="yes">.*</token>
    <token postag="VER:3:SIN:PRÄ:AKT"></token>
  </pattern>
</rule>
```
```lua
-- Converted to Lua
{
    from = "wenn (.+) (.+)",
    to = "%1 %2", -- Fix word order
    priority = 15,
}
```

### 2. German Verb Conjugations

#### Option A: Wiktionary Data
**Source**: Wiktionary dump files
**Format**: JSON/XML
**Size**: Very large, needs filtering
**Process**: Extract verb conjugation tables, convert to Lua

#### Option B: Manual Compilation
**Source**: Common German verbs list (top 200-500 verbs)
**Format**: Manual research → Lua tables
**Size**: ~50-100KB
**Process**: Research verb forms, create lookup tables

**Recommended**: Start with manual compilation of top 100 verbs used in WoW chat

### 3. German Word Frequencies
**Source**: Leipzig Corpora Collection
**URL**: https://wortschatz.uni-leipzig.de/en/download
**Format**: Tab-separated (word, frequency)
**Size**: ~10MB uncompressed, filter to top 10,000 words = ~200KB
**Usage**: Add frequency to vocabulary entries for confidence weighting

### 4. Compound Word Database
**Source**: German word decomposition tools/research papers
**Alternative**: Build incrementally from patterns
**Format**: Lua table of compound word → [parts]
**Size**: ~100KB for common compounds
**Usage**: Enhance `Engine.SplitCompoundWord`

### 5. German Noun Gender Database
**Source**: Wiktionary, German dictionaries
**Format**: Lua table: noun → {gender: "m"/"f"/"n", plural: "..."}
**Size**: ~50KB for common nouns
**Usage**: Validate article-noun agreement (der/die/das)

## Practical Implementation Steps

### Step 1: Expand Verb Conjugations (EASIEST)
1. Research top 100-200 German verbs used in WoW chat
2. Look up conjugation tables (use online resources)
3. Create Lua tables in `Core/GermanMorphology.lua`
4. Expand `NormalizeToInfinitive` to use these tables

**Estimated Time**: 2-4 hours
**Impact**: High - better verb recognition

### Step 2: Extract LanguageTool Rules (HIGH IMPACT)
1. Download LanguageTool repository
2. Identify relevant German grammar rules (avoid style rules)
3. Convert 10-20 most relevant rules to Lua patterns
4. Add to `Languages/de/grammar.lua`

**Estimated Time**: 4-8 hours
**Impact**: Very High - systematic grammar fixes

### Step 3: Add Word Frequency Data (MEDIUM IMPACT)
1. Download Leipzig Corpus frequency list
2. Filter to top 5,000-10,000 words
3. Add frequency field to vocabulary entries
4. Modify confidence calculation to weight by frequency

**Estimated Time**: 2-3 hours
**Impact**: Medium - better confidence scores

## Tools for Data Conversion

### Python Script Example (for LanguageTool conversion):
```python
import xml.etree.ElementTree as ET
import re

def convert_languagetool_rule(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    
    for rule in root.findall('.//rule'):
        pattern_text = ""
        # Convert XML pattern to Lua regex
        # ... conversion logic ...
        
        yield {
            'from': pattern_text,
            'to': replacement_text,
            'priority': 15
        }
```

### Lua Table Generator (for verb conjugations):
```lua
-- Generate verb conjugation lookup table
local verb_forms = {}
for infinitive, conjugations in pairs(VERB_DATA) do
    for form, _ in pairs(conjugations.present) do
        verb_forms[form] = infinitive
    end
    verb_forms[conjugations.past.ich] = infinitive
    verb_forms[conjugations.participle] = infinitive
end
```

## Size Optimization

To keep addon size reasonable:
- **Verb conjugations**: Limit to 200 most common verbs
- **Grammar rules**: Focus on chat-relevant rules (skip formal writing rules)
- **Word frequencies**: Top 5,000 words only
- **Compression**: Use efficient Lua table structures

## Testing Strategy

1. **Unit tests**: Test each new verb form normalization
2. **Integration tests**: Test grammar rules on real chat logs
3. **Performance tests**: Ensure no FPS impact
4. **Regression tests**: Ensure existing translations still work

## Recommended Priority

1. **Phase 1** (Week 1): Expand verb conjugations - 100 verbs
2. **Phase 2** (Week 2): Extract 10-15 LanguageTool rules
3. **Phase 3** (Week 3): Add word frequency weighting
4. **Phase 4** (Ongoing): Incrementally add more verbs/rules based on real usage

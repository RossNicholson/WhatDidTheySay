# Translation Accuracy Improvement Roadmap

## Current State
- ✅ **Vocabulary**: 4,400+ German entries (massive expansion complete)
- ✅ **Dependency Parsing**: Basic implementation for simple sentences, questions, relative/subordinate clauses
- ✅ **Phrases**: Multi-word expressions handled
- ✅ **Patterns**: Regex-based sentence structure matching
- ✅ **Grammar Rules**: Post-processing word order fixes
- ⚠️ **Estimated Accuracy**: ~75-80% for simple sentences, ~60-70% for complex sentences

## Priority Improvement Areas (Ranked by Impact)

### 🔴 HIGH PRIORITY - Immediate Impact

#### 1. **Comprehensive Real-World Testing** 
**Impact**: Identifies specific failure points  
**Effort**: Medium (1-2 days)  
**Action**: 
- Run test suites on real chat logs
- Collect failed translations
- Categorize failures by type (word order, missing vocabulary, context, etc.)
- Create prioritized list of fixes

**Expected Gain**: +5-10% accuracy by fixing known issues

---

#### 2. **Expand Dependency Parser Coverage**
**Impact**: High - handles complex sentences correctly  
**Effort**: Medium-High (3-5 days)  
**Current**: Handles simple SUBJ→VERB→OBJ, questions, relative/subordinate clauses  
**Needs**:
- Passive voice: "Der Mann wurde gesehen" → "The man was seen"
- Conditional clauses: "Wenn du kommst, dann..." → "If you come, then..."
- Indirect speech: "Er sagte, dass er kommt" → "He said that he comes"
- Modal verbs with infinitives: "Ich muss gehen" → "I must go"
- Perfect tense improvements: "Ich habe gemacht" → "I have made"

**Expected Gain**: +10-15% accuracy for complex sentences

---

#### 3. **Add More Phrase Patterns**
**Impact**: Medium-High - handles idioms and common expressions  
**Effort**: Low-Medium (1-2 days)  
**Current**: Basic phrases in `Languages/de/phrases.lua`  
**Needs**:
- Common gaming idioms: "los geht's", "auf geht's", "kein problem"
- Temporal phrases: "vor kurzem", "seit langem", "in letzter zeit"
- Conditional phrases: "falls möglich", "wenn nötig"
- WoW-specific: "lfm", "wtb", "wts", "guild invite"

**Expected Gain**: +3-5% accuracy (covers common chat patterns)

---

#### 4. **Improve Grammar Rules**
**Impact**: Medium - fixes remaining word order issues  
**Effort**: Low-Medium (1-2 days)  
**Current**: Post-processing regex-based fixes  
**Needs**:
- Better past tense handling: "Ich habe gesagt" → "I said" (not "I have said")
- Improved question word order
- Better handling of separable verb prefixes
- More natural phrasing rules

**Expected Gain**: +3-5% accuracy

---

### 🟡 MEDIUM PRIORITY - Significant Impact

#### 5. **Template Library for Common Patterns**
**Impact**: High for covered patterns, low for novel sentences  
**Effort**: Medium (2-3 days)  
**Concept**: Pre-translated sentence templates for common WoW chat patterns

**Templates to Add**:
```
- LFG: "LFM [ROLE] für [DUNGEON]" → "LFM [ROLE] for [DUNGEON]"
- Trading: "WTS [ITEM] für [PRICE]" → "WTS [ITEM] for [PRICE]"
- Guild: "Deutsche Gilde sucht [ROLE]" → "German guild looking for [ROLE]"
- Questions: "Kannst du [ACTION]?" → "Can you [ACTION]?"
```

**Expected Gain**: +5-8% accuracy for covered patterns (higher if templates are comprehensive)

---

#### 6. **Enhanced Context Window & Disambiguation**
**Impact**: Medium - better word sense disambiguation  
**Effort**: Medium (2-3 days)  
**Current**: 3-5 word context window, basic disambiguation  
**Needs**:
- Expand context window to full sentence/clause
- Semantic role understanding (subject vs object)
- Better disambiguation for: "von", "wie", "das", "der", "die"
- Grammar-aware context (understand if word is subject, object, etc.)

**Expected Gain**: +3-5% accuracy

---

#### 7. **Separable Verb & Prefix Handling**
**Impact**: Medium - common in German gaming chat  
**Effort**: Low-Medium (1-2 days)  
**Current**: Basic separable verb recognition in dependency parser  
**Needs**:
- Better detection when prefix is separated: "macht auf" vs "aufmachen"
- Handle in dependency tree correctly
- Improve in grammar rules

**Expected Gain**: +2-4% accuracy

---

### 🟢 LOW PRIORITY - Nice to Have

#### 8. **WoW-Specific Formatting**
**Impact**: Low-Medium - improves readability  
**Effort**: Low (1 day)  
**Needs**:
- Preserve item links: `[item name]` format
- Handle quest markers correctly
- Preserve color codes if needed
- Better handling of abbreviations in context

**Expected Gain**: +1-2% accuracy (mostly visual improvement)

---

#### 9. **Better Confidence Scoring**
**Impact**: Low - improves auto-display decisions  
**Effort**: Low (1 day)  
**Needs**:
- Weight vocabulary frequency
- Better scoring for partial translations
- Context-aware confidence (higher if structure matches)

**Expected Gain**: Better user experience (fewer false positives/negatives)

---

## Recommended Implementation Order

### Phase 1: Quick Wins (Week 1)
1. **Comprehensive Testing** - Identify failures
2. **Add More Phrases** - Common expressions
3. **Improve Grammar Rules** - Fix known issues

**Expected Gain**: +8-12% accuracy

### Phase 2: Dependency Parser Enhancement (Week 2)
4. **Expand Dependency Parser** - Complex structures
5. **Separable Verb Improvements** - Better prefix handling

**Expected Gain**: +12-18% accuracy (cumulative with Phase 1)

### Phase 3: Template & Context (Week 3)
6. **Template Library** - Common WoW patterns
7. **Enhanced Context** - Better disambiguation

**Expected Gain**: +8-12% accuracy (cumulative)

---

## Target Accuracy Goals

| Sentence Type | Current | Target (Phase 1) | Target (All Phases) |
|---------------|---------|------------------|---------------------|
| Simple | 75-80% | 85-90% | 90-95% |
| Complex | 60-70% | 75-80% | 85-90% |
| Overall | 70-75% | 80-85% | 87-92% |

---

## Success Metrics

Track improvement by:
1. **Test Suite Pass Rate**: Run `test_comprehensive.lua` before/after
2. **Real-World Accuracy**: Sample 100 random chat messages, manually check
3. **Confidence Distribution**: More translations above 0.50 threshold
4. **Failure Categories**: Reduce each category by target percentage

---

## Next Steps

1. **Start with Testing**: Run comprehensive test suite, document failures
2. **Prioritize Failures**: Which failures are most common?
3. **Implement Phase 1**: Quick wins first
4. **Measure**: Compare before/after accuracy
5. **Iterate**: Move to Phase 2 based on results

---

## Questions to Answer

- Which sentence types fail most often? (simple, complex, questions, etc.)
- What are the most common failure patterns? (word order, missing vocab, context)
- Are there specific WoW chat patterns that always fail?
- Is dependency parser being used correctly, or falling back to word-by-word?

**Start by running tests to answer these questions!**

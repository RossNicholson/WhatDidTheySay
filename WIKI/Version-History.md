# Version History

Complete changelog for What Did They Say? addon.

---

## Version 0.5.0

**Dependency Parsing - Structure-Based Translation**

This release introduces a major architectural improvement: **dependency parsing** for structure-based translation. Instead of word-by-word translation with post-processing fixes, the engine now understands grammatical relationships and produces correct English word order from the start.

### Dependency Parsing Engine

- **Structure-Based Translation**: Parses sentences into dependency trees showing grammatical relationships (subject → verb, verb → object, etc.)
- **Correct Word Order**: Produces correct English word order without post-processing grammar fixes
- **Complex Sentence Support**: Handles relative clauses, subordinate clauses, and questions
- **Question Word Detection**: Recognizes question words (wo, was, wer, wie, wann, warum) and handles V1 word order
- **Subordinate Clause Detection**: Identifies conjunctions (dass, wenn, weil, obwohl) and parses subordinate clauses
- **Relative Clause Detection**: Detects relative pronouns (der, die, das) after commas and parses relative clauses

### Translation Quality Improvements

- More accurate translations for complex German sentence structures
- Better handling of questions and subordinate clauses
- Improved word order for all sentence types
- Foundation for future grammar improvements

### Technical Details

- New `Core/DependencyParser.lua` module (700+ lines)
- Integrated into main translation pipeline with automatic fallback
- Maintains backward compatibility with existing vocabulary and phrase matching
- Performance-optimized with early exit conditions

**This represents a significant step toward higher translation accuracy for complex German sentences.**

### Additional Improvements

- **Massive Vocabulary Expansion**: 4,400+ German vocabulary entries
- **Phrase Patterns**: 1,007 multi-word expressions and idioms
- **Sentence Patterns**: 275 structure-based translation templates
- **Grammar Rules**: 544 post-processing rules including duplicate word fixes
- **LanguageTool Integration**: 25+ systematic grammar rules inspired by LanguageTool patterns

---

## Version 0.4.0

**Major Translation Engine Improvements & Vocabulary Expansion**

This release represents a significant leap in translation accuracy through comprehensive engine improvements and massive vocabulary expansion.

### Engine Improvements

- **Compound Word Decomposition**: Automatically splits German compound words (e.g., "levelgilde" → "level" + "gilde")
- **Sentence Type Detection**: Detects questions, commands, and statements for better word order
- **Separable Verb Handling**: Recognizes separated verb prefixes (e.g., "macht auf" = "opens")
- **Verb Conjugation Recognition**: Normalizes verb forms to base form for better vocabulary matching
- **Enhanced Context Window**: Expanded from 2 to 3-5 words for better contextual translation
- **Smarter Phrase Matching**: Fuzzy matching with article variations and capitalization
- **Pattern Priority System**: More specific patterns apply first
- **Optimized Grammar Rules**: Compiled and cached with priority system, prevents infinite loops
- **Slash-Separated Translation Fix**: Intelligently chooses single best option instead of showing all (e.g., "on/up/at" → "on")

### Massive Vocabulary Expansion

- **600+ WoW-Specific Terms**: Zones, dungeons, raids, items, classes, professions, stats, mechanics
- **100+ Common Gaming Terms**: Pet/hunter terms, gaming slang, colloquialisms
- **80+ New Phrases**: Common gaming phrases, pet commands, social expressions
- **Critical Missing Words**: Added fundamental vocabulary (ich, am, sage, geändert, etc.)

### Translation Quality

- Fixed major translation failures (e.g., "ich glaub ich hab..." now translates correctly)
- Improved word order for questions and complex sentences
- Better handling of past tense and verb forms
- Enhanced punctuation and special character handling

**All improvements tested and verified. Translation accuracy significantly improved while maintaining performance.**

---

## Version 0.3.0

- ✅ **Continued German Translation Improvements** - Ongoing vocabulary expansion, phrase additions, and grammar refinements based on real-world chat logs
- ✅ **Enhanced Translation Accuracy** - Added missing common words, phrases, and contextual patterns for better coverage
- ✅ **Grammar Rule Refinements** - Improved post-processing rules for more natural English output
- ✅ **Confidence Scoring Adjustments** - Optimized thresholds for better translation display

---

## Version 0.2.0

- ✅ **Guild Chat Support** - Added translation support for guild chat channel
- ✅ **Titan Panel Integration** - Optional status display in Titan Panel bar (if Titan Panel is installed)
- ✅ **Testing Commands** - Added `/wdts test`, `/wdts suite`, `/wdts debug`, `/wdts clear`, `/wdts clearcache` for development and debugging
- ✅ **Improved False Positive Protection** - Excludes universal gaming abbreviations (LF, LFM, WTS, WTB, tank, DM, etc.) from triggering German translation
- ✅ **Enhanced Mixed-Language Detection** - Requires actual German function words or characters (ä, ö, ü, ß) before translating, preventing English messages with abbreviations from being incorrectly translated
- ✅ **Expanded German Vocabulary** - Added common words: "zum", "leveln", "alles", "können", "güldischer", "bsf" (Blackfathom Deeps), and more
- ✅ **Better Phrase Matching** - Added phrases like "zum leveln", "noch alles" for more accurate translations
- ✅ **Refined Language Detection** - More accurate distinction between English and German messages, especially for abbreviation-heavy messages

---

## Version 0.1.0

- ✅ Initial stable release
- ✅ German → English translation support
- ✅ Automatic translation with confidence scoring
- ✅ Configurable channels and settings
- ✅ Translation caching and throttling
- ✅ Intent detection (LFG, invites, ready status, etc.)
- ✅ Protected token handling (links, names, numbers)
- ✅ Performance optimizations
- ✅ Comprehensive test suite

---

## Future Plans

- Additional language packs (Russian, French, Spanish, Portuguese, Italian, Polish, Dutch, Swedish)
- Continued grammar improvements
- Enhanced vocabulary coverage
- Performance optimizations

See [Language Packs](Language-Packs) for details on planned languages.

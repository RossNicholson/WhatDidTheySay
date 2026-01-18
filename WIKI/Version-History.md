# Version History

Complete changelog for What Did They Say? addon.

---

## Version 0.7.0

**WoW Abbreviations Language Pack**

This release introduces a **separate, independent language pack for WoW gaming abbreviations**, allowing users to enable/disable abbreviation expansion independently from foreign language translation.

### ✨ Major Feature: WoW Abbreviations Language Pack

- **New Language Pack:** `wow` - Separate, toggleable language pack for gaming abbreviations
- **Independent Control:** Enable/disable abbreviation expansion separately from foreign languages
- **Auto-Detection:** Automatically expands abbreviations when 30%+ of words are WoW abbreviations
- **Explicit Activation:** Can be activated with `sourceLang="wow"`

### Comprehensive Abbreviation Coverage

- **LFG/LFM:** LF → Looking for, LFM → Looking for more, LF1M-4M → Looking for 1-4 more
- **Trading:** WTS → Want to sell, WTB → Want to buy, WTT → Want to trade
- **Classes:** War/Warr → Warrior, Mage, Rog → Rogue, Hunt → Hunter, Priest, Lock/WL → Warlock, Dru/Dudu → Druid, Sham → Shaman, Pala/Pal/Pally → Paladin
- **Roles:** Tank, Heal/Healer, DPS, MT → Main tank, OT → Off tank
- **Dungeons:** All Classic Era dungeons (DM, VC, BFD, SFK, RFK, RFD, Gnomer, Uldaman, ZF, Mara, Scholo, Strat, BRD, UBRS, LBRS)
- **Raids:** MC → Molten Core, Ony → Onyxia's Lair, BWL → Blackwing Lair, ZG → Zul'Gurub, AQ → Ahn'Qiraj, Naxx → Naxxramas
- **Cities:** SW → Stormwind, Org → Orgrimmar, IF → Ironforge, Darna → Darnassus, TB → Thunder Bluff, UC → Undercity
- **Actions:** Inv → Invite, Summon, Port → Portal, Res → Resurrect, Pull, Buff, Rebuff
- **Status:** AFK → Away from keyboard, BRB → Be right back, Ty → Thank you, NP → No problem, Sry → Sorry
- **Items/Currency:** G → Gold, S → Silver, C → Copper, Bags, Mounts, Pets
- **Combat:** CC → Crowd control, Add → Additional enemy, Aggro, AOE → Area of effect, DOT → Damage over time, HOT → Heal over time
- **Professions:** Alch → Alchemy, BS → Blacksmithing, Ench → Enchanting, Eng → Engineering, Herb → Herbalism, LW → Leatherworking, Tailor → Tailoring
- **And much more!**

### Translation Examples

- `"LF 1 tank strat ud"` → `"Looking for 1 tank Stratholme Undead side"`
- `"WTS [Large Green Bag] 5g"` → `"Want to sell [Large green Bag] 5 gold"`
- `"AFK brb 5 min"` → `"away from keyboard be right back 5 minutes"`
- `"LFM 2 dps for UBRS"` → `"Looking for more 2 dps for Upper Blackrock Spire"`

### Technical Improvements

- **Smart Detection:** WoW pack only activates for English messages (skips if foreign language characters detected)
- **Non-Interfering:** Doesn't interfere with foreign language translation
- **Grammar Rules:** Post-processing rules for correct article usage, capitalization, and pluralization
- **Pattern Matching:** Complex abbreviation patterns (e.g., "LF 1M tank", "WTS item 50g")
- **Centralized Abbreviations:** Created `Utils.UNIVERSAL_WOW_ABBREVIATIONS` list (268 abbreviations) for consistency

### Language Pack Structure

- **Languages/wow/metadata.lua** - Language pack metadata
- **Languages/wow/tokens.lua** - 150+ abbreviation expansions
- **Languages/wow/phrases.lua** - 30+ multi-word abbreviations
- **Languages/wow/patterns.lua** - 10+ complex abbreviation patterns
- **Languages/wow/grammar.lua** - 20+ post-processing rules
- **Languages/wow/intents.lua** - WoW-specific intents (LFG, TRADING, etc.)

### Configuration

The WoW Abbreviations language pack can be enabled/disabled independently from other language packs in the addon configuration. Users can:
- Enable WoW pack for abbreviation expansion
- Enable foreign language packs (German, French, etc.) for translation
- Use both together - abbreviations expand, foreign languages translate

### Bug Fixes

- Fixed duplicate expansion issues (e.g., "Stratholme Stratholme" → "Stratholme")
- Fixed "dps" expansion in context (keeps as "dps" when used as role abbreviation)
- Fixed spacing issues with currency and item names

**This represents the first language pack dedicated to abbreviation expansion, giving users independent control over this feature.**

---

## Version 0.6.0

**French Language Pack - Complete Implementation**

This release introduces full support for **French → English translation**, making What Did They Say? the first offline WoW Classic addon to support two languages simultaneously.

### French Language Pack

- **Complete Implementation** - Full French (fr → en) translation support
- **Comprehensive Vocabulary** - 2,756+ French vocabulary entries
- **Extensive Phrases** - 1,620+ multi-word phrases and expressions
- **Pattern Matching** - 1,380+ sentence patterns for complex structures
- **Grammar Rules** - 1,802 grammar rules for French-specific structures
- **100% Test Pass Rate** - All 150 comprehensive test cases passing

### French Vocabulary Coverage

- **Directions** - nord, sud, est, ouest, directions
- **Combat Terms** - pull, add, aggro, inc, focus, interrupt, cc, aoe, dot
- **Faction & Races** - alliance, horde, races with plurals
- **Gaming Terms** - WoW-specific terminology
- **Common Expressions** - Everyday French phrases and idioms

### Engine Improvements

- **English Gaming Terms Support** - Allows English terms (like "tank", "lfg", "wtb") to pass through when sourceLang is explicitly provided
- **Emoticon Handling** - Emoticons like ":)" now pass through correctly when sourceLang is explicit
- **Explicit Source Language** - Improved handling when user specifies source language explicitly

### Test Results

- **French Extensive Tests**: 150/150 passed (100.0%)
- **German Guild Chat Tests**: 27/27 passed (100.0%)
- **Real-World Coverage**: Successfully handles gaming abbreviations, emoticons, and mixed-language messages

### Technical Details

- Full French language pack with all required files (tokens, phrases, patterns, grammar, intents, metadata)
- FrenchMorphology.lua module structure (ready for future implementation)
- Enhanced engine logic for explicit source language handling
- Improved language detection for French function words

**This represents the first major expansion beyond German, bringing bilingual translation support to WoW Classic players.**

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

- **Massive Vocabulary Expansion**: 5,410+ German vocabulary entries
- **Phrase Patterns**: 2,267 multi-word expressions and idioms
- **Sentence Patterns**: 1,401 structure-based translation templates
- **Grammar Rules**: 3,067 post-processing rules including duplicate word fixes
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

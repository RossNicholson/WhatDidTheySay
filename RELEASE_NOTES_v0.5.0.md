# Version 0.5.0 Release Notes

## 🚀 Dependency Parsing - Structure-Based Translation

This release introduces a major architectural improvement: **dependency parsing** for structure-based translation. Instead of word-by-word translation with post-processing fixes, the engine now understands grammatical relationships and produces correct English word order from the start.

### ✨ Major Features

#### Dependency Parsing Engine
- **Structure-Based Translation**: Parses sentences into dependency trees showing grammatical relationships (subject → verb, verb → object, etc.)
- **Correct Word Order**: Produces correct English word order without post-processing grammar fixes
- **Complex Sentence Support**: Handles relative clauses, subordinate clauses, and questions
- **Question Word Detection**: Recognizes question words (wo, was, wer, wie, wann, warum) and handles V1 word order
- **Subordinate Clause Detection**: Identifies conjunctions (dass, wenn, weil, obwohl) and parses subordinate clauses
- **Relative Clause Detection**: Detects relative pronouns (der, die, das) after commas and parses relative clauses

### 📈 Translation Quality Improvements

- More accurate translations for complex German sentence structures
- Better handling of questions and subordinate clauses
- Improved word order for all sentence types
- Foundation for future grammar improvements

### 🔧 Technical Details

- New `Core/DependencyParser.lua` module (700+ lines)
- Integrated into main translation pipeline with automatic fallback
- Maintains backward compatibility with existing vocabulary and phrase matching
- Performance-optimized with early exit conditions

### 📚 Additional Improvements

- **Massive Vocabulary Expansion**: 4,400+ German vocabulary entries
- **Phrase Patterns**: 1,007 multi-word expressions and idioms
- **Sentence Patterns**: 275 structure-based translation templates
- **Grammar Rules**: 544 post-processing rules including duplicate word fixes
- **LanguageTool Integration**: 25+ systematic grammar rules inspired by LanguageTool patterns

### 🌐 Language Packs

- **German (de → en)**: ✅ Available and actively improved
- **Placeholder packs added** for future languages: Russian, French, Spanish, Portuguese, Italian, Polish, Dutch, Swedish (not yet functional)

### 🐛 Bug Fixes

- Fixed version display in TitanPanel (now shows 0.5.0)
- Fixed scrollbar background in configuration UI
- Improved placeholder language pack detection

### 📋 Requirements

- **WoW Classic Era** (Interface Version 11508)
- **Dependencies**: None (Titan Panel optional)

### 📥 Installation

1. Download `WhatDidTheySay-v0.5.0.zip` from this release
2. Extract to `World of Warcraft\_classic_era_\Interface\AddOns\`
3. Ensure the folder structure is: `AddOns/WhatDidTheySay/WhatDidTheySay.toc`
4. Enable in WoW Classic AddOns menu
5. Configure with `/wdts` command

### ⚠️ Beta Status

This is a **beta release**. German translation is actively being improved based on real-world feedback. Translation quality may vary and some messages may not translate if confidence is too low (by design to avoid incorrect translations).

### 📖 Documentation

Complete documentation available in the [Wiki](https://github.com/RossNicholson/WhatDidTheySay/wiki):
- [Installation Guide](https://github.com/RossNicholson/WhatDidTheySay/wiki/Installation)
- [User Guide](https://github.com/RossNicholson/WhatDidTheySay/wiki/User-Guide)
- [Configuration](https://github.com/RossNicholson/WhatDidTheySay/wiki/Configuration)
- [Troubleshooting](https://github.com/RossNicholson/WhatDidTheySay/wiki/Troubleshooting)

### 🙏 Thanks

Thank you to everyone who has provided feedback and tested the addon during beta development!

---

**This represents a significant step toward higher translation accuracy for complex German sentences.**

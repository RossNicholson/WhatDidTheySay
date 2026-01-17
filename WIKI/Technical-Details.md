# Technical Details

## 🏗️ Architecture Overview

**What Did They Say?** is a rule-based, offline translation system built specifically for World of Warcraft Classic. All translation logic runs locally in-game using Lua 5.1.

### Project Structure

```
WhatDidTheySay/
├── Core/                    # Core translation engine
│   ├── Engine.lua          # Main translation pipeline
│   ├── Tokenizer.lua       # Tokenization and protection logic
│   ├── LanguageDetect.lua  # Language detection
│   ├── Confidence.lua      # Confidence scoring
│   ├── ChatHooks.lua       # Chat event interception
│   ├── DependencyParser.lua # Dependency parsing (v0.5.0+)
│   ├── GermanMorphology.lua # German linguistic utilities
│   └── Utils.lua           # Shared utilities
├── Languages/               # Language packs
│   ├── en/                 # English (target language)
│   └── de/                 # German (source language)
│       ├── tokens.lua      # Vocabulary dictionary
│       ├── intents.lua     # Intent patterns
│       ├── patterns.lua    # Phrase patterns
│       ├── phrases.lua     # Multi-word phrases
│       ├── grammar.lua     # Grammar rules
│       └── metadata.lua    # Language metadata
├── UI/                      # User interface
│   ├── Config.lua          # Configuration window
│   ├── Widgets.lua         # UI components
│   └── TitanPanel.lua      # Titan Panel integration (optional)
├── WhatDidTheySay.lua      # Addon entry point
└── WhatDidTheySay.toc      # Addon manifest
```

### Core Principles

1. **No External Dependencies** - All processing happens in-game
2. **Rule-Based** - No machine learning, pure pattern matching
3. **Performance First** - Optimized for real-time chat translation
4. **Conservative** - Silent when uncertain to avoid wrong translations

## 📊 Translation Pipeline

Every message goes through these steps:

```
Message → Tokenization → Language Detection → Intent Detection → 
[Dependency Parsing OR Pattern Matching] → Phrase Matching → 
Word Translation → Grammar Rules → Confidence Scoring → Display Decision
```

**Note:** Dependency parsing (v0.5.0+) is attempted first for structure-based translation. If it fails, the engine falls back to pattern matching and word-by-word translation.

### 1. Tokenization

**File:** `Core/Tokenizer.lua`

Splits messages into structured tokens:
- **Words** - Normal words for translation
- **Numbers** - Protected, never modified
- **Punctuation** - Preserved in position
- **Protected Items** - Item links, spell links, player names, etc.

**Protected Tokens:**
- Item links: `|c...|Hitem:...|h...|h|r`
- Spell links: `|c...|Hspell:...|h...|h|r`
- Quest links: `|c...|Hquest:...|h...|h|r`
- Raid icons: `{rt1}` - `{rt8}`
- Player names
- Coordinates

### 2. Language Detection

**File:** `Core/LanguageDetect.lua`

Determines if message needs translation:

**Methods:**
1. **Function Word Matching** - Checks for language-specific function words
2. **Character Hints** - Looks for language-specific characters (ä, ö, ü, ß)
3. **Vocabulary Fallback** - Checks if words exist in language pack tokens

**Threshold:** 0.30 (30%) minimum confidence

**Special Handling:**
- Single-word messages: Lower threshold (0.20) if word in vocabulary
- Two-word messages: Lower threshold (0.25) if words in vocabulary
- Universal abbreviations (LF, LFM, WTS) excluded from detection

### 3. Intent Detection

**File:** `Core/Engine.lua` (DetectIntent function)

Recognizes player intents:
- **LFG** - Looking for group ("LFM", "LF tank")
- **Invites** - Invitation requests ("inv", "invite me")
- **Ready Status** - Ready checks ("ready", "rdy")
- **Trading** - Trade requests ("WTS", "WTB")
- **Questions** - Interrogative sentences

**Scoring:** 0.0 - 1.0, used in confidence calculation

### 4. Dependency Parsing (v0.5.0+)

**File:** `Core/DependencyParser.lua`

Parses sentences into dependency trees showing grammatical relationships:
- **Structure-Based Translation**: Understands subject → verb → object relationships
- **Correct Word Order**: Produces English word order without post-processing
- **Complex Sentence Support**: Handles relative clauses, subordinate clauses, questions
- **Question Word Detection**: Recognizes question words (wo, was, wer, wie, wann, warum)
- **Subordinate Clause Detection**: Identifies conjunctions (dass, wenn, weil, obwohl)
- **Relative Clause Detection**: Detects relative pronouns (der, die, das)

**Fallback:** If dependency parsing fails, falls back to pattern matching.

### 5. Pattern Matching

**File:** `Core/Engine.lua` (ApplyPatterns function)

Matches regex-like patterns for complex structures:
- Guild recruitment messages
- Quest announcements
- Specific sentence structures

**Priority System:** More specific patterns apply first

**Example:**
```lua
{
    from = "Die deutsche Gilde (.+) rekrutiert",
    to = "The German guild %1 is recruiting",
    priority = 10,
}
```

### 6. Phrase Matching

**File:** `Core/Engine.lua` (MatchPhraseAt function)

Matches multi-word phrases translated as units:
- **Exact Matching** - Fast lookup for exact phrases
- **Fuzzy Matching** - Handles article variations, capitalization
- **Priority** - Longer phrases matched first

**Example:**
```lua
["kannst du mir helfen"] = "can you help me"
```

### 7. Word Translation

**File:** `Core/Engine.lua` (TranslateTokens function)

Translates individual words:
- **Direct Lookup** - Checks vocabulary dictionary
- **Morphology** - Uses German morphology helper for verb forms
- **Compound Words** - Splits compound words if needed
- **Separable Verbs** - Handles separated verb prefixes
- **Context Awareness** - 3-5 word window for contextual translation

**Fallback Chain:**
1. Direct vocabulary lookup
2. Phrase matching
3. Separable verb matching
4. Verb conjugation normalization
5. Compound word decomposition
6. Contextual translation (slash-separated options)

### 8. Grammar Rules

**File:** `Languages/de/grammar.lua`

Post-processing rules for word order and corrections:

**Features:**
- **Priority System** - Higher priority rules apply first
- **Iterative Application** - Rules applied in passes
- **Early Exit** - Stops when no changes occur
- **Infinite Loop Protection** - Maximum 10 iterations

**Example:**
```lua
{
    from = "can you me help",
    to = "can you help me",
    priority = 10,
}
```

### 9. Confidence Scoring

**File:** `Core/Confidence.lua`

Calculates translation confidence (0.0 - 1.0):

**Factors:**
- **Language Detection Confidence** - How certain we detected German
- **Intent Confidence** - How well intent was detected
- **Phrase Coverage** - % of words translated via phrases
- **Unknown Word Ratio** - % of words not in vocabulary
- **Message Length** - Shorter messages penalized
- **Translation Similarity** - Penalty if translation too similar to original

**Formula:**
```
confidence = (languageConfidence * 0.3) +
             (intentConfidence * 0.1) +
             (phraseCoverage * 0.4) +
             (1 - unknownRatio) * 0.2
             - similarityPenalty
             - lengthPenalty
```

### 10. Display Decision

**File:** `Core/Engine.lua`, `Core/ChatHooks.lua`

Decides whether to show translation:

- **≥ 0.50** - Auto-display (green)
- **0.30 - 0.49** - Manual option (yellow)
- **< 0.30** - Hidden

## 🧠 Advanced Features

### German Morphology

**File:** `Core/GermanMorphology.lua`

Handles German linguistic features:

**Verb Conjugation:**
- Normalizes verb forms to infinitive
- Handles irregular verbs (sein, haben, werden)
- Recognizes past tense, past participle

**Separable Verbs:**
- 25+ separable prefixes
- Detects separated prefixes in sentences
- Example: "macht auf" → "opens" (from "aufmachen")

**Compound Words:**
- Splits compound words into components
- Example: "levelgilde" → "level" + "gilde"

### Context-Aware Translation

**3-5 Word Window:**
- Analyzes surrounding words
- Better translation for ambiguous words
- Example: "wie" → "how" vs "like" based on context

**Slash-Separated Options:**
- Chooses best option from multiple translations
- Example: "on/up/at" → "on" (based on context)

### Sentence Type Detection

**File:** `Core/Engine.lua` (DetectSentenceType function)

Detects sentence type:
- **Question** - Ends with "?", starts with question words
- **Command** - Imperative mood, short exclamations
- **Statement** - Default

Used for better word order in grammar rules.

## ⚡ Performance Optimizations

### Translation Caching

**Size Limit:** 500 entries  
**Key:** Message hash + source language + target language  
**Purpose:** Avoid re-translating identical messages

### Message Throttling

**Limit:** 10 messages per 2-second window  
**Purpose:** Prevent lag during chat bursts

### Phrase Lookup Cache

**On-Demand:** Built on first use per language pack  
**Purpose:** Fast phrase matching without rebuilding tables

### Grammar Rule Compilation

**On-Demand:** Compiled on first use  
**Purpose:** Optimize regex pattern matching

## 🔒 Constraints & Limitations

### WoW Classic Constraints

- **Lua 5.1** - No modern Lua features
- **No External APIs** - Cannot make HTTP requests
- **No File Writes** - Cannot write files at runtime
- **No ML Models** - Must be rule-based
- **Performance Critical** - Must not impact FPS

### Design Decisions

- **Conservative Approach** - Better to stay silent than wrong
- **Vocabulary-Based** - No grammatical analysis (too complex)
- **Pattern Matching** - Regex-like patterns, not full parsing
- **English Target** - All languages translate to English (for now)

## 📈 Scalability

### Adding Languages

**Complexity:** Medium  
**Files Required:** 5 files per language  
**Estimate:** 100-200 hours per language pack

### Vocabulary Growth

**Current:** ~2,200 German words  
**Practical Limit:** ~10,000 words per language  
**Performance:** Minimal impact up to limit

### Phrase Growth

**Current:** ~700 German phrases  
**Practical Limit:** ~5,000 phrases  
**Performance:** Lookup cache handles efficiently

## 🧪 Testing

### Automated Testing

**Test Scripts:**
- `Tests/test_all.lua` - Comprehensive test suite runner
- `Tests/test_extensive.lua` - Extended tests
- `Tests/test_simple.lua` - Simple single-message test
- Various focused tests

**Test Categories:**
- Basic vocabulary
- Verb conjugations
- Past participles
- Modal verbs
- Separable verbs
- Phrases
- Questions
- WoW terms

**Pass Rate:** 94.1% (32/34 tests)

### In-Game Testing

**Commands:**
- `/wdts test` - Run test suite
- `/wdts debug` - View translation history
- `/wdts clearcache` - Clear cache

## 🔧 Development Tools

### Debug Commands

- `/wdts test` - Test translations
- `/wdts debug` - Show translation history
- `/wdts suite` - Run full test suite
- `/wdts clear` - Clear history
- `/wdts clearcache` - Clear cache

### Lua Console

Enable with:
```
/console scriptErrors 1
```

Shows Lua errors and warnings.

## 📚 Next Steps

- **[Contributing](Contributing)** - How to contribute
- **[Language Packs](Language-Packs)** - Adding new languages
- **[FAQ](FAQ)** - Common technical questions

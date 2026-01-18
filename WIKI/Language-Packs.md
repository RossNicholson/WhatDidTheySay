# Language Packs

## 🌐 Supported Languages

### Currently Available

#### 🇩🇪 German (de → en)

**Status:** ✅ Active Development (Beta)  
**Coverage:** 5,410+ vocabulary entries, 2,267 phrases, 1,401 patterns, 3,067 grammar rules  
**Accuracy:** Excellent coverage with comprehensive test suites  
**Features:**
- Comprehensive vocabulary (5,410+ entries)
- WoW-specific terms and gaming slang
- Advanced morphology support
- Verb conjugation recognition
- Compound word decomposition
- Dependency parsing support
- Real-world guild chat support (100% pass rate on guild chat tests)

#### 🇫🇷 French (fr → en)

**Status:** ✅ Active Development (Beta) - v0.6.0  
**Coverage:** 2,756+ vocabulary entries, 1,620+ phrases, 1,380+ patterns, 1,802 grammar rules  
**Accuracy:** 100% test pass rate (150/150 comprehensive tests)  
**Features:**
- Comprehensive vocabulary (2,756+ entries)
- Extensive phrase coverage (1,620+ phrases)
- Sentence patterns (LFG, trading, questions, directions)
- Grammar rules for French-specific structures
- Gaming abbreviations and English loanwords support
- Emoticon handling
- Real-world chat message support

#### 🎮 WoW Abbreviations (wow → en)

**Status:** ✅ Active Development (Beta) - v0.7.0 🆕  
**Coverage:** 150+ abbreviation expansions, 30+ phrases, 10+ patterns, 20+ grammar rules  
**Accuracy:** Comprehensive coverage of WoW gaming abbreviations  
**Features:**
- Separate, independent language pack for gaming abbreviations
- LFG/LFM expansions (LF → Looking for, LFM → Looking for more)
- Trading abbreviations (WTS → Want to sell, WTB → Want to buy)
- Class, role, dungeon, raid, and city abbreviations
- Action, status, combat, and profession abbreviations
- Auto-detection when 30%+ of words are WoW abbreviations
- Smart detection - only activates for English messages
- Disabled by default (users must enable in configuration)
- Does NOT interfere with foreign language translation

**Examples:**
- `"LF 1 tank strat ud"` → `"Looking for 1 tank Stratholme Undead side"`
- `"WTS [Large Green Bag] 5g"` → `"Want to sell [Large green Bag] 5 gold"`
- `"AFK brb 5 min"` → `"away from keyboard be right back 5 minutes"`

### More Languages to Follow

#### 🇪🇸 Spanish (es → en)

**Status:** 📅 Planned  
**Priority:** High  
**Target:** Future release

#### 🇷🇺 Russian (ru → en)

**Status:** 📅 Planned  
**Priority:** Medium  
**Target:** Future release

## 📦 Language Pack Structure

Each language pack consists of:

### Required Files

- **`tokens.lua`** - Vocabulary dictionary
  - Maps German words to English translations
  - Supports multiple translations (slash-separated)
  - Example: `["hallo"] = "hello/hi"`

- **`phrases.lua`** - Multi-word phrases
  - Common phrases translated as units
  - Example: `["kannst du mir helfen"] = "can you help me"`

- **`patterns.lua`** - Sentence patterns
  - Regex-like patterns for complex structures
  - Example: Guild recruitment messages

- **`grammar.lua`** - Grammar rules
  - Post-processing rules for word order
  - Example: `"can you me help" → "can you help me"`

- **`intents.lua`** - Intent detection
  - Patterns for LFG, trading, etc.
  - Example: Detecting "LFM tank" intent

### Optional Files

- **`phrases.lua`** - Can be omitted if not needed
  - Recommended for better accuracy
  - Provides phrase-level translations

## 🏗️ Adding a New Language Pack

### Step 1: Create Language Folder

Create a new folder in `Languages/`:
```
Languages/fr/  (for French)
```

### Step 2: Create Required Files

#### tokens.lua

```lua
WDTS_Lang_fr_Tokens = {
    -- Basic words
    ["bonjour"] = "hello/good morning",
    ["merci"] = "thanks/thank you",
    ["oui"] = "yes",
    ["non"] = "no",
    
    -- WoW terms (translate game-specific terms)
    ["tank"] = "tank",
    ["heal"] = "heal",
    ["dps"] = "dps",
    
    -- Add more vocabulary...
}
```

#### phrases.lua

```lua
WDTS_Lang_fr_Phrases = {
    -- Common phrases
    ["comment allez-vous"] = "how are you",
    ["pouvez-vous m'aider"] = "can you help me",
    
    -- Add more phrases...
}
```

#### patterns.lua

```lua
WDTS_Lang_fr_Patterns = {
    {
        from = "recherche (.+)",
        to = "looking for %1",
        priority = 10,
    },
    -- Add more patterns...
}
```

#### grammar.lua

```lua
WDTS_Lang_fr_Grammar = {
    {
        from = "can you me help",
        to = "can you help me",
        priority = 10,
    },
    -- Add more grammar rules...
}
```

#### intents.lua

```lua
WDTS_Lang_fr_Intents = {
    {
        pattern = "recherche",
        intent = "LFG",
        score = 0.8,
    },
    -- Add more intents...
}
```

### Step 3: Add Function Words

Edit `Core/LanguageDetect.lua`:

```lua
LanguageDetect.FUNCTION_WORDS = {
    -- ... existing languages ...
    fr = {
        "le", "la", "les", "un", "une", "des",
        "et", "ou", "mais", "dans", "sur", "avec",
        -- Add French function words...
    },
}
```

### Step 4: Add Character Hints

```lua
LanguageDetect.CHAR_HINTS = {
    -- ... existing languages ...
    fr = { "à", "é", "è", "ê", "ë", "î", "ï", "ô", "ù", "û", "ü", "ç", "œ" },
}
```

### Step 5: Update TOC File

Edit `WhatDidTheySay.toc`:

```lua
# Language packs
Languages/en/tokens.lua
Languages/en/intents.lua
Languages/en/patterns.lua
Languages/en/grammar.lua
Languages/de/tokens.lua
Languages/de/phrases.lua
Languages/de/intents.lua
Languages/de/patterns.lua
Languages/de/grammar.lua
Languages/fr/tokens.lua      # Add new language
Languages/fr/phrases.lua
Languages/fr/intents.lua
Languages/fr/patterns.lua
Languages/fr/grammar.lua
```

### Step 6: Test

1. Load the addon in-game
2. Test with sample messages
3. Verify language detection works
4. Check translation accuracy

### Step 7: Submit Pull Request

1. Fork the repository
2. Create a branch for your language pack
3. Submit a pull request with:
   - All language pack files
   - Test results
   - Documentation

## 📊 Language Pack Quality Guidelines

### Vocabulary Coverage

**Minimum:**
- 500+ common words
- 100+ WoW-specific terms
- 50+ gaming phrases

**Recommended:**
- 1,000+ common words
- 300+ WoW-specific terms
- 200+ gaming phrases

### Function Words

**Minimum:** 30-40 function words  
**Recommended:** 50+ function words

Function words are critical for language detection:
- Articles (the, a, an)
- Pronouns (I, you, he, she)
- Prepositions (in, on, at, with)
- Common verbs (is, are, was, have)
- Conjunctions (and, or, but)

### Testing

Test your language pack with:

1. **Basic vocabulary** - Simple words (hello, yes, no)
2. **Common phrases** - Everyday expressions
3. **Gaming context** - WoW-specific messages
4. **Intent detection** - LFG, trading, etc.
5. **Edge cases** - Typos, abbreviations, mixed languages

### Performance

- Keep vocabulary files under 10,000 entries (recommended)
- Use phrases for common multi-word expressions
- Use patterns for complex structures
- Minimize grammar rule complexity

## 🔧 Language Pack Maintenance

### Updating Vocabulary

1. Identify missing words from user reports
2. Add to `tokens.lua`
3. Test translations
4. Commit changes

### Improving Grammar

1. Identify common translation errors
2. Add grammar rules to `grammar.lua`
3. Test with sample sentences
4. Verify no infinite loops

### Expanding Phrases

1. Identify common multi-word expressions
2. Add to `phrases.lua`
3. Test phrase matching
4. Verify priority with existing phrases

## 📝 Contributing Guidelines

### Before Submitting

- [ ] Test thoroughly in-game
- [ ] Verify language detection works
- [ ] Check translation accuracy
- [ ] Test with various message types
- [ ] Document any special considerations

### Pull Request Template

```markdown
## Language Pack: [Language Name] ([code])

### Files Added
- Languages/[code]/tokens.lua
- Languages/[code]/phrases.lua
- Languages/[code]/patterns.lua
- Languages/[code]/grammar.lua
- Languages/[code]/intents.lua

### Coverage
- Vocabulary: X words
- Phrases: X phrases
- Patterns: X patterns
- Grammar rules: X rules

### Testing
- Tested in-game: ✅
- Language detection: ✅
- Sample translations: [list examples]

### Notes
[Any special considerations or limitations]
```

## 🎯 Next Steps

- **[Contributing](Contributing)** - General contribution guidelines
- **[Technical Details](Technical-Details)** - How translation works
- **[FAQ](FAQ)** - Common questions

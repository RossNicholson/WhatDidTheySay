# German Implementation Structure Reference

This document details the exact structure used for the German language pack implementation. Use this as a template for implementing other languages.

## File Structure

### 1. metadata.lua (32 lines)
```lua
-- WhatDidTheySay - German Language Pack - Metadata
-- Language-specific metadata for phrase matching and detection

WDTS_Lang_de_Metadata = {
    -- Articles used for fuzzy phrase matching
    articles = {
        ["der"] = true,
        ["die"] = true,
        ["das"] = true,
        -- ... more articles
    },
    
    -- Character hints for language detection
    charHints = {
        ["ä"] = true,
        ["ö"] = true,
        ["ü"] = true,
        ["ß"] = true,
        -- ... more characters
    },
}
```
**Key points:**
- No `available` field in metadata file itself
- `available` is set in `Core/LanguagePackManager.lua` (line 34: `available = false` for placeholders, `true` for active)
- Simple table with `articles` and `charHints` keys

---

### 2. tokens.lua (5,396 lines)
```lua
-- WhatDidTheySay - German Language Pack - Tokens
-- High-value vocabulary for WoW Classic German players

WDTS_Lang_de_Tokens = {
    -- Roles
    ["tank"] = "tank",
    ["dps"] = "dps",
    ["heiler"] = "healer",
    
    -- Dungeons (German names/common terms)
    ["heulende"] = "Wailing Caverns",
    ["klamm"] = "Wailing Caverns",
    -- Note: "dm" not translated - can mean either Deadmines or Dire Maul depending on context
    
    -- Common verbs
    ["suche"] = "looking for",
    ["brauche"] = "need",
    
    -- ... thousands more entries organized by category ...
    
    -- Common typos/variants (handle common misspellings)
    ["gearde"] = "just/just now", -- Typo for "gerade"
    ["gefärhlich"] = "dangerous", -- Typo for "gefährlich"
    
    -- Gaming slang
    ["zocken"] = "playing/gaming", -- German gaming slang for "playing games"
    
    -- ============================================
    -- END OF VOCABULARY EXPANSION
    -- ============================================
}
```

**Key points:**
- Organized by category with `-- Category Name` comments
- Uses `["german"] = "english"` format
- Inline comments explain context, usage, or notes
- Handles typos/variants explicitly
- Ends with "END OF VOCABULARY EXPANSION" marker
- Categories include: Roles, Dungeons, Verbs, Nouns, Pronouns, Actions, etc.

---

### 3. phrases.lua (2,241 lines)
```lua
-- WhatDidTheySay - German Language Pack - Phrases
-- Multi-word phrases that should be translated as units
-- These are matched BEFORE individual word translation to avoid breaking up idiomatic expressions

WDTS_Lang_de_Phrases = {
    -- Common verb phrases
    ["kannst du"] = "can you",
    ["kann ich"] = "can i",
    ["weiß nicht"] = "don't know",
    
    -- Common phrases
    ["keine sorge"] = "no worry/don't worry",
    ["gute nacht"] = "good night",
    
    -- LFG phrases
    ["suche gruppe"] = "looking for group",
    
    -- ... more phrases organized by category ...
    
    -- Gaming chat phrases
    ["wär dabei"] = "would be in/would join",
}
```

**Key points:**
- Header explains purpose: "matched BEFORE individual word translation"
- Organized by category with `-- Category` comments
- Uses `["german phrase"] = "english phrase"` format
- Categories include: verb phrases, common phrases, LFG phrases, questions, etc.
- Multi-word expressions that should stay together

---

### 4. patterns.lua (1,367 lines)
```lua
-- WhatDidTheySay - German Language Pack - Patterns
-- Reusable phrase structures with captures

WDTS_Lang_de_Patterns = {
    -- "suche X für Y" -> "looking for X for Y"
    {
        from = "suche (.+) für (.+)",
        to = "looking for %1 for %2",
    },
    -- "kannst du X" -> "can you X"
    {
        from = "kannst du (.+)",
        to = "can you %1",
    },
    -- ... more patterns ...
}
```

**Key points:**
- Array of pattern tables (not a keyed table)
- Each pattern has `from` (regex pattern) and `to` (replacement with captures)
- Uses `%1`, `%2`, etc. for capture groups
- Patterns match sentence structures with variable parts
- More specific patterns should come before general ones

---

### 5. grammar.lua (3,050 lines)
```lua
-- WhatDidTheySay - German Language Pack - Grammar
-- Post-processing rules for German to English word order and grammar fixes

WDTS_Lang_de_Grammar = {
    rules = {
        -- Basic word order adjustments (simple cases)
        {
            from = "^you can ",
            to = "can you ",
        },
        -- Article corrections
        {
            from = " a ([aeiouAEIOU])",
            to = " an %1",
        },
        -- ... more rules ...
        {
            from = "where is is",
            to = "where are you",
            priority = 20,  -- Optional: higher priority rules applied first
        },
    },
}
```

**Key points:**
- Nested structure: `Grammar = { rules = { ... } }`
- Array of rule tables (not keyed)
- Each rule has `from` (regex) and `to` (replacement)
- Optional `priority` field (higher = applied first)
- Post-processing rules applied AFTER translation
- Fixes word order, articles, common errors

---

### 6. intents.lua (99 lines)
```lua
-- WhatDidTheySay - German Language Pack - Intents
-- Intent patterns for German chat

WDTS_Lang_de_Intents = {
    {
        id = "LFG_DUNGEON",
        patterns = {
            "suche gruppe",
            "sucht gruppe",
            "lfg",
        },
        score = 0.9,
    },
    {
        id = "INVITE_REQUEST",
        patterns = {
            "einladen",
            "kannst du einladen",
        },
        score = 0.9,
    },
    -- ... more intents ...
}
```

**Key points:**
- Array of intent tables
- Each intent has `id` (string), `patterns` (array of strings), `score` (number 0.0-1.0)
- Used for intent detection/classification
- Patterns are simple strings, not regex

---

## Global Table Names

All files use the pattern: `WDTS_Lang_{language_code}_{FileType}`

- `WDTS_Lang_de_Metadata`
- `WDTS_Lang_de_Tokens`
- `WDTS_Lang_de_Phrases`
- `WDTS_Lang_de_Patterns`
- `WDTS_Lang_de_Grammar`
- `WDTS_Lang_de_Intents`

---

## LanguagePackManager Configuration

In `Core/LanguagePackManager.lua` (lines 29-35):
```lua
["fr"] = {
    name = "French",
    nativeName = "Français",
    description = "French → English translation (Coming Soon)",
    direction = "fr → en",
    available = false,  -- Change to true when ready
},
```

**Key points:**
- `available = false` means "Coming Soon" and greyed out in UI
- `available = true` means active and can be enabled
- Discovery checks if `_G["WDTS_Lang_fr_Tokens"]` exists (line 91)

---

## Implementation Order (For French)

1. **metadata.lua** - Copy German structure, add French articles and charHints
2. **tokens.lua** - Start with ~100-200 common words, organized by category
3. **phrases.lua** - Add 20-30 common phrases first
4. **intents.lua** - Add basic intents (LFG, trading, etc.)
5. **patterns.lua** - Add common sentence patterns
6. **grammar.lua** - Add post-processing rules (start simple)
7. **Update LanguagePackManager.lua** - Set `available = true` for French

---

## Key Principles

1. **Same structure** - Follow German files exactly
2. **Organized by category** - Use `-- Category` comments
3. **Inline comments** - Explain context, notes, variants
4. **Handle typos** - Add common misspellings explicitly
5. **Progressive expansion** - Start small, test, expand based on real usage
6. **No inventing new structures** - Use exact same format as German

---

## Testing

Test files follow this pattern:
```lua
-- Load files in order
loadFile("Core/Utils.lua")
loadFile("Core/Tokenizer.lua")
-- ... other core files ...
loadFile("Languages/fr/metadata.lua")
loadFile("Languages/fr/tokens.lua")
loadFile("Languages/fr/intents.lua")
loadFile("Languages/fr/patterns.lua")
loadFile("Languages/fr/grammar.lua")
loadFile("Languages/fr/phrases.lua")

WDTS_Engine.Initialize()
```

---

## Summary

- **6 files** per language pack
- **Same structure** for all languages
- **Global table names** follow pattern `WDTS_Lang_{code}_{Type}`
- **Organized by categories** with comments
- **Progressive expansion** based on testing

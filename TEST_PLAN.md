# Translation Testing Plan

## 🎯 Test Categories

### 1. **LFG / Group Finding**
Test common looking-for-group patterns:

```lua
-- Basic LFG
"suche gruppe für DM"
"sucht tank für SFK"
"LFM Heal für Gnomer"
"brauche gruppe für ZF"

-- With roles
"suche tank und heal für BRD"
"LF1M DPS für Strat"
"brauche noch 2 für Mara"

-- Dungeon abbreviations
"LFG DM" (Deadmines vs Dire Maul context)
"suche gruppe für UBRS"
"sucht für LBRS"
```

### 2. **Trading / Economy**
Test trading requests and crafting:

```lua
-- Crafting requests
"schmied gesucht für [item]"
"brauch alchemist für [item]"
"sucht verzauberer für [item]"

-- Buying/selling
"verkaufe [item] für 50g"
"kaufe [item] für 20g"
"WTS [item]"
"WTB [item]"
"wts [item] 100g"

-- Price negotiations
"was kostet [item]?"
"wie viel für [item]?"
"preis?"
```

### 3. **Guild / Social**
Test guild recruitment and social:

```lua
-- Guild recruitment
"suchst du eine gilde?"
"gilde sucht aktive spieler"
"deutsche gilde sucht mitglieder"

-- Social phrases
"danke dir"
"bitte schön"
"gerne geschehen"
```

### 4. **Questions / Requests**
Test common questions:

```lua
-- Location questions
"wo ist [location]?"
"wo treffen wir uns?"
"wo soll ich hin?"

-- Ability questions
"kannst du [action]?"
"kann jemand [action]?"
"wer kann [action]?"

-- Relative clause requests
"brauch wen der mir hilft"
"suche jemand der [action] kann"
"brauch wen der mir die auf macht"
```

### 5. **Mixed Language / Code-Switching**
Test mixed German-English messages:

```lua
"If tank heal dm dann abfahrt"
"LFM Mage SFK"
"WTB [item] für 50g"
"Kann man als Alli HDW gehen?"
```

### 6. **Typos / Colloquial**
Test common typos and informal language:

```lua
-- Typos
"schmied gesucht cht für [item]" -- typo between words
"bitti" -- typo for "bitte"
"brauch" -- colloquial "brauche"

-- Informal
"kann man" -- impersonal "can one"
"los gehts" -- informal "let's go"
```

### 7. **Separable Verbs**
Test German separable verbs:

```lua
"macht auf" -- "opens"
"die auf macht" -- "opens them"
"mir die auf macht" -- "opens them for me"
"aufmachen" -- "to open"
```

### 8. **Complex Grammar**
Test complex sentence structures:

```lua
-- Subordinate clauses
"Wer X hat Y verloren" -- "Who X has lost Y"
"Wer Blech raucht hat die Kontrolle verloren"

-- Past tense
"hat [item] verloren"
"hat [action] gemacht"
"war [state]"

-- Relative clauses
"brauch wen der [action]"
"jemand der [action] kann"
```

### 9. **Game-Specific Terms**
Test WoW-specific vocabulary:

```lua
-- Dungeons
"HDW" -- Höhlen des Wehklagens
"SFK" -- Shadowfang Keep
"DM" -- Deadmines (context-dependent)
"BRD" -- Blackrock Depths
"UBRS/LBRS" -- Upper/Lower Blackrock Spire

-- Game mechanics
"world buffs"
"instanz run"
"raid run"
"quest zusammen"

-- Factions
"als Alli" -- "as Alliance"
"für Horde" -- "for Horde"
```

### 10. **Edge Cases**
Test boundaries and failures:

```lua
-- Very short messages
"r" -- "ready"
"rdy"
"inv"
"wc"

-- Very long messages
"suche aktive deutsche gilde für regelmäßige raid runs und dungeon farming"

-- Unusual word order
"für DM gruppe suche"
"tank brauche für SFK"

-- Numbers and currency
"50 gold"
"100g"
"für 20 silber"
```

## 📊 Testing Metrics

When testing, check:
1. **Translation accuracy** - Does it make sense?
2. **Confidence score** - Is it reasonable?
3. **Coverage** - Are all words translated?
4. **Intent detection** - Is intent correctly identified?
5. **Visual indicators** - Does color tint appear?

## 🐛 Common Issues to Watch For

1. **Missing vocabulary** - Words not in dictionary
2. **Pattern failures** - Complex structures not matched
3. **False positives** - English detected as German (or vice versa)
4. **Low confidence** - Good translations rejected
5. **Word order issues** - Grammar not corrected
6. **Typo sensitivity** - Small typos break patterns
7. **Separable verbs** - Prefix not recognized when separated
8. **Mixed language** - Not detecting German in mixed messages

## 🔄 Testing Workflow

1. Test each category systematically
2. Document failures with `/wdts test`
3. Check confidence scores
4. Add missing vocabulary/patterns for failures
5. Re-test to verify fixes
6. Test in live chat when possible

## 💡 Tips

- Use `/wdts test` to quickly test phrases
- Check both high-confidence (green) and low-confidence (yellow) translations
- Test with real chat messages when available
- Pay attention to edge cases (typos, mixed language, unusual grammar)
- Focus on gameplay-critical phrases (LFG, trading, requests)

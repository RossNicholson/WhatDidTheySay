# Guild Chat Log Translation Test Results

## Summary
- **Total messages tested:** 16
- **Translated:** 14 (87.5%)
- **Not translated:** 2 (12.5%)
- **Low confidence (<0.50):** 5 (31.25%)

## High Priority Issues to Fix

### 1. "Onyxia Buff in 14 Sekunden" - Not Translated
**Issue:** Message is marked as "already_english" when it should translate "Sekunden" to "seconds"
**Expected:** "Onyxia buff in 14 seconds"
**Actual:** No translation (marked as already_english)
**Fix needed:** Adjust language detection to recognize German words like "Sekunden" even when mixed with English gaming terms

### 2. "das die mobs wieder instant da sind" - Wrong Translation
**Issue:** "die" is being translated as "the one who" instead of "the" article
**Expected:** "that the mobs are instantly there again"
**Actual:** "that that the one who mobs again instant there are"
**Fix needed:** Context-aware handling of "die" - when followed by a noun (mobs), it should be "the" not "who"

### 3. "stockades oder BFD zu haben nach SW buff" - Wrong Word Order
**Issue:** "zu haben" should come before the object
**Expected:** "to have Stockades or BFD after SW buff"
**Actual:** "stockades or BFD to have to SW buff"
**Fix needed:** Phrase match for "zu haben" + object pattern

### 4. "quasi andere 'welt' also da können dann weniger leute sein die deine Mobs töten zb"
**Issue:** Multiple translation problems
**Expected:** "basically another 'world' so there can be fewer people who kill your mobs, for example"
**Actual:** "quasi others 'welt so there can then less people be the one who your mobs kill zb"
**Fix needed:** 
- "andere" = "another" not "others"
- "die" as relative pronoun = "who" not "the one who"
- Better word order handling

### 5. "bsp escort quest nach dm wie bei mir :D kurz vor mir einer den typen mitgeniommen"
**Issue:** Very broken translation
**Expected:** "e.g., escort quest to DM like with me :D right before me someone took the guy"
**Actual:** "bsp escort quest to Deadmines how at that gives me :D quickly ahead that gives me a the typen mitgeniommen"
**Fix needed:**
- "bsp" = "e.g." abbreviation
- "bei mir" = "with me" phrase
- "kurz vor mir" = "right before me" phrase
- "mitgeniommen" = "took along" verb

## Medium Priority Issues

### 6. "jetzt habn ich ihn nachm layern"
**Issue:** Colloquial forms not translated
**Expected:** "now I have him after layering"
**Actual:** "now habn I him nachm layern"
**Fix needed:** Add colloquial forms: "habn" = "have", "nachm" = "after the"

### 7. "wie layert man denn?"
**Issue:** "denn" in questions is emphasis, shouldn't be translated
**Expected:** "how do you layer?"
**Actual:** "how layert one because/for"
**Fix needed:** Grammar rule to drop "denn" in questions, or mark it as untranslatable emphasis particle

## Low Priority / Working Messages

- "moin" - ✅ Working
- "2 DDs für HDW" - ✅ Working
- "kann mich wer kurz layern?" - ✅ Working
- "was bringt das layern?" - ✅ Working (could be more natural)
- "egal ob quest oder farm mobs" - ✅ Working

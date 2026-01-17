# French Translation – What's Next

Follow the **same process as German**. This doc gives the ordered roadmap and concrete next steps.

---

## 1. German Process (Reference)

What was done for German, in order:

| Step | What | German State |
|------|------|---------------|
| 1 | **Vocabulary (tokens.lua)** | Categories: Roles, Dungeons, Verbs, Nouns, Pronouns, LFG, Actions, Status, Questions, Trading, Classes, Races, Professions, Items, Gaming slang, Time/frequency, Common words, Typos. ~5,396 lines. |
| 2 | **Phrases (phrases.lua)** | Verb phrases, common, LFG, trading, questions, status, social, direction, guild recruitment, game mechanics, time-based, trading, combat/group, lending, enchanting, gaming slang. ~2,241 lines. |
| 3 | **Patterns (patterns.lua)** | LFG (suche X für Y, etc.), trading, questions, location, time, conversational, mixed-language. ~1,367 lines. |
| 4 | **Grammar (grammar.lua)** | Negation, questions, articles, verb position, prepositions, LanguageTool-style rules. ~3,050 lines. |
| 5 | **Intents (intents.lua)** | LFG, trading, invite, etc. ~99 lines. |
| 6 | **GermanMorphology.lua** | Verb conjugation lookup (257 forms, 150+ verbs), separable prefixes. Used by Engine for `NormalizeToInfinitive` and separable-verb matching. |
| 7 | **DependencyParser** | Used in Engine for structure-aware translation. |
| 8 | **Testing** | `test_french_comprehensive.lua`, real-world chat, fix failures. |
| 9 | **Real-world chat** | Add missing vocab/phrases from French WoW chat logs. |

---

## 2. French vs German – Current State

| File | German | French | French % of German |
|------|--------|--------|--------------------|
| tokens.lua | 5,396 | 1,119 | ~21% |
| phrases.lua | 2,241 | 275 | ~12% |
| patterns.lua | 1,367 | 282 | ~21% |
| grammar.lua | 3,050 | 321 | ~11% |
| intents.lua | 99 | 59 | ~60% |
| **Morphology** | GermanMorphology.lua | **none** | — |
| **Dependency** | Used in Engine | **not French-specific** | — |

---

## 3. What's Next (In Order – Same as German)

### Phase 1: Vocabulary (tokens.lua) – Highest impact

**Goal:** Move from ~1,119 toward ~3,000+ lines by mirroring German categories.

**Categories to add or expand** (match `Languages/de/tokens.lua` structure):

- [ ] **Dungeons** – French dungeon names/terms (e.g. Hurlorage, Caverne des Lamentations, etc.)
- [ ] **Directions** – nord, sud, est, ouest, ici, là, etc.
- [ ] **Combat** – attaque, défense, soin, dégâts, etc.
- [ ] **Status** – expand (vie, mana, mort, prêt, etc.)
- [ ] **Faction terms** – Alliance, Horde, etc. (if different in French)
- [ ] **Races** – nain, elfe, orc, etc. (French names)
- [ ] **Guild terms** – guilde, recrutement, etc. (expand)
- [ ] **Game mechanics** – quête, objectif, butin, etc.
- [ ] **Trading and economy** – expand (prix, or, argent, cuivre, etc.)
- [ ] **Professions and crafting** – forge, couture, herboristerie, etc.
- [ ] **Common WoW verbs** – expand (aller, venir, prendre, donner, etc.)
- [ ] **Time and frequency** – maintenant, toujours, souvent, jamais, etc.
- [ ] **Item name components** – épée, armure, bâton, etc.
- [ ] **Quality and attributes** – rare, épique, etc.
- [ ] **Possession and existence** – avoir, être, etc. (expand)
- [ ] **Common connecting words** – et, ou, mais, donc, etc.
- [ ] **Social and communication** – parler, demander, etc.
- [ ] **Practical conversation** – s'il te plaît, merci, etc. (expand)
- [ ] **Common responses** – oui, non, d'accord, etc.
- [ ] **Location and meeting** – où, quand, rendez-vous, etc.
- [ ] **Gaming abbreviations** – keep LFG/LFM/WTB/WTS etc. in tokens; Engine may skip as English.
- [ ] **Typos/variants** – e.g. "vendre" vs "vandre", "besoin" vs "besion", etc.

**Process:** Add in batches by category; run `Tests/test_french_comprehensive.lua` and fix regressions.

---

### Phase 2: Phrases (phrases.lua)

**Goal:** Move from ~275 toward ~1,500+ lines. Mirror German phrase categories.

**Categories to add** (from `Languages/de/phrases.lua`):

- [ ] **Common verb phrases** – "je veux", "on peut", "il faut", etc.
- [ ] **LFG phrases** – "cherche groupe", "besoin d'un tank", "recherche membres", etc. (expand)
- [ ] **Common question phrases** – "c'est quoi", "combien ça coûte", "où est", etc. (expand)
- [ ] **Action phrases** – "je suis prêt", "on y va", "j'arrive", etc.
- [ ] **Social phrases** – "merci", "de rien", "pas de souci", etc.
- [ ] **Status phrases** – "c'est fini", "je suis mort", "j'ai fini", etc.
- [ ] **Direction phrases** – "par ici", "là-bas", etc.
- [ ] **Guild recruitment** – "recherche guilde", "on recrute", etc.
- [ ] **Game mechanics** – "drop", "loot", "respawn", etc. (French equivalents)
- [ ] **Time-based** – "dans 5 min", "tout de suite", "plus tard", etc.
- [ ] **Trading** – "à vendre", "vente", "achat", "combien pour", etc. (expand)
- [ ] **Quest/objective** – "quête", "objectif", etc.
- [ ] **Group coordination** – "on se retrouve où", "qui vient", etc.
- [ ] **Meeting/grouping** – "rendez-vous", "je suis là", etc.
- [ ] **Help and requests** – "peux-tu m'aider", "j'ai besoin", etc. (expand)
- [ ] **Short status** – "afk", "brb", "omw", etc.
- [ ] **Common responses** – "ok", "d'accord", "parfait", etc.
- [ ] **Lending/borrowing** – "tu peux me prêter", "je te rends", etc.
- [ ] **Death and status** – "je suis mort", "respawn", etc.
- [ ] **Enchanting** – "enchantement", "enchanter", etc.
- [ ] **Gaming slang** – colloquial French gaming expressions.

**Process:** Add in batches; run tests. Resolve "cherche un heal" and similar phrase vs token conflicts.

---

### Phase 3: Patterns (patterns.lua)

**Goal:** Move from ~282 toward ~800+ lines. French equivalents of German patterns.

**Pattern types to add** (from `Languages/de/patterns.lua`):

- [ ] **LFG** – "cherche X pour Y", "recherche X pour Y", "besoin de X pour Y", "LF X pour Y" (mixed).
- [ ] **Trading** – "vente X", "achat X", "combien pour X", "prix de X".
- [ ] **Questions** – "Est-ce que tu…", "Qu'est-ce que…", "combien coûte X", "où est X", "qui veut X".
- [ ] **Negation** – "je ne peux pas", "il n'y a pas", etc. (if not fully covered by grammar).
- [ ] **Location** – "où est X", "je suis à X", "on se retrouve à X".
- [ ] **Time/organization** – "dans X minutes", "à X heures", "tout de suite".
- [ ] **Conversational** – "peux-tu X", "tu peux X", "on peut X".
- [ ] **Guild recruitment** – "recherche guilde", "gilde recrute", etc.
- [ ] **Mixed-language** – "LF X pour Y" (French + English).

**Process:** One pattern type at a time; test with `test_french_comprehensive.lua` and real examples.

---

### Phase 4: Grammar (grammar.lua)

**Goal:** Move from ~321 toward ~1,000+ lines. French-specific rules.

**Rule types to add:**

- [ ] **Negation (ne…pas)** – "je ne sais pas" → "I don't know"; "ne…pas" reordering.
- [ ] **Questions** – "Est-ce que tu veux" → "Do you want"; "Qu'est-ce que c'est" → "What is it".
- [ ] **Articles** – le/la/les, un/une/des corrections where translation is wrong.
- [ ] **Prepositions** – de, du, des, à, au, aux → of/from/to.
- [ ] **Verb forms** – common wrong tense/pronoun (e.g. "il a" vs "j'ai") where patterns are clear.
- [ ] **LanguageTool-style** – if French rules exist, convert and add similar to German.

**Process:** Add rules in small batches; run tests and spot-check on real French chat.

---

### Phase 5: Intents (intents.lua)

**Goal:** Move from 59 toward ~99 lines. Align with German intent set.

- [ ] List intents in `Languages/de/intents.lua` (LFG_DUNGEON, INVITE_REQUEST, TRADING, etc.).
- [ ] For each, add French `patterns` with equivalent phrases (e.g. "cherche groupe", "recherche groupe", "besoin d'un tank", etc.).
- [ ] Keep `score` and `id` structure the same as German where it makes sense.

---

### Phase 6: FrenchMorphology.lua (New File – Like German)

**Goal:** Same role as `GermanMorphology.lua` for French.

**Engine already supports:** `WDTS_FrenchMorphology` and `NormalizeToInfinitive` / separable-style logic via `WDTS_[Language]Morphology`.

**To implement:**

1. **Create `Core/FrenchMorphology.lua`**
   - `VERB_CONJUGATION_LOOKUP`: map conjugated forms → infinitive (e.g. suis, es, est, sommes, êtes, sont → être; ai, as, a, avons, avez, ont → avoir; fais, fait, font → faire; vais, va, vont → aller; veux, veut, voulons → vouloir; peux, peut, peuvent → pouvoir; etc.).
   - Cover: être, avoir, faire, aller, venir, vouloir, pouvoir, devoir, savoir, dire, prendre, mettre, donner, and other common verbs (present, past, participle, and key irregulars).
2. **Optional:** If French has separable-like constructions, add `SEPARABLE_PREFIXES` (or equivalent); otherwise omit.
3. **Add to `WhatDidTheySay.toc`:**  
   `Core/FrenchMorphology.lua`  
   (after `Core/GermanMorphology.lua` or in the same relative place.)
4. **In Engine:** Morphology is chosen by `lang`, so once `WDTS_FrenchMorphology` exists, it will be used for `fr`.

**Process:** Start with ~50–100 high-frequency verbs; expand using real chat and tests.

---

### Phase 7: Dependency Parser and French

**Goal:** Reuse or adapt `DependencyParser` for French.

- [ ] **Check:** Does `DependencyParser.Parse` (and relations like SUBJ, OBJ, PREP) work acceptably on French tokenization? Run on sample French sentences.
- [ ] If it’s mostly German-specific (e.g. verb-final, V2), either:
  - add French-specific branches or tables (e.g. for subject–verb–object), or  
  - document that French stays on phrase/pattern/grammar for now and DependencyParser is a later step.

**Process:** Run a few French sentences through the parser and inspect `Parse` output; then decide.

---

### Phase 8: Testing and Real-World Chat

**Goal:** Stabilize tests and then improve from real usage.

- [ ] **Tests:** Get `Tests/test_french_comprehensive.lua` to 100% (fix "cherche un heal", LFG/LFM/WTB/WTS, and any other remaining failures).
- [ ] **Real-world chat:** Collect French WoW Classic chat (guild, trade, LFG, etc.).
- [ ] **Gap list:** For each untranslated or wrong phrase/word, add to tokens, phrases, or patterns as appropriate.
- [ ] **Regression:** After each batch, run `test_french_comprehensive.lua` and, if available, any German or global tests.

---

## 4. French-Specific Notes (Same as in FRENCH_IMPLEMENTATION_GUIDE)

- **Word order:** French is SVO like English → fewer reordering rules than German, but still need negation, questions, and prepositions.
- **Articles:** le/la/les, un/une/des – grammar and patterns should fix article–noun and translation mismatches.
- **Verbs:** More forms than German → `FrenchMorphology.lua` is important for coverage.
- **Accents:** é, è, ê, ç, etc. – already in `metadata.lua`/`charHints`; ensure tokenization and phrase keys use consistent forms.
- **Negation:** "ne…pas" must be turned into "do not", "cannot", etc., not left as "not" or "ne pas" in the middle.
- **Questions:** "Est-ce que…", "Qu'est-ce que…", inversion – patterns and grammar should simplify to natural English questions.

---

## 5. Suggested Order of Work

1. **Phase 1 – Vocabulary:** 2–3 batches (e.g. Dungeons+Directions+Combat; then Trading+Professions+Time; then Social+Typos). Run tests between batches.
2. **Phase 2 – Phrases:** 2–3 batches (LFG+Questions+Actions; then Trading+Status+Time; then Social+Enchanting+Gaming slang). Run tests.
3. **Phase 3 – Patterns:** 1 batch per pattern type (LFG, Trading, Questions, Location, Time, etc.). Run tests.
4. **Phase 4 – Grammar:** Small batches (negation, questions, articles, prepositions). Run tests.
5. **Phase 5 – Intents:** One pass to align with German intents.
6. **Phase 6 – FrenchMorphology:** Initial verb set, then expand from real chat and tests.
7. **Phase 7 – DependencyParser:** Evaluate; only invest in French-specific logic if clearly useful.
8. **Phase 8 – Testing and real-world chat:** Ongoing; after each phase, add missing vocab/phrases from chat.

---

## 6. Summary

| Priority | Phase | Action |
|----------|--------|--------|
| 1 | Vocabulary | Expand tokens.lua by German categories toward ~3,000+ lines. |
| 2 | Phrases | Expand phrases.lua by German phrase categories toward ~1,500+ lines. |
| 3 | Patterns | Add French equivalents of German pattern types toward ~800+ lines. |
| 4 | Grammar | Add French negation, questions, articles, prepositions, and similar rules. |
| 5 | Intents | Align intents.lua with German. |
| 6 | FrenchMorphology | New `Core/FrenchMorphology.lua` with verb conjugation lookup. |
| 7 | DependencyParser | Evaluate for French; add French-specific handling if needed. |
| 8 | Testing + chat | Reach 100% on `test_french_comprehensive.lua`; then iterate from real French WoW chat. |

This order mirrors the German process: vocab and phrases first, then patterns and grammar, then morphology and parsing, with testing and real-world chat throughout.

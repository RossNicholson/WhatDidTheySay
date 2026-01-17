## French Language Pack Expansion

### Vocabulary Expansion (+45 lines, 1,119→1,164)
- **Directions:** nord, sud, est, ouest
- **Combat terms:** pull, add, aggro, inc, focus, interrupt, cc, aoe, dot, tanker, etc.
- **Faction:** alliance, alli, horde
- **Races:** humain, nain, elfe, gnome, orc, troll, mort-vivant + plurals

### Phrases Expansion (+68 lines, 275→343)
- Direction phrases (en haut, en bas, à gauche, à droite)
- Guild recruitment phrases
- Game mechanics (world buffs, run donjon/instance/raid, port)
- Time-based phrases
- Action phrases (come with, join)
- Medical/First Aid phrases
- More status phrases (je suis là, j'arrive, je viens de mourir, etc.)
- Quest and objective phrases
- Group coordination
- Quick conversational questions

### Patterns Expansion (+78 lines, 282→360)
- Request patterns (quelqu'un peut me donner/port)
- Time patterns (j'arrive dans X minutes)
- Trading patterns (vente/achat, combien pour, prix de)
- Question patterns (qui veut)
- Guild recruitment patterns

### Technical Improvements
- Engine: Allow single-word phrases (e.g. 'vente' = 'selling')
- Language detection: Added French function words (cherche, besoin, vente)

### Test Results
- 81.1% pass rate (30/37 tests passing)
- No regressions from expansion

### Documentation
- Created FRENCH_NEXT_STEPS.md with roadmap
- Updated FRENCH_EXPANSION_PLAN.md with current stats

### Current French Coverage (vs German)
- Tokens: ~22% (1,164 vs 5,396 lines)
- Phrases: ~15% (343 vs 2,241 lines)
- Patterns: ~26% (360 vs 1,367 lines)
- Grammar: ~11% (321 vs 3,050 lines)

**Next steps:** Continue vocabulary/phrases expansion, add FrenchMorphology.lua, expand grammar rules.

# LanguageTool German Rules Extraction Plan

## Overview
Extract German grammar rules from [LanguageTool](https://github.com/languagetool-org/languagetool) and convert to our Lua grammar format.

## Repository Structure

The German rules are located at:
```
languagetool-language-modules/de/src/main/resources/org/languagetool/rules/de/
```

## Most Relevant Rule Categories for Chat Translation

Based on common German grammar issues in WoW chat:

1. **Word Order Rules** (Priority 1)
   - Subordinate clause verb placement
   - V2 word order in main clauses
   - Verb-final position

2. **Verb Placement** (Priority 1)
   - Separable verb prefixes
   - Modal verbs + infinitive
   - Perfect tense auxiliary verbs

3. **Case/Agreement** (Priority 2)
   - Article-noun agreement (der/die/das)
   - Preposition case (accusative/dative)

4. **Question Structures** (Priority 2)
   - Question word order
   - Inversion in questions

## Extraction Process

### Step 1: Clone Repository (Shallow Clone)
```bash
git clone --depth 5 https://github.com/languagetool-org/languagetool.git
cd languagetool/languagetool-language-modules/de/src/main/resources/org/languagetool/rules/de/
```

### Step 2: Identify Key Rule Files
Key XML files to extract from:
- `de-word-order.xml` - Word order issues
- `de-verb-placement.xml` - Verb position rules
- `de-subordinate-clauses.xml` - Subordinate clause rules
- `de-case-errors.xml` - Case/agreement issues
- `de-question-errors.xml` - Question structure

### Step 3: Convert XML → Lua Pattern

**LanguageTool XML Format:**
```xml
<rule id="VERB_POSITION_SUBORDINATE" category="WORD_ORDER">
  <pattern>
    <token>wenn</token>
    <token regexp="yes">.*</token>
    <token postag="VER:.*"></token>
    <token regexp="yes">.*</token>
  </pattern>
  <message>In subordinate clauses introduced by 'wenn', the verb should be at the end</message>
  <example type="incorrect">Wenn ich komme, dann...</example>
  <example type="correct">Wenn ich dann komme,...</example>
</rule>
```

**Our Lua Format:**
```lua
{
    from = "wenn (.+) (.+)",
    to = "%1 %2", -- Verb goes to end
    priority = 15,
    note = "Subordinate clause verb placement"
}
```

## Implementation Strategy

Since we can't automatically download and parse the full repository in this environment, I'll:

1. **Manual extraction** of 15-20 most critical rules
2. **Convert known patterns** based on common German grammar rules
3. **Test on real chat logs** to verify effectiveness
4. **Document the process** for future expansion

## Priority Rules to Extract

1. Subordinate clause verb-final position
2. Separable verb prefix handling
3. Modal verb + infinitive constructions
4. Perfect tense word order
5. Question inversion
6. Relative clause verb placement

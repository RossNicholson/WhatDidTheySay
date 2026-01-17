# Translation Test Analysis Report

## Test Results Summary
- **Total Tests**: 94
- **Passed**: 86 (91.5%)
- **Failed/Skipped**: 4 (4.3%)
- **Low Confidence**: 4 (4.3%)

## Issues Identified

### 1. Skipped Translations (4)

#### "WTS 6 slot bags"
- **Reason**: `language_unknown`
- **Issue**: Should be detected as English and skipped (this is correct behavior)
- **Action**: None needed - this is working as intended

#### "lf heal für DM"
- **Reason**: `already_english`
- **Issue**: This is mixed language (English + German), should translate
- **Action**: Fix mixed-language detection to handle "lf" + German

#### "need port to SW"
- **Reason**: `already_english`
- **Issue**: This is mixed language (English + German), should translate
- **Action**: Fix mixed-language detection to handle English phrases + German

#### "ok"
- **Reason**: `english_greeting`
- **Issue**: Universal greeting, correctly skipped
- **Action**: None needed - this is working as intended

### 2. Low Confidence Translations (4)

#### "verkaufe [Small Silk Pack] für 5g"
- **Translation**: "selling [small silk Pack]for 5g"
- **Confidence**: 0.42
- **Issues**:
  - Missing space before "for"
  - Item link capitalization issue
- **Action**: Add grammar rule to fix spacing after item links

#### "suche verzauberer für +55 heilung"
- **Translation**: "looking for enchanter for +55 healing"
- **Confidence**: 0.49
- **Issues**: Low confidence due to numbers/symbols
- **Action**: Improve confidence calculation for numeric/symbol content

#### "brauche schneider für 6 slot taschen"
- **Translation**: "need tailor for 6 slot bags"
- **Confidence**: 0.50
- **Issues**: Low confidence due to numbers
- **Action**: Improve confidence calculation for numeric content

#### "komm zu unserer gilde"
- **Translation**: "come to unserer guild"
- **Confidence**: 0.49
- **Issues**: "unserer" not translated (possessive pronoun)
- **Action**: Add "unserer" = "our" to vocabulary

### 3. Translation Quality Issues

#### Typos in Output
- "whas" instead of "what" (from "was")
- "thas" instead of "that" (from "dass")
- **Action**: Add grammar rules to fix these typos

#### Word Order Issues
- "Ironforge you time have" instead of "if you have time" (from "wenn du zeit hast")
- "I white thas you right have" instead of "I know that you are right" (from "ich weiß, dass du recht hast")
- **Action**: Improve dependency parser or add grammar rules for subordinate clauses

#### Missing Translations
- "du" sometimes not translated to "you"
- "unserer" not translated to "our"
- **Action**: Add missing vocabulary entries

#### Separable Verb Issues
- "mach auf die tür" → "do on the door" (should be "open the door")
- "macht zu das fenster" → "do to the window" (should be "close the window")
- **Action**: Improve separable verb handling in patterns/phrases

## Priority Fixes

### High Priority
1. Fix "whas" → "what" typo
2. Fix "thas" → "that" typo
3. Add "unserer" = "our" to vocabulary
4. Fix spacing after item links
5. Improve mixed-language detection for "lf" + German

### Medium Priority
1. Improve separable verb translations ("mach auf" → "open")
2. Fix word order in subordinate clauses
3. Improve confidence calculation for numeric/symbol content

### Low Priority
1. Better handling of "du" in all contexts
2. Improve complex sentence word order

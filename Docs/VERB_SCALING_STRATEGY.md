# Scaling to Thousands of Verbs - Strategy

## Current State
- ~257 verb forms
- ~150 infinitive verbs
- Manual lookup table

## Target State
- **1,000-2,000 infinitive verbs** (top frequency verbs)
- **10,000-20,000 verb forms** (all conjugations)
- Hybrid approach: explicit irregulars + programmatic regulars

## Strategy: Hybrid Approach

### Phase 1A: Improve Pattern-Based Generation (Smart Fallback)
Enhance the pattern matching fallback to reliably generate conjugations for **regular (weak) verbs**.

**Regular verb patterns:**
- Present: stem + e/st/t/en
- Past: stem + te/test/ten
- Participle: ge + stem + t

**Example:**
- "spielen" (to play) → generates: spiele, spielst, spielt, spielte, spieltest, spielten, gespielt

### Phase 1B: Add Top 1000-2000 Infinitive Verbs List
Create a comprehensive list of infinitive verbs (prioritized by frequency):
- Validate pattern-generated forms against this list
- Provides base vocabulary for translation

### Phase 1C: Keep Explicit Irregulars
~200-300 irregular/strong verbs with explicit conjugations (already have ~150)

## Implementation Plan

### Option 1: Pattern Generation + Validation (Recommended)
1. List of 1000-2000 infinitive verbs (frequency-sorted)
2. Pattern-based generation for regular verbs
3. Explicit lookup only for irregular verbs
4. Result: Thousands of verbs with minimal code

### Option 2: Pre-generated Database
1. Download/generate full conjugation tables
2. Convert to Lua format
3. Bundle as static data
4. Result: Complete but large file size

### Option 3: Lazy Generation with Caching
1. Generate forms on-demand
2. Cache results
3. Validate against verb list
4. Result: Efficient runtime, scalable

## Recommended: Hybrid Pattern + List Approach

**Benefits:**
- Small code footprint
- Handles thousands of verbs
- Accurate for regular verbs
- Explicit exceptions for irregulars

**File Structure:**
- `Languages/de/verbs.lua` - List of 1000-2000 infinitive verbs (frequency-sorted)
- `Core/GermanMorphology.lua` - Enhanced pattern generation + explicit irregulars

## Next Steps
1. Enhance pattern-based generation (make it more reliable)
2. Add comprehensive verb list (1000-2000 infinitive verbs)
3. Test on real chat logs to identify gaps
4. Iterate based on usage

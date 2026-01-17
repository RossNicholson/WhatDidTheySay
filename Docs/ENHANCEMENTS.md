# Potential Enhancements for What Did They Say?

This document outlines potential enhancements organized by category and complexity, all designed to work within the addon's constraints.

## 🎯 Core Constraints (Must Follow)

1. **WoW Classic Only** - Interface 11508, Lua 5.1 compatibility
2. **No External APIs** - All logic runs locally in-game
3. **No HTTP/Networking** - Cannot make web requests
4. **No File Writes at Runtime** - Cannot write files during gameplay
5. **No ML Models** - Rule-based translation only
6. **Performance Critical** - No heavy per-frame logic, no unbounded loops
7. **Conservative Design** - Silence over wrong translations
8. **Gameplay-Focused** - Whispers, party chat, small group coordination

---

## 🟢 High Priority / Easy Wins

### 1. **Additional Language Packs**
**Complexity:** Medium  
**Impact:** High  
**Feasibility:** ✅ Perfect fit

- Add French (fr → en)
- Add Spanish (es → en)
- Add Russian (ru → en)
- **Implementation:** Follow existing `Languages/de/` pattern
- **Constraints:** ✅ No external APIs needed, pure vocabulary/patterns

### 2. **User Custom Vocabulary**
**Complexity:** Low  
**Impact:** Medium  
**Feasibility:** ✅ Excellent

- Allow users to add custom word translations via UI
- Store in SavedVariables
- Merge with language pack vocabulary at runtime
- **Use Case:** Server-specific slang, guild terms, personal preferences
- **Constraints:** ✅ SavedVariables only (no file writes)

### 3. **Per-Channel Confidence Thresholds**
**Complexity:** Low  
**Impact:** Medium  
**Feasibility:** ✅ Straightforward

- Different confidence thresholds per channel
- Example: Lower threshold for WHISPER (more important), higher for TRADE (less important)
- **Implementation:** Add `channelThresholds` to SavedVariables
- **Constraints:** ✅ Just configuration logic

### 4. **Translation History UI Window**
**Complexity:** Medium  
**Impact:** Medium  
**Feasibility:** ✅ Good

- Replace `/wdts debug` text output with a proper UI window
- Show recent translations in a scrollable frame
- Filter by channel, confidence, date
- **Implementation:** New UI/History.lua file, use existing translation history
- **Constraints:** ✅ Data already collected, just UI work

### 5. **More Intent Types**
**Complexity:** Low  
**Impact:** Medium  
**Feasibility:** ✅ Easy

- Add more intent categories:
  - `HELP_REQUEST` - "need help", "can someone help"
  - `TRADE_OFFER` - "selling X", "buying Y"
  - `GROUP_STATUS` - "we're here", "waiting at X"
  - `THANKS` - "thank you", "danke"
- **Implementation:** Add to `Languages/de/intents.lua`
- **Constraints:** ✅ Pure pattern matching

### 6. **Whisper Reply Shortcut**
**Complexity:** Low  
**Impact:** Low-Medium  
**Feasibility:** ✅ Good

- Add `/wdts reply` command to quickly whisper back to last translated message sender
- **Implementation:** Track last translated message sender, pre-fill whisper
- **Constraints:** ✅ Simple chat command

---

## 🟡 Medium Priority / Moderate Complexity

### 7. **Translation Statistics Tracking**
**Complexity:** Medium  
**Impact:** Low-Medium  
**Feasibility:** ✅ Good

- Track translation metrics: count, success rate, average confidence
- Display in config UI or new stats window
- **Implementation:** Store counts in SavedVariables, aggregate on display
- **Constraints:** ✅ Just counting logic

### 8. **Better Phrase Context Matching**
**Complexity:** Medium-High  
**Impact:** High  
**Feasibility:** ✅ Good

- Improve phrase matching to consider word order variations
- Handle separable verbs better (e.g., "machen auf" = "open")
- More flexible pattern matching for German grammar
- **Implementation:** Enhanced pattern engine with word order permutations
- **Constraints:** ✅ More sophisticated pattern matching, but still rule-based

### 9. **Translation Quality Indicators**
**Complexity:** Low-Medium  
**Impact:** Low  
**Feasibility:** ✅ Good

- Visual indicators for translation confidence:
  - ✓ High confidence (≥0.70)
  - ~ Medium confidence (0.50-0.69)
  - ? Low confidence (0.30-0.49) - only if manually requested
- **Implementation:** Icons or colors in translation display
- **Constraints:** ✅ UI enhancement only

### 10. **Manual Translation Request**
**Complexity:** Medium  
**Impact:** Medium  
**Feasibility:** ✅ Good

- Right-click translated message → "Translate this" (even if confidence low)
- Click translated message → "Show original only"
- **Implementation:** Chat frame hooks, context menu
- **Constraints:** ✅ WoW Classic supports chat context menus

### 11. **Export/Import Settings**
**Complexity:** Medium  
**Impact:** Low-Medium  
**Feasibility:** ⚠️ Limited

- Export settings as chat message (to copy/paste)
- Import settings from chat input
- **Limitation:** Cannot write to file, must use chat/copy-paste
- **Constraints:** ⚠️ Workaround needed (chat-based export)

### 12. **Sound Notifications**
**Complexity:** Low  
**Impact:** Low-Medium  
**Feasibility:** ✅ Good

- Optional sound when high-priority translation (e.g., WHISPER) received
- **Implementation:** `PlaySound()` API
- **Constraints:** ✅ Simple API call

---

## 🔵 Lower Priority / Higher Complexity

### 13. **Compound Word Splitting (German)**
**Complexity:** High  
**Impact:** Medium  
**Feasibility:** ⚠️ Challenging

- Handle German compound words without spaces (e.g., "Wollstofftaschen" = "wool cloth bags")
- **Challenge:** Requires dictionary of word stems/prefixes
- **Implementation:** Prefix/suffix matching with fallback
- **Constraints:** ✅ Still rule-based, but complex vocabulary needed

### 14. **Context-Aware Word Translation**
**Complexity:** High  
**Impact:** High  
**Feasibility:** ⚠️ Challenging

- Translate words differently based on context
- Example: "Tank" = "tank" (role) vs "Tank" = "tank" (vehicle) - context decides
- **Implementation:** Multi-word context windows, disambiguation rules
- **Constraints:** ✅ Rule-based, but needs sophisticated logic

### 15. **Translation Caching Persistence**
**Complexity:** Medium  
**Impact:** Low-Medium  
**Feasibility:** ⚠️ Limited

- Persist translation cache across sessions
- **Challenge:** Cache size limits (SavedVariables size limits)
- **Implementation:** Store cache in SavedVariables with size limits
- **Constraints:** ⚠️ Must respect SavedVariables size limits

### 16. **Multi-Language Simultaneous Support**
**Complexity:** Medium-High  
**Impact:** High  
**Feasibility:** ✅ Good

- Support multiple source languages at once (e.g., German + French → English)
- Auto-detect which language to use
- **Implementation:** Enhance language detection to support multiple active packs
- **Constraints:** ✅ Just detection logic enhancement

### 17. **Guild-Specific Vocabulary Sharing**
**Complexity:** High  
**Impact:** Low-Medium  
**Feasibility:** ⚠️ Challenging (constraints)

- Share custom vocabulary with guild members
- **Challenge:** No external APIs, no file sharing
- **Workaround:** Guild note/chat-based sharing (manual copy-paste)
- **Constraints:** ❌ Cannot use external sync, manual only

---

## ❌ Not Feasible (Constraint Violations)

### ❌ **Online Translation Service Integration**
- **Why:** Requires external APIs/HTTP
- **Constraint:** No external services allowed

### ❌ **Machine Learning Models**
- **Why:** Too heavy, requires model files, not rule-based
- **Constraint:** No ML, rule-based only

### ❌ **Real-Time Translation from Internet**
- **Why:** Requires HTTP/networking
- **Constraint:** No external APIs, offline only

### ❌ **Translation Quality Feedback Loop**
- **Why:** Would require external storage to learn from corrections
- **Constraint:** No file writes, no external services

### ❌ **Voice Chat Integration**
- **Why:** WoW Classic doesn't support voice chat APIs
- **Constraint:** Not available in Classic API

### ❌ **OCR/Image Translation**
- **Why:** Not available in WoW Classic Lua API
- **Constraint:** No image processing capabilities

---

## 📊 Enhancement Priority Matrix

| Enhancement | Complexity | Impact | Feasibility | Priority |
|------------|-----------|--------|-------------|----------|
| Additional Languages | Medium | High | ✅ Excellent | 🔴 High |
| User Custom Vocabulary | Low | Medium | ✅ Excellent | 🔴 High |
| Per-Channel Thresholds | Low | Medium | ✅ Excellent | 🟠 Medium-High |
| Translation History UI | Medium | Medium | ✅ Good | 🟠 Medium |
| More Intent Types | Low | Medium | ✅ Excellent | 🟠 Medium |
| Better Phrase Matching | Medium-High | High | ✅ Good | 🟠 Medium |
| Translation Statistics | Medium | Low-Medium | ✅ Good | 🟡 Medium |
| Manual Translation Request | Medium | Medium | ✅ Good | 🟡 Medium |
| Context-Aware Translation | High | High | ⚠️ Challenging | 🟡 Low-Medium |
| Compound Word Splitting | High | Medium | ⚠️ Challenging | 🔵 Low |

---

## 🎯 Recommended Next Steps

1. **Start with Low-Hanging Fruit:**
   - User Custom Vocabulary (#2) - High impact, low complexity
   - Per-Channel Confidence Thresholds (#3) - Immediate utility
   - More Intent Types (#5) - Easy win

2. **Build Foundation:**
   - Translation History UI (#4) - Improves debugging/UX
   - Better Phrase Matching (#8) - Core quality improvement

3. **Expand Capabilities:**
   - Additional Languages (#1) - Major feature expansion
   - Multi-Language Support (#16) - Logical next step

4. **Polish & Refinement:**
   - Translation Statistics (#7)
   - Quality Indicators (#9)
   - Sound Notifications (#12)

---

*Last Updated: Version 0.2.0*

# User Guide

## 🎮 Basic Usage

### Opening Configuration

Type `/wdts` in chat to open the configuration window.

You can also use `/whatdidtheysay` as a full command.

### Automatic Translation

Once configured, the addon works automatically:

1. **Detects foreign language messages** (German or French) in enabled chat channels
2. **Translates to English** with confidence scoring
3. **Displays translations** automatically when confidence ≥ 0.50
4. **Shows manual option** for medium confidence (0.30-0.49)
5. **Stays silent** for low confidence (< 0.30)

### Translation Display

Translations appear as colored text in your chat:

- **🟢 Green** - High confidence (≥ 0.50) - Auto-displayed
- **🟡 Yellow** - Medium confidence (0.30-0.49) - Manual option available
- **⚪ Hidden** - Low confidence (< 0.30) - Too uncertain to show

### Chat Channels

Enable/disable translation for any channel:

- **Whisper** - Private messages
- **Say** - Local area chat
- **Yell** - Shout in area
- **Party** - Party chat
- **Raid** - Raid chat
- **Guild** - Guild chat
- **General** - Zone general chat
- **Trade** - Trade chat
- **World** - World Defense chat
- **LFG** - Looking for Group channel

## ⌨️ Commands

### `/wdts` or `/whatdidtheysay`

Opens the configuration window.

### `/wdts test`

Tests the translation engine with sample messages. Useful for debugging.

### `/wdts suite`

Runs the full test suite (development command).

### `/wdts debug`

Shows recent translation history and debug information.

### `/wdts clear`

Clears the translation history.

### `/wdts clearcache`

Clears the translation cache. Use if translations seem stuck.

### `/reload`

Reloads the UI (useful after configuration changes).

## 🎯 Intent Detection

The addon recognizes common player intents and highlights them:

- **LFG (Looking for Group)** - "LFM", "LF tank", etc.
- **Invites** - "inv", "invite me", etc.
- **Ready Status** - "ready", "rdy", etc.
- **Trading** - "WTS", "WTB", etc.
- **Questions** - Messages ending with "?"

## 💬 Translation Examples

### Basic Conversation

**German:** `hallo, wie geht es dir?`  
**Translation:** `hello, how are you?`  
**Confidence:** 1.00 ✅

**German:** `ich suche einen tank für bfd`  
**Translation:** `I'm looking for a tank for BFD`  
**Confidence:** 0.95 ✅

### Gaming Context

**German:** `kannst du mir helfen?`  
**Translation:** `can you help me?`  
**Confidence:** 1.00 ✅

**German:** `wer will in dungeon gehen?`  
**Translation:** `who wants to go to dungeon?`  
**Confidence:** 0.85 ✅

### Past Tense

**German:** `ich habe es gestern gemacht`  
**Translation:** `I did it yesterday`  
**Confidence:** 0.92 ✅

## ⚙️ Configuration Options

### Confidence Threshold

- **Default:** 0.50 (50%)
- **High:** 0.70 (70%) - More conservative, fewer translations
- **Medium:** 0.50 (50%) - Balanced
- **Low:** 0.30 (30%) - More aggressive, may include less accurate translations

### Auto-Translate

- **Enabled** - Translations appear automatically (default)
- **Disabled** - You must click to show translations (manual mode)

### Show Original

- **Enabled** - Shows both original and translation
- **Disabled** - Shows only translation

### Channel Selection

Enable/disable translation per channel based on your needs:

- **Always enable:** Whisper, Party, Guild (important communication)
- **Usually enable:** Raid (coordination)
- **Sometimes enable:** General, Trade (spam reduction)
- **Usually disable:** Say, Yell (too frequent)

## 🔍 How Translation Works

1. **Message arrives** in enabled channel
2. **Language detection** - Identifies if message is German
3. **Tokenization** - Breaks message into words, phrases
4. **Intent detection** - Recognizes player intent
5. **Pattern matching** - Matches phrases and patterns
6. **Translation** - Translates word-by-word and phrase-by-phrase
7. **Grammar rules** - Applies grammar corrections
8. **Confidence scoring** - Calculates translation confidence
9. **Display decision** - Shows, offers, or hides based on confidence

## 🎨 Translation Quality Indicators

### High Confidence (Green) ✅

- Most words recognized
- Grammar rules applied successfully
- Phrase patterns matched
- Intent detected clearly

### Medium Confidence (Yellow) ⚠️

- Some words not recognized
- Partial phrase matches
- Grammar rules may need refinement
- Still usable but less certain

### Low Confidence (Hidden) ❌

- Too many unknown words
- Poor grammar match
- Very uncertain translation
- Better to stay silent

## 📊 Understanding Confidence Scores

- **0.90 - 1.00** - Excellent translation, very reliable
- **0.70 - 0.89** - Good translation, reliable
- **0.50 - 0.69** - Decent translation, mostly reliable
- **0.30 - 0.49** - Uncertain translation, manual review recommended
- **0.00 - 0.29** - Too uncertain, hidden by default

## 💡 Tips for Best Results

1. **Enable important channels** - Focus on channels where communication matters
2. **Adjust confidence** - Lower threshold = more translations (but less accurate)
3. **Clear cache if stuck** - Use `/wdts clearcache` if translations seem wrong
4. **Report issues** - Help improve the addon by reporting translation errors
5. **Check intent** - Intent detection helps understand context

## 🚫 What the Addon Doesn't Translate

- **Already English** - Won't translate English messages
- **Too uncertain** - Low confidence messages stay hidden
- **Disabled channels** - Only translates enabled channels
- **Mixed languages** - May skip heavily mixed messages
- **Gaming abbreviations** - LF, LFM, WTS, etc. are preserved as-is

## 🔄 Reloading Settings

After changing settings:

- Click "OK" or "Apply" in the config window
- Or type `/reload` to reload UI
- Settings are saved automatically

## 📱 Titan Panel Integration

If you have Titan Panel installed:

- Status indicator shows in Titan Panel bar
- Green = active and working
- Red = disabled or error
- Click to open config quickly

## 🎓 Next Steps

- **[Configuration](Configuration)** - Detailed configuration options
- **[Troubleshooting](Troubleshooting)** - Common issues
- **[FAQ](FAQ)** - Frequently asked questions

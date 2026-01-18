# Configuration Guide

## ⚙️ Configuration Window

Open the configuration window by typing `/wdts` in chat.

## 🎛️ Settings Explained

### Confidence Threshold

Controls how confident the addon must be before auto-displaying translations.

**Range:** 0.00 - 1.00 (0% - 100%)

**Recommended Settings:**
- **0.70** - Very conservative, only high-quality translations
- **0.50** - **Default** - Balanced, good translations
- **0.30** - More aggressive, includes lower-quality translations

**How it works:**
- Messages with confidence **≥ threshold** = Auto-display (green)
- Messages with confidence **0.30 - (threshold-0.01)** = Manual option (yellow)
- Messages with confidence **< 0.30** = Hidden

### Auto-Translate

Controls whether translations appear automatically or require manual activation.

**Enabled (Default):**
- Translations appear automatically in chat
- No user interaction required
- Best for active gameplay

**Disabled:**
- Translations are hidden by default
- Click on messages to show translation
- Useful for reducing chat clutter

### Show Original

Controls whether the original message is shown alongside the translation.

**Enabled (Default):**
- Shows both original and translation
- Format: `[Original] → Translation`
- Helpful for learning other languages

**Disabled:**
- Shows only translation
- Cleaner chat appearance

### Language Packs

Enable or disable specific language packs for translation.

**Available Language Packs:**
- **German (de → en)** - ✅ Enabled by default
- **French (fr → en)** - ✅ Enabled by default  
- **WoW Abbreviations (wow → en)** - ❌ **Disabled by default** 🆕

**WoW Abbreviations Pack:**
- Expands gaming abbreviations like "LF", "LFM", "WTS", "WTB" to full English
- Only activates for English messages (doesn't interfere with foreign language translation)
- Can be enabled/disabled independently from foreign language packs
- Examples: "LF 1 tank strat ud" → "Looking for 1 tank Stratholme Undead side"

**Tip:** You can enable both foreign language packs AND WoW abbreviations pack simultaneously - they work independently.
- Less informative

### Channel Selection

Enable or disable translation for each chat channel.

#### Recommended Channel Settings

**Always Enable:**
- ✅ **Whisper** - Important private messages
- ✅ **Guild** - Guild communication
- ✅ **Party** - Party coordination

**Usually Enable:**
- ✅ **Raid** - Raid coordination
- ⚠️ **Say** - Local chat (may be frequent)

**Sometimes Enable:**
- ⚠️ **General** - Zone chat (often spam)
- ⚠️ **Trade** - Trade chat (often spam)
- ⚠️ **World** - World Defense (rarely needed)

**Rarely Enable:**
- ❌ **Yell** - Very frequent, often spam
- ❌ **LFG** - Usually English anyway

## 🔧 Advanced Settings

### Per-Channel Confidence (Future Feature)

Coming in a future version: Set different confidence thresholds per channel.

Example:
- Whisper: 0.30 (show everything, it's important)
- Trade: 0.70 (only very confident, reduce spam)

### Custom Vocabulary (Future Feature)

Coming in a future version: Add your own word translations.

Useful for:
- Server-specific slang
- Guild-specific terms
- Personal preferences

## 💾 Settings Storage

Settings are stored in:
```
WTF/Account/[AccountName]/SavedVariables/WhatDidTheySayDB.lua
```

**Backup:** Copy this file to save your settings  
**Reset:** Delete this file to restore defaults

## 🔄 Applying Changes

After changing settings:

1. Click **"OK"** - Saves and closes window
2. Click **"Apply"** - Saves but keeps window open
3. Click **"Cancel"** - Discards changes

Changes take effect immediately (no reload required).

## 📋 Configuration Profiles (Future)

Coming in a future version: Save and switch between configuration profiles.

Use cases:
- Different settings for PvP vs PvE
- Different settings for different characters
- Testing configurations

## 🎯 Optimization Tips

### Reduce Chat Spam

1. **Increase confidence threshold** to 0.70
2. **Disable auto-translate** for Trade/General channels
3. **Show original = disabled** for cleaner chat

### Maximize Translation Coverage

1. **Lower confidence threshold** to 0.30
2. **Enable all channels**
3. **Enable auto-translate**

### Balance (Recommended)

1. **Confidence: 0.50**
2. **Enable:** Whisper, Party, Guild, Raid
3. **Disable:** General, Trade, World, Yell
4. **Auto-translate: Enabled**
5. **Show original: Enabled**

## 🔍 Debug Options

### Show Translation History

Type `/wdts debug` to see:
- Recent translation attempts
- Confidence scores
- Intent detection results
- Failed translations

### Clear Cache

Type `/wdts clearcache` to clear the translation cache.

Useful if:
- Translations seem stuck/wrong
- After vocabulary updates
- Testing changes

### Test Mode

Type `/wdts test` to run test translations.

Shows:
- Sample translations
- Confidence scores
- Detection results

## ⚠️ Known Limitations

### Settings Saved Per-Account

- Settings are shared across all characters on an account
- Cannot have different settings per character (yet)
- Workaround: Use different WoW accounts

### No Export/Import

- Cannot export/import settings (yet)
- Manual backup: Copy SavedVariables file

## 🔄 Reset to Defaults

To reset all settings to defaults:

1. Type `/wdts clear`
2. Or delete `WhatDidTheySayDB.lua` in SavedVariables
3. Reload UI (`/reload`)

## 📝 Next Steps

- **[User Guide](User-Guide)** - How to use the addon
- **[Troubleshooting](Troubleshooting)** - Fix configuration issues

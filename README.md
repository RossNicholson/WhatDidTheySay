# What Did They Say?

> **In-game chat translation for World of Warcraft Classic**

An addon that helps players understand chat messages written in other languages using only in-game Lua logic. All translation processing happens locally in the game—no external APIs, translation services, or web requests required.

[![WoW Classic](https://img.shields.io/badge/WoW-Classic%20Era-orange)](https://worldofwarcraft.blizzard.com/en-us/game/wow-classic)
[![Interface Version](https://img.shields.io/badge/Interface-11508-blue)](https://www.wowhead.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## 📖 Overview

**What Did They Say?** is a gameplay-focused communication aid for World of Warcraft Classic. Unlike general-purpose translators, this addon is specifically designed to help players coordinate in groups, whisper, and communicate across language barriers during gameplay.

### Key Features

- ✅ **No External Services** - All translation logic runs locally in-game, no external APIs or translation services needed
- ✅ **Automated Processing** - Automatically translates messages when confidence is sufficient
- ✅ **Intent Detection** - Understands player intent (LFG, invites, ready status, etc.)
- ✅ **Safe & Conservative** - Stays quiet when confidence is low to avoid wrong translations
- ✅ **Performance Optimized** - Translation caching and message throttling prevent lag
- ✅ **Configurable** - Choose which chat channels to translate
- ✅ **Titan Panel Support** - Optional integration with Titan Panel for status display

### Design Philosophy

This addon prioritizes:
- **Clarity over literal accuracy** - Understandable meaning over perfect grammar
- **Intent over grammar perfection** - Focus on what the player wants, not how they say it
- **Silence over wrong translations** - Better to stay quiet than give incorrect information
- **Automation without noise** - Works quietly in the background

---

## 🌐 Supported Languages

| Language | Status | Direction |
|----------|--------|-----------|
| German (de) | ✅ Full Support | de → en |
| More languages | 🔜 Coming Soon | - |

### Current Capabilities

- **Vocabulary Translation** - High-value WoW terms (roles, dungeons, actions)
- **Intent Recognition** - LFG requests, invites, ready status, movement commands
- **Pattern Matching** - Common phrase structures
- **Grammar Post-Processing** - Basic corrections and reordering

---

## 🚀 Installation

### For Players

1. **Download** the latest release from the [Releases](../../releases) page, or clone this repository
2. **Extract** the `WhatDidTheySay` folder to your WoW Classic AddOns directory:

   **Windows:**
   ```
   World of Warcraft\_classic_era_\Interface\AddOns\WhatDidTheySay\
   ```

   **Mac:**
   ```
   World of Warcraft/_classic_era_/Interface/AddOns/WhatDidTheySay/
   ```

3. **Launch** World of Warcraft Classic
4. At the character selection screen, click **AddOns** and ensure "What Did They Say?" is enabled
5. Log in - the configuration window will open automatically on first load

### For Developers

```bash
git clone https://github.com/RossNicholson/WhatDidTheySay.git
cd WhatDidTheySay
# Place in your WoW Classic AddOns directory
```

---

## 💻 Usage

### Commands

| Command | Description |
|---------|-------------|
| `/wdts` | Open configuration window |
| `/whatdidtheysay` | Alternative command (same as above) |
| `/wdts test <message>` | Test translation of a message |
| `/wdts test verbose <message>` | Test translation with detailed debugging output |
| `/wdts suite` | Run predefined test suite |
| `/wdts debug` or `/wdts log` | Show recent translation attempts |
| `/wdts clear` | Clear translation history |
| `/wdts clearcache` | Clear translation cache |

### First Time Setup

On first load, the configuration window opens automatically. Configure:
- **Enabled Channels** - All channels you've joined are enabled by default (you can disable any you don't want)
- **Auto-translate** - Enable automatic translation display

### How It Works

1. **Monitoring** - Addon monitors enabled chat channels
2. **Detection** - When a foreign-language message is detected:
   - Tokenizes the message (extracts words, protects links/names/numbers)
   - Detects source language using function words and character hints
   - Identifies player intent (LFG, invite, ready, etc.)
   - Translates using vocabulary and phrase patterns
   - Calculates confidence score
3. **Display** - If confidence ≥ 0.70, translation is automatically shown
4. **Preservation** - Original message is never replaced; translations appear separately

### Translation Display

Translations appear in chat as:
```
→ [Translated meaning] [INTENT]
```

- **Green text** - High confidence (≥ 0.70)
- **Yellow text** - Medium confidence (0.45 - 0.69)

---

## ⚙️ Configuration

Access configuration via `/wdts` or `/whatdidtheysay`.

### Channel Settings

The addon automatically enables translation for all channels you have joined. You can customize which channels to monitor via the configuration menu:

| Channel | Default | Description |
|---------|---------|-------------|
| WHISPER | ✅ Enabled | Private messages |
| SAY | ✅ Enabled | Local chat |
| PARTY | ✅ Enabled | Party chat |
| RAID | ✅ Enabled | Raid chat (when in raid) |
| GUILD | ✅ Enabled | Guild chat |
| GENERAL | ✅ Enabled | General channel (if joined) |
| TRADE | ✅ Enabled | Trade channel (if joined) |
| WORLD | ✅ Enabled | World channel (if joined) |
| LFG | ✅ Enabled | Looking for Group channel (if joined) |

**Note:** All channels are enabled by default. The addon automatically detects which channels you've joined and enables translation for them. You can disable specific channels in the configuration menu if you find them too noisy or prefer to only translate certain channels.

### Confidence Thresholds

| Confidence | Behavior |
|------------|----------|
| ≥ 0.50 | ✅ Automatically display translation (green) |
| 0.30 - 0.49 | ⚠️ Show with lower confidence (yellow) |
| < 0.30 | 🔇 Stay silent (no translation shown) |

**Note:** Thresholds were adjusted in v0.2.0 to be more lenient for mixed-language messages while maintaining accuracy.

---

## 📋 Requirements

- **World of Warcraft Classic** (Era version)
- **Client Build**: 1.15.8 (65300)
- **Interface Version**: 11508
- **Dependencies**: None

---

## 🏗️ Technical Architecture

### Project Structure

```
WhatDidTheySay/
├── Core/                    # Core translation engine
│   ├── Engine.lua          # Main translation pipeline
│   ├── Tokenizer.lua       # Tokenization and protection logic
│   ├── LanguageDetect.lua  # Language detection
│   ├── Confidence.lua      # Confidence scoring
│   ├── ChatHooks.lua       # Chat event interception
│   └── Utils.lua           # Shared utilities
├── Languages/               # Language packs
│   ├── en/                 # English (target language)
│   └── de/                 # German (source language)
│       ├── tokens.lua      # Vocabulary dictionary
│       ├── intents.lua     # Intent patterns
│       ├── patterns.lua    # Phrase patterns
│       └── grammar.lua     # Grammar rules
├── UI/                      # User interface
│   ├── Config.lua          # Configuration window
│   ├── Widgets.lua         # UI components
│   └── TitanPanel.lua      # Titan Panel integration (optional)
├── WhatDidTheySay.lua      # Addon entry point
└── WhatDidTheySay.toc      # Addon manifest
```

### Translation Pipeline

Every message goes through these steps in order:

1. **Channel Filtering** - Ignore disabled channels immediately
2. **Tokenization** - Split into structured tokens (words, numbers, punctuation, protected items)
3. **Language Detection** - Determine source language using function words and character hints
4. **Intent Detection** - Identify player intent (highest priority)
5. **Pattern Translation** - Apply phrase patterns and vocabulary
6. **Grammar Post-Processing** - Apply safe, deterministic grammar rules
7. **Confidence Scoring** - Calculate final confidence (0.0 - 1.0)
8. **Output Gating** - Display or suppress based on confidence

### Protected Tokens

These are never modified during translation:
- Player names
- Item links (`|c...|Hitem:...|h...|h|r`)
- Spell links (`|c...|Hspell:...|h...|h|r`)
- Quest links (`|c...|Hquest:...|h...|h|r`)
- Raid icons (`{rt1}` - `{rt8}`)
- Numbers and coordinates

### Performance Features

- **Translation Caching** - Caches successful translations (max 500 entries)
- **Message Throttling** - Limits processing to 10 messages per 2-second window
- **No Heavy Logic** - Avoids per-frame updates and unbounded loops
- **Memory Efficient** - Designed to not impact FPS or UI responsiveness

---

## 🐛 Troubleshooting

### Translations Not Showing?

- ✅ Check that the channel is enabled in configuration (`/wdts`)
- ✅ Verify the message is in a supported language (currently German)
- ✅ Low confidence messages (< 0.45) are intentionally silent (by design)

### Addon Not Loading?

- ✅ Verify folder structure is correct
- ✅ Check Interface version matches (11508)
- ✅ Ensure "What Did They Say?" is enabled in AddOns list
- ✅ Enable Lua errors: `/console scriptErrors 1`

### Too Many Translations?

- ✅ Disable channels you don't want translated (`/wdts`)
- ✅ Disable auto-translate for manual control

### Performance Issues?

- ✅ Translation caching should prevent reprocessing
- ✅ Message throttling handles chat bursts
- ✅ If issues persist, disable channels you don't need

---

## 🤝 Contributing

Contributions are welcome! This addon is designed to scale cleanly to additional languages.

### Adding a New Language

1. Create a new folder in `Languages/` with the language code (e.g., `fr` for French)
2. Add the four required files:
   - `tokens.lua` - High-value vocabulary dictionary
   - `intents.lua` - Intent detection patterns
   - `patterns.lua` - Reusable phrase structures
   - `grammar.lua` - Grammar post-processing rules
3. Follow existing patterns in the `Languages/de/` folder
4. Add function words to `Core/LanguageDetect.lua`
5. Test thoroughly and submit a pull request

### Development Guidelines

- Follow existing code style and structure
- Maintain separation of concerns (Core, Languages, UI)
- Ensure all translations have confidence scoring
- Test with real in-game chat messages
- Update README if adding new features

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📚 Version History

### Version 0.2.0

- ✅ **Guild Chat Support** - Added translation support for guild chat channel
- ✅ **Titan Panel Integration** - Optional status display in Titan Panel bar (if Titan Panel is installed)
- ✅ **Testing Commands** - Added `/wdts test`, `/wdts suite`, `/wdts debug`, `/wdts clear`, `/wdts clearcache` for development and debugging
- ✅ **Improved False Positive Protection** - Excludes universal gaming abbreviations (LF, LFM, WTS, WTB, tank, DM, etc.) from triggering German translation
- ✅ **Enhanced Mixed-Language Detection** - Requires actual German function words or characters (ä, ö, ü, ß) before translating, preventing English messages with abbreviations from being incorrectly translated
- ✅ **Expanded German Vocabulary** - Added common words: "zum", "leveln", "alles", "können", "güldischer", "bsf" (Blackfathom Deeps), and more
- ✅ **Better Phrase Matching** - Added phrases like "zum leveln", "noch alles" for more accurate translations
- ✅ **Refined Language Detection** - More accurate distinction between English and German messages, especially for abbreviation-heavy messages

### Version 0.1.0

- ✅ Initial stable release
- ✅ German → English translation support
- ✅ Automatic translation with confidence scoring
- ✅ Configurable channels and settings
- ✅ Translation caching and throttling
- ✅ Intent detection (LFG, invites, ready status, etc.)
- ✅ Protected token handling (links, names, numbers)
- ✅ Performance optimizations
- ✅ Comprehensive test suite

---

## 🙏 Credits

**What Did They Say?** - In-game chat translation for WoW Classic

Developed by **Ross Nicholson** for World of Warcraft Classic players who want to communicate across language barriers without relying on external translation services or APIs.

---

## ☕ Support the Developer

This addon has been a significant amount of work to develop, test, and refine. If **What Did They Say?** has helped you communicate better in-game or made your WoW Classic experience more enjoyable, please consider [buying me a coffee](https://buymeacoffee.com/rossnicholson) to show your support!

Every contribution helps support continued development, improvements, and the addition of more language packs. Thank you! 🙏

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Support%20Ross-yellow?logo=buy-me-a-coffee)](https://buymeacoffee.com/rossnicholson)

---

## 📞 Support & Issues

- **GitHub Issues**: [Report bugs or request features](../../issues)
- **GitHub Discussions**: [Ask questions or share feedback](../../discussions)

---

## ⚠️ Important Notes

### What This Addon Is

- ✅ A communication bridge for whispers, party chat, and small group coordination
- ✅ A best-effort interpreter, not a linguistic authority
- ✅ A WoW-aware system that understands how players actually talk in-game

### What This Addon Is NOT

- ❌ A universal translator
- ❌ A machine-learning system
- ❌ A replacement for voice chat
- ❌ A phrasebook for real-world conversation
- ❌ A spam translator for Trade or General chat

**Remember:** This addon prioritizes silence over wrong translations. If it's not confident, it won't translate. This is by design.

---

*Made with ❤️ for the WoW Classic community*

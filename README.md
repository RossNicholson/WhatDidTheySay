# What Did They Say?

**Offline chat translation for World of Warcraft Classic**

What Did They Say? helps players understand chat messages written in other languages using only in-game Lua logic. The addon runs entirely offline, requires no API keys, no internet access, and no external services.

## Features

- **Offline Translation** - Works completely offline with no internet connection required
- **Automated Processing** - Automatically translates messages when confidence is high enough
- **Intent Detection** - Understands player intent (LFG, invites, ready status, etc.)
- **Safe & Conservative** - Stays quiet when confidence is low to avoid wrong translations
- **Performance Optimized** - Caching and throttling prevent lag
- **Configurable Channels** - Choose which chat channels to translate

## Supported Languages

- **German (de) → English (en)** - Full support with vocabulary, intents, and patterns
- More languages can be added in the future

## Installation

1. Download the latest release or clone this repository
2. Place the `WhatDidTheySay` folder in your WoW Classic AddOns directory:
   - **Windows**: `World of Warcraft\_classic_era_\Interface\AddOns\`
   - **Mac**: `World of Warcraft/_classic_era_/Interface/AddOns/`
3. Restart World of Warcraft or type `/reload` in-game
4. The addon will appear in your AddOns list (accessible via Character Selection screen)

## Usage

### First Time Setup

When you first load the addon, the configuration window will open automatically. You can:
- Enable/disable translation for specific channels (WHISPER, SAY, PARTY, RAID, etc.)
- Configure auto-translate settings

### Commands

- `/wdts` - Open configuration window
- `/whatdidtheysay` - Alternative command to open configuration

### How It Works

1. The addon monitors enabled chat channels (WHISPER, SAY, PARTY by default)
2. When a foreign-language message is detected, it runs through the translation pipeline:
   - Tokenization (extracts words, protects links/names/numbers)
   - Language detection (identifies source language)
   - Intent detection (understands player intent)
   - Translation (applies vocabulary and patterns)
   - Confidence scoring (determines translation quality)
3. If confidence is high enough (≥0.70), the translation is automatically displayed
4. The original message is never replaced - translations appear as separate messages

## Configuration

Access configuration via `/wdts` or `/whatdidtheysay`.

### Settings

- **Enabled Channels**: Choose which chat channels to monitor for translation
  - WHISPER (default: enabled)
  - SAY (default: enabled)
  - PARTY (default: enabled)
  - RAID (default: disabled)
  - GENERAL, TRADE, WORLD, LFG (default: disabled)
  
- **Auto-translate**: Automatically display translations when confidence is sufficient

### Confidence Thresholds

- **≥ 0.70**: Automatically display translation (green)
- **0.45 - 0.69**: Show with lower confidence (yellow)
- **< 0.45**: Stay silent (no translation shown)

## Requirements

- **World of Warcraft Classic** (Era)
- **Client Build**: 1.15.8 (65300) / Interface: 11508
- No additional dependencies required

## Design Philosophy

This addon is **not** a general-purpose translator. It is a gameplay-focused communication aid designed for:

- **Clarity over literal accuracy** - Understandable meaning over perfect grammar
- **Intent over grammar perfection** - Focus on what the player wants, not how they say it
- **Silence over wrong translations** - Better to stay quiet than give incorrect information
- **Automation without noise** - Works quietly in the background

### What This Addon Is

- A communication bridge for whispers, party chat, and small group coordination
- A best-effort interpreter, not a linguistic authority
- A WoW-aware system that understands how players actually talk in-game

### What This Addon Is NOT

- A universal translator
- A machine-learning system
- A replacement for voice chat
- A phrasebook for real-world conversation
- A spam translator for Trade or General chat

## Technical Details

### Architecture

The addon is organized into strictly separated layers:

- **Core/** - Translation engine, tokenization, language detection, confidence scoring
- **Languages/** - Language packs (tokens, intents, patterns, grammar rules)
- **UI/** - Configuration interface and widgets

### Translation Pipeline

Every message goes through these steps in order:

1. Channel filtering
2. Tokenization (with protected token extraction)
3. Language detection
4. Intent detection (highest priority)
5. Phrase and pattern translation
6. Grammar post-processing
7. Confidence scoring
8. Output gating

### Performance

- Translation caching to avoid reprocessing identical messages
- Message throttling to handle chat bursts safely
- No heavy per-frame logic
- Designed to not introduce FPS or UI lag

## Troubleshooting

**Translations not showing?**
- Check that the channel is enabled in configuration (`/wdts`)
- Verify the message is in a supported language (currently German)
- Low confidence messages (< 0.45) are intentionally silent

**Addon not loading?**
- Verify the folder structure is correct
- Check that Interface version matches (11508)
- Look for Lua errors in chat (type `/console scriptErrors 1`)

**Too many translations?**
- Disable channels you don't want translated in `/wdts`
- Disable auto-translate if you want manual control

## Contributing

Contributions are welcome! This addon is designed to scale cleanly to additional languages. To add a new language:

1. Create a new folder in `Languages/` with the language code (e.g., `fr` for French)
2. Add the four required files:
   - `tokens.lua` - Vocabulary dictionary
   - `intents.lua` - Intent patterns
   - `patterns.lua` - Phrase patterns
   - `grammar.lua` - Grammar rules
3. Follow the existing patterns in the `de/` folder
4. Add function words to `Core/LanguageDetect.lua`

## License

MIT License - See LICENSE file for details

## Credits

**What Did They Say?** - Offline chat translation for WoW Classic

## Version History

### 1.0.0
- Initial release
- German → English translation support
- Automatic translation with confidence scoring
- Configurable channels and settings
- Translation caching and throttling

## Support

For issues, questions, or contributions, please visit the [GitHub repository](https://github.com/RossNicholson/WhatDidTheySay).

---

*Remember: This addon prioritizes silence over wrong translations. If it's not confident, it won't translate.*

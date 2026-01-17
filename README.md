# What Did They Say? (Beta)

> **In-game chat translation for World of Warcraft Classic**

<div align="center">

**⚠️ BETA VERSION ⚠️**

This addon is currently in **beta** and actively under development.

**German (de → en) translation is the primary focus** and is being continuously improved with real-world feedback.

**Additional language packs are planned for future releases** after German translation is polished.

</div>

An addon that helps players understand chat messages written in other languages using only in-game Lua logic. All translation processing happens locally in the game—no external APIs, translation services, or web requests required.

[![WoW Classic](https://img.shields.io/badge/WoW-Classic%20Era-orange)](https://worldofwarcraft.blizzard.com/en-us/game/wow-classic)
[![Interface Version](https://img.shields.io/badge/Interface-11508-blue)](https://www.wowhead.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Beta](https://img.shields.io/badge/Status-BETA-yellow)](README.md#-beta-status)

---

## ⚠️ Beta Status

**This addon is currently in BETA and actively under development.**

- **Current Status:** **Only German (de → en) translation is currently available and functional**
- **What Works:** Core translation pipeline, German vocabulary (4,400+ entries), phrase patterns (1,000+), sentence patterns (275+), grammar rules (544+), intent detection, and dependency parsing
- **What's Coming:** Continued improvements to German translation accuracy, and additional language packs (Russian, French, Spanish, Portuguese, Italian, Polish, Dutch, Swedish) in future releases
- **Feedback Welcome:** Bug reports and translation suggestions are appreciated during this beta period

Please note that translation quality may vary and some messages may not translate if confidence is too low (by design to avoid incorrect translations).

---

## 📖 Overview

**What Did They Say?** is a gameplay-focused communication aid for World of Warcraft Classic. Unlike general-purpose translators, this addon is specifically designed to help players coordinate in groups, whisper, and communicate across language barriers during gameplay.

**Currently in beta** - **Only German (de → en) translation is currently available.** Placeholder language packs are visible in the UI but greyed out until implemented in future releases.

### Key Features

- ✅ **No External Services** - All translation logic runs locally in-game, no external APIs or translation services needed
- ✅ **Dependency Parsing** - Structure-based translation using dependency trees for more accurate word order and grammar (v0.5.0)
- ✅ **Automated Processing** - Automatically translates messages when confidence is sufficient
- ✅ **Intent Detection** - Understands player intent (LFG, invites, ready status, etc.)
- ✅ **Safe & Conservative** - Stays quiet when confidence is low to avoid wrong translations
- ✅ **Performance Optimized** - Translation caching and message throttling prevent lag
- ✅ **Configurable** - Choose which chat channels to translate
- ✅ **Titan Panel Support** - Optional integration with Titan Panel for status display (see [Known Issues](#-troubleshooting) for cosmetic warning note)

### Design Philosophy

This addon is focused on providing **the best translation possible**. It prioritizes clarity and accuracy, stays silent when confidence is low to avoid incorrect translations, and works quietly in the background without disrupting gameplay.

---

## 🌐 Supported Languages

**⚠️ IMPORTANT:** **Only German (de → en) is currently available and functional.**

The addon includes placeholder language packs for Russian, French, Spanish, Portuguese, Italian, Polish, Dutch, and Swedish in the UI, but these are **not yet implemented** and are greyed out. They will be available in future releases after German translation is fully polished.

| Language | Status | Direction |
|----------|--------|-----------|
| German (de) | ✅ **Available - Beta** | de → en |
| Russian (ru) | ⏳ Coming Soon | ru → en |
| French (fr) | ⏳ Coming Soon | fr → en |
| Spanish (es) | ⏳ Coming Soon | es → en |
| Portuguese (pt) | ⏳ Coming Soon | pt → en |
| Italian (it) | ⏳ Coming Soon | it → en |
| Polish (pl) | ⏳ Coming Soon | pl → en |
| Dutch (nl) | ⏳ Coming Soon | nl → en |
| Swedish (sv) | ⏳ Coming Soon | sv → en |

**Current German Translation Status:**
- ✅ Core vocabulary and common phrases
- ✅ Intent detection (LFG, invites, ready status)
- ✅ Pattern matching for common structures
- ✅ Dependency parsing for structure-based translation (v0.5.0)
- 🚧 Ongoing vocabulary expansion based on real-world usage
- 🚧 Grammar refinements and edge case handling

For detailed technical information, see the [Technical Details](https://github.com/RossNicholson/WhatDidTheySay/wiki/Technical-Details) wiki page.

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
3. **Display** - If confidence ≥ 0.50, translation is automatically shown
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

For detailed technical architecture, translation pipeline, and performance details, see the [Technical Details](https://github.com/RossNicholson/WhatDidTheySay/wiki/Technical-Details) wiki page.

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

### Titan Panel Warning?

- ⚠️ If you see a "Plugin 'WDTS' already loaded" error message from Titan Panel, this is a **cosmetic issue only** - the addon functionality works correctly. The Titan Panel button will appear and function normally. See [Issue #1](../../issues/1) for details.

---

## 🤝 Contributing

Contributions are welcome! See the [Contributing Guide](https://github.com/RossNicholson/WhatDidTheySay/wiki/Contributing) for details on how to add new languages, report issues, and submit pull requests.

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📚 Version History

For detailed version history and changelog, see the [Version History](https://github.com/RossNicholson/WhatDidTheySay/wiki/Version-History) wiki page.

**Recent Highlights:**
- **v0.5.0**: Dependency parsing for structure-based translation, complex sentence support
- **v0.4.0**: Major vocabulary expansion (4,400+ entries), engine improvements
- **v0.3.0**: Continued translation accuracy improvements

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

## 📚 Documentation

- **[Wiki Home](https://github.com/RossNicholson/WhatDidTheySay/wiki)** - Complete documentation and guides
- **[Installation Guide](https://github.com/RossNicholson/WhatDidTheySay/wiki/Installation)** - How to install and set up
- **[User Guide](https://github.com/RossNicholson/WhatDidTheySay/wiki/User-Guide)** - How to use the addon in-game
- **[Configuration Guide](https://github.com/RossNicholson/WhatDidTheySay/wiki/Configuration)** - Detailed configuration options
- **[Troubleshooting](https://github.com/RossNicholson/WhatDidTheySay/wiki/Troubleshooting)** - Common issues and solutions
- **[FAQ](https://github.com/RossNicholson/WhatDidTheySay/wiki/FAQ)** - Frequently asked questions

---

## 📞 Support & Issues

- **GitHub Issues**: [Report bugs or request features](../../issues)
- **GitHub Discussions**: [Ask questions or share feedback](../../discussions)

---

*Made with ❤️ for the WoW Classic community*

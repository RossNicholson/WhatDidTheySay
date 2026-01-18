# Releases

Current release information and download links for **What Did They Say?**.

---

## 🎯 Current Release

### Version 0.6.0 (Beta)

**Release Date:** January 2025  
**Status:** ⚠️ Beta - Actively under development  
**Interface Version:** 11508  
**WoW Classic Build:** 1.15.8 (65300)

#### Download

- **GitHub Releases:** [Download v0.6.0](https://github.com/RossNicholson/WhatDidTheySay/releases/latest)
- **Source Code:** Clone from [GitHub Repository](https://github.com/RossNicholson/WhatDidTheySay)

#### Quick Install

1. **Download** the latest release ZIP from GitHub
2. **Extract** the `WhatDidTheySay` folder
3. **Place** in your WoW Classic AddOns directory:
   - **Windows:** `World of Warcraft\_classic_era_\Interface\AddOns\WhatDidTheySay\`
   - **Mac:** `World of Warcraft/_classic_era_/Interface/AddOns/WhatDidTheySay/`
4. **Launch** WoW Classic and enable the addon in the AddOns menu

#### What's New in v0.6.0

**French Language Pack - Complete Implementation**

- ✅ **French Translation Support** - Full French → English translation (fr → en)
- ✅ **Comprehensive Vocabulary** - 2,756+ French vocabulary entries
- ✅ **Extensive Phrase Coverage** - 1,620+ multi-word phrases and expressions
- ✅ **Pattern Matching** - 1,380+ sentence patterns for complex structures
- ✅ **Grammar Rules** - 1,802 grammar rules for French-specific structures
- ✅ **100% Test Pass Rate** - All 150 comprehensive test cases passing
- ✅ **Real-World Chat Support** - Handles gaming abbreviations, emoticons, and English loanwords in French chat

For full details, see [Version History](Version-History#version-060).

---

## 📦 All Releases

### Version 0.6.0 (Beta) - Current

**Status:** ✅ Latest  
**Release Date:** January 2025

**Key Features:**
- French language pack - Complete implementation
- 2,756+ French vocabulary entries
- 1,620+ French phrases
- 1,380+ French patterns
- 1,802 French grammar rules
- 100% test pass rate (150/150 tests)
- Engine improvements for English gaming terms and emoticons

[Full Changelog](Version-History#version-060) | [Download](https://github.com/RossNicholson/WhatDidTheySay/releases/tag/v0.6.0)

---

### Version 0.5.0 (Beta)

**Release Date:** January 2025

**Key Features:**
- Dependency parsing for structure-based translation
- Support for complex sentences (relative, subordinate, questions)
- 5,410+ German vocabulary entries
- 2,267 phrase patterns
- 1,401 sentence structure patterns
- 3,067 grammar rules

[Full Changelog](Version-History#version-050) | [Download](https://github.com/RossNicholson/WhatDidTheySay/releases/tag/v0.5.0)

---

### Version 0.4.0 (Beta)

**Release Date:** January 2025

**Key Features:**
- Major translation engine improvements
- Compound word decomposition
- Sentence type detection
- Separable verb handling
- Verb conjugation recognition
- 600+ WoW-specific terms
- Enhanced context window (3-5 words)

[Full Changelog](Version-History#version-040) | [Download](https://github.com/RossNicholson/WhatDidTheySay/releases/tag/v0.4.0)

---

### Version 0.3.0 (Beta)

**Release Date:** December 2024

**Key Features:**
- Continued German translation improvements
- Enhanced translation accuracy
- Grammar rule refinements
- Confidence scoring adjustments

[Full Changelog](Version-History#version-030) | [Download](https://github.com/RossNicholson/WhatDidTheySay/releases/tag/v0.3.0)

---

### Version 0.2.0 (Beta)

**Release Date:** December 2024

**Key Features:**
- Guild chat support
- Titan Panel integration (optional)
- Testing commands (`/wdts test`, `/wdts debug`, etc.)
- Improved false positive protection
- Enhanced mixed-language detection

[Full Changelog](Version-History#version-020) | [Download](https://github.com/RossNicholson/WhatDidTheySay/releases/tag/v0.2.0)

---

### Version 0.1.0 (Beta)

**Release Date:** November 2024

**Key Features:**
- Initial stable release
- German → English translation support
- Automatic translation with confidence scoring
- Configurable channels and settings
- Translation caching and throttling
- Intent detection (LFG, invites, ready status)
- Protected token handling

[Full Changelog](Version-History#version-010) | [Download](https://github.com/RossNicholson/WhatDidTheySay/releases/tag/v0.1.0)

---

## 📋 System Requirements

### Minimum Requirements

- **World of Warcraft Classic** (Era version)
- **Client Build:** 1.15.8 (65300)
- **Interface Version:** 11508
- **Dependencies:** None

### Optional Dependencies

- **Titan Panel** - Optional integration for status display in Titan Panel bar

---

## 🔄 Update Instructions

### Updating from Previous Versions

1. **Backup Settings** (optional but recommended)
   - Your settings are stored in `WTF/Account/[AccountName]/SavedVariables/WhatDidTheySay.lua`
   - Consider backing up this file before updating

2. **Delete Old Version**
   - Remove the old `WhatDidTheySay` folder from your AddOns directory

3. **Install New Version**
   - Download and extract the latest release
   - Place in AddOns directory (see Quick Install above)

4. **Verify Installation**
   - Launch WoW Classic
   - Check AddOns menu - version should show v0.6.0
   - Your settings should be preserved automatically

### Settings Migration

Settings are automatically preserved between versions. However, if you encounter issues:

1. Check that `WhatDidTheySay.lua` exists in your SavedVariables folder
2. If addon doesn't load, delete SavedVariables and reconfigure
3. Report any migration issues on [GitHub Issues](https://github.com/RossNicholson/WhatDidTheySay/issues)

---

## 🐛 Known Issues

### Beta Version Limitations

- **Translation Quality May Vary** - Some messages may not translate if confidence is too low (by design)
- **Two Languages Available** - German (de → en) and French (fr → en) are fully functional
- **Placeholder Languages** - Other language packs (Spanish, Russian, Portuguese, etc.) are visible but not yet implemented

### Cosmetic Issues

- **Titan Panel Warning** - A "Plugin 'WDTS' already loaded" error message may appear. This is cosmetic only and does not affect functionality. See [Troubleshooting](Troubleshooting#titan-panel-warning) for details.

---

## 🚀 Upcoming Releases

### Planned for Future Versions

- **Additional Language Packs** - Spanish, Russian, Portuguese, Italian, Polish, Dutch, Swedish
- **Grammar Improvements** - Continued refinement of dependency parsing and grammar rules
- **Vocabulary Expansion** - Ongoing expansion based on real-world usage
- **Performance Optimizations** - Continued performance improvements

See [Version History](Version-History) for detailed changelog information.

---

## 📥 Download Options

### Recommended: GitHub Releases

**Best for:** Most users  
**Link:** [Latest Release](https://github.com/RossNicholson/WhatDidTheySay/releases/latest)  
**Format:** ZIP file with pre-configured folder structure  
**Update Frequency:** As new versions are released

### Advanced: Git Clone

**Best for:** Developers, contributors  
**Link:** [GitHub Repository](https://github.com/RossNicholson/WhatDidTheySay)  
**Command:** `git clone https://github.com/RossNicholson/WhatDidTheySay.git`  
**Update Frequency:** Real-time (development branch)

---

## ✅ Release Verification

### Verify Installation

After installing, verify your installation:

1. **In-Game Check:**
   - Type `/wdts` to open configuration
   - Check version number in Titan Panel (if installed)
   - Or type `/wdts test` to run test suite

2. **File Check:**
   - Ensure `WhatDidTheySay.toc` exists in the addon folder
   - Verify `Interface Version: 11508` in the `.toc` file matches your WoW version

3. **Functionality Check:**
   - Enable auto-translate in configuration
   - Join a channel with German or French speakers
   - Translations should appear automatically (green/yellow text)

---

## 📞 Support

### Getting Help

- **GitHub Issues:** [Report bugs or request features](https://github.com/RossNicholson/WhatDidTheySay/issues)
- **GitHub Discussions:** [Ask questions or share feedback](https://github.com/RossNicholson/WhatDidTheySay/discussions)
- **Wiki:** See [Troubleshooting](Troubleshooting) for common issues

### Reporting Issues

When reporting issues, please include:
- **Version:** What version are you running? (check with `/wdts` or Titan Panel)
- **WoW Version:** Interface version 11508?
- **Steps to Reproduce:** What were you doing when the issue occurred?
- **Error Messages:** Any Lua errors? (enable with `/console scriptErrors 1`)
- **Configuration:** What channels are enabled? What are your settings?

---

## 📝 Release Notes Format

Each release includes:
- **Version Number** - Semantic versioning (MAJOR.MINOR.PATCH)
- **Release Date** - When the release was published
- **Status** - Current status (Beta, Stable, etc.)
- **Key Features** - Major changes and additions
- **Full Changelog** - Link to detailed version history

For detailed technical changes, see [Version History](Version-History).

---

*Last Updated: January 2025 (v0.6.0)*

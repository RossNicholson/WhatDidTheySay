# Frequently Asked Questions

## General Questions

### What is "What Did They Say?"

**What Did They Say?** is a World of Warcraft Classic addon that translates chat messages from other languages (currently German) to English. All translation happens locally in-game - no external services or internet connection required.

### How does it work?

The addon uses a rule-based translation system with vocabulary dictionaries, phrase matching, and grammar rules. It detects the source language, translates word-by-word and phrase-by-phrase, then applies grammar corrections.

### Is it free?

Yes! The addon is completely free and open source under the MIT License.

### Does it work offline?

Yes! All translation logic runs locally in-game. No internet connection, external APIs, or translation services are required.

## Installation & Setup

### How do I install it?

See the [Installation Guide](Installation) for detailed steps. Quick version:
1. Download from [GitHub Releases](https://github.com/RossNicholson/WhatDidTheySay/releases)
2. Extract to `World of Warcraft\_classic_era_\Interface\AddOns\`
3. Enable in AddOns list
4. Configure with `/wdts`

### What version of WoW does it work with?

World of Warcraft Classic Era (Interface 11508, Client 1.15.8).

### Does it work with Classic Season of Discovery?

No, this addon is specifically for Classic Era. Season of Discovery may have different interface versions.

### Do I need other addons?

No dependencies required. Optional: Titan Panel for status display.

## Usage

### How do I open the configuration?

Type `/wdts` or `/whatdidtheysay` in chat.

### Which channels should I enable?

Recommended:
- **Always:** Whisper, Party, Guild
- **Usually:** Raid
- **Sometimes:** General, Trade (can be spammy)
- **Rarely:** Yell, World

### What do the colors mean?

- **🟢 Green** - High confidence, auto-displayed
- **🟡 Yellow** - Medium confidence, click to show
- **⚪ Hidden** - Low confidence, too uncertain

### Can I adjust how many translations show?

Yes! Increase the confidence threshold (default 0.50) to show fewer, more accurate translations. Decrease it to show more translations (but less accurate).

## Translation Quality

### How accurate is it?

Currently **94.1% test pass rate** for German translations. Accuracy depends on:
- Vocabulary coverage (2,200+ words)
- Message complexity
- Confidence threshold setting

### Why doesn't it translate some messages?

Possible reasons:
1. **Confidence too low** - Message is too uncertain
2. **Channel disabled** - Channel not enabled in config
3. **Not German** - Language not detected as German
4. **Already English** - Won't translate English messages

### Why are some translations wrong?

Translation errors can occur due to:
- Missing vocabulary
- Ambiguous context
- Complex grammar
- Typos or slang

**Solution:** Report the issue on GitHub with the original message and wrong translation.

### Can I help improve translations?

Yes! Report translation errors on [GitHub Issues](https://github.com/RossNicholson/WhatDidTheySay/issues). Include:
- Original German message
- Wrong translation
- Expected translation

## Language Support

### What languages are supported?

Currently:
- **German (de → en)** - Active development

Planned:
- French (fr → en)
- Spanish (es → en)
- Russian (ru → en)

### Can I add my own language?

Yes! See the [Language Packs](Language-Packs) guide for details. You'll need to create vocabulary, phrases, patterns, and grammar rules.

### Does it translate English to German?

No, currently only translates **to English**. All languages translate to English. Future versions may support bidirectional translation.

## Technical

### How does language detection work?

Uses three methods:
1. **Function words** - Common words like "der", "die", "das"
2. **Character hints** - German characters (ä, ö, ü, ß)
3. **Vocabulary fallback** - Checks if words exist in German vocabulary

### Why does it sometimes translate English messages?

This is a false positive. The addon tries to avoid this by:
- Requiring German function words or characters
- Excluding universal gaming abbreviations
- Using confidence thresholds

**If this happens:** Report it with the message so we can improve detection.

### Does it use machine learning?

No, it's a **rule-based system** using:
- Vocabulary dictionaries
- Pattern matching
- Grammar rules
- No neural networks or ML models

### How fast is it?

Very fast. Translations typically complete in < 1ms. Features:
- Translation caching (500 entries)
- Message throttling (10 per 2 seconds)
- Optimized lookup tables

### Does it impact performance?

Minimal impact. Optimizations include:
- Caching frequently translated messages
- Throttling during chat bursts
- Efficient data structures
- No per-frame updates

## Troubleshooting

### Translations not showing - help!

Check:
1. Channel enabled in config?
2. Confidence threshold too high?
3. Addon enabled in AddOns list?
4. Try `/wdts clearcache` and reload

See [Troubleshooting](Troubleshooting) guide for more.

### Getting Lua errors

Enable error display: `/console scriptErrors 1`

Check the error message and report on GitHub Issues with:
- Full error message
- When it occurs
- What you were doing

### Titan Panel warning message

This is **cosmetic only** - the addon works fine! The warning can be ignored. See [Issue #1](https://github.com/RossNicholson/WhatDidTheySay/issues/1).

### Settings not saving

Check:
1. WoW can write to SavedVariables folder
2. No file permission issues
3. Try deleting `WhatDidTheySayDB.lua` and reconfigure

## Contributing

### How can I contribute?

See the [Contributing](Contributing) guide. Ways to help:
- Report bugs
- Suggest features
- Add vocabulary
- Create language packs
- Improve documentation
- Fix translation errors

### Can I add words to the German vocabulary?

Yes! Either:
1. **Report on GitHub** - We'll add it
2. **Submit PR** - Add it yourself and submit pull request

### How do I create a language pack?

See the [Language Packs](Language-Packs) guide. You'll need:
- Vocabulary dictionary
- Phrases
- Patterns
- Grammar rules
- Intent detection

## Miscellaneous

### Is it updated regularly?

Yes, the addon is actively maintained. Check [GitHub Releases](https://github.com/RossNicholson/WhatDidTheySay/releases) for updates.

### Can I use it on multiple characters?

Yes, settings are saved per-account and work across all characters.

### Does it work in all chat channels?

Yes, but you control which channels are translated in the configuration.

### Can I disable it temporarily?

Yes, uncheck it in the AddOns list, or disable auto-translate and use manual mode.

### Is there a mobile version?

No, this is a WoW Classic addon only. It requires the WoW Lua API to function.

### Can I modify it for my own use?

Yes! MIT License allows modification. However, we encourage contributing improvements back to the project.

## Support

### Where do I get help?

- **[GitHub Issues](https://github.com/RossNicholson/WhatDidTheySay/issues)** - Bug reports
- **[GitHub Discussions](https://github.com/RossNicholson/WhatDidTheySay/discussions)** - Questions
- **[Troubleshooting Guide](Troubleshooting)** - Common issues

### How do I report a bug?

1. Check if issue already exists
2. Create new issue with:
   - Description
   - Steps to reproduce
   - Expected vs actual behavior
   - `/wdts debug` output if relevant

### Can I request a feature?

Yes! Create a [GitHub Discussion](https://github.com/RossNicholson/WhatDidTheySay/discussions) or check ENHANCEMENTS.md for planned features.

## Next Steps

- **[Installation Guide](Installation)** - Get started
- **[User Guide](User-Guide)** - Learn to use it
- **[Troubleshooting](Troubleshooting)** - Fix issues
- **[Technical Details](Technical-Details)** - Learn how it works

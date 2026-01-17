# Installation Guide

## 📥 Download

### Option 1: GitHub Releases (Recommended)

1. Go to the [Releases page](https://github.com/RossNicholson/WhatDidTheySay/releases)
2. Download the latest release (currently **v0.4.0**)
3. Extract the ZIP file

### Option 2: Clone Repository

```bash
git clone https://github.com/RossNicholson/WhatDidTheySay.git
```

## 📁 Installation Steps

### For World of Warcraft Classic

1. **Locate your WoW Classic AddOns folder:**
   - **Windows**: `World of Warcraft\_classic_era_\Interface\AddOns\`
   - **Mac**: `/Applications/World of Warcraft/_classic_era_/Interface/AddOns/`
   - **Linux**: `~/.wine/drive_c/Program Files/World of Warcraft/_classic_era_/Interface/AddOns/`

2. **Copy the addon folder:**
   - Extract or copy the `WhatDidTheySay` folder into your AddOns directory
   - The path should be: `AddOns/WhatDidTheySay/WhatDidTheySay.toc`

3. **Verify installation:**
   - Your folder structure should look like this:
     ```
     AddOns/
     └── WhatDidTheySay/
         ├── WhatDidTheySay.toc
         ├── WhatDidTheySay.lua
         ├── Core/
         ├── Languages/
         └── UI/
     ```

## ✅ First Launch

1. **Launch World of Warcraft Classic**

2. **Check AddOns list:**
   - At the character select screen, click **"AddOns"** button
   - Verify **"What Did They Say?"** appears and is checked/enabled
   - Interface version should show **11508**

3. **Log into game**

4. **Configure the addon:**
   - Type `/wdts` to open the configuration window
   - Enable the chat channels you want translated (Guild, Party, Whisper, etc.)
   - Adjust confidence threshold if needed (default: 0.50)

5. **Test it:**
   - If you're in a German guild or have German-speaking friends, you should see translations appear automatically
   - Translations appear as colored text in chat (green for high confidence, yellow for medium)

## 🔧 Optional: Titan Panel Integration

If you have **Titan Panel** installed:

1. The addon will automatically detect it
2. A status indicator will appear in your Titan Panel bar
3. You may see a cosmetic warning message - this is harmless and can be ignored (see [Troubleshooting](Troubleshooting#titan-panel-warning))

## 📋 Verification Checklist

- [ ] Addon appears in AddOns list
- [ ] Addon is enabled (checkbox checked)
- [ ] Interface version matches (11508)
- [ ] No Lua errors in chat on login
- [ ] `/wdts` command opens configuration window
- [ ] Chat channels are enabled in config

## ❌ Troubleshooting Installation

### Addon doesn't appear in AddOns list

- Check that the folder is named exactly `WhatDidTheySay` (case-sensitive)
- Verify `WhatDidTheySay.toc` exists in the folder
- Ensure you're in the correct WoW Classic Era folder (not retail or Classic Season)

### Interface version mismatch

- The addon is built for **Interface 11508** (Classic Era 1.15.8)
- If you see a version mismatch, you may need to:
  - Update your WoW Classic client
  - Or wait for an addon update if Blizzard changed the interface version

### Lua errors on load

- Enable Lua error display: `/console scriptErrors 1`
- Check the error message - it will tell you which file has the issue
- Common causes:
  - Corrupted download (re-download)
  - Missing files (check folder structure)
  - Conflicting addon (disable other addons to test)

## 🔄 Updating

1. **Back up your settings** (optional):
   - Settings are stored in `WTF/Account/[AccountName]/SavedVariables/WhatDidTheySayDB.lua`

2. **Download the new version**

3. **Replace the old folder** with the new one

4. **Reload UI** (`/reload`) or restart the game

5. **Settings are preserved** automatically

## 📦 File Structure

```
WhatDidTheySay/
├── WhatDidTheySay.toc          # Addon manifest
├── WhatDidTheySay.lua          # Main entry point
├── Core/                       # Core translation engine
│   ├── Engine.lua
│   ├── Tokenizer.lua
│   ├── LanguageDetect.lua
│   ├── Confidence.lua
│   ├── GermanMorphology.lua
│   ├── LanguagePackManager.lua
│   └── ChatHooks.lua
├── Languages/                  # Language packs
│   ├── en/                     # English (target)
│   └── de/                     # German (source)
│       ├── tokens.lua
│       ├── phrases.lua
│       ├── patterns.lua
│       ├── grammar.lua
│       └── intents.lua
└── UI/                         # User interface
    ├── Config.lua
    ├── Widgets.lua
    └── TitanPanel.lua
```

## 🎮 Next Steps

- **[User Guide](User-Guide)** - Learn how to use the addon
- **[Configuration](Configuration)** - Customize settings
- **[Troubleshooting](Troubleshooting)** - Fix common issues

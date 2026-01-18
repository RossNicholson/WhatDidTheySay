# What Did They Say? v0.7.0 Release Notes

## 🎉 Major Feature: WoW Abbreviations Language Pack

We're excited to introduce a **separate language pack for WoW gaming abbreviations**! This allows users to enable/disable abbreviation expansion independently from foreign language translation.

### ✨ New Features

#### **WoW Abbreviations → English Translation**
- **New Language Pack:** `wow` - Separate, toggleable language pack for gaming abbreviations
- **Independent Control:** Enable/disable abbreviation expansion separately from foreign languages
- **Auto-Detection:** Automatically expands abbreviations when 30%+ of words are WoW abbreviations
- **Explicit Activation:** Can be activated with `sourceLang="wow"`

#### **Comprehensive Abbreviation Coverage**
- **LFG/LFM:** LF → Looking for, LFM → Looking for more, LF1M-4M → Looking for 1-4 more
- **Trading:** WTS → Want to sell, WTB → Want to buy, WTT → Want to trade
- **Classes:** War/Warr → Warrior, Mage → Mage, Rog → Rogue, Hunt → Hunter, etc.
- **Roles:** Tank, Heal/Healer, DPS, MT → Main tank, OT → Off tank
- **Dungeons:** All Classic Era dungeons (DM, BFD, SFK, RFK, RFD, Gnomer, Uldaman, ZF, Mara, Scholo, Strat, BRD, UBRS, LBRS)
- **Raids:** MC → Molten Core, Ony → Onyxia's Lair, BWL → Blackwing Lair, ZG → Zul'Gurub, AQ → Ahn'Qiraj, Naxx → Naxxramas
- **Cities:** SW → Stormwind, Org → Orgrimmar, IF → Ironforge, Darna → Darnassus, TB → Thunder Bluff, UC → Undercity
- **Actions:** Inv → Invite, Summon, Port → Portal, Res → Resurrect, Pull
- **Status:** AFK → Away from keyboard, BRB → Be right back, Ty → Thank you, NP → No problem, Sry → Sorry
- **Items/Currency:** G → Gold, S → Silver, C → Copper, Bags, Mounts
- **Combat:** CC → Crowd control, Add → Additional enemy, Aggro, AOE → Area of effect, DOT → Damage over time, HOT → Heal over time
- **Professions:** Alch → Alchemy, BS → Blacksmithing, Ench → Enchanting, Eng → Engineering, Herb → Herbalism, LW → Leatherworking, Tailor → Tailoring
- **And much more!**

#### **Examples:**
- `"LF 1 tank strat ud"` → `"Looking for 1 tank Stratholme Undead side"`
- `"WTS [Large Green Bag] 5g"` → `"Want to sell [Large green Bag] 5 gold"`
- `"AFK brb 5 min"` → `"away from keyboard be right back 5 minutes"`
- `"LFM 2 dps for UBRS"` → `"Looking for more 2 dps for Upper Blackrock Spire"`

### 🔧 Technical Improvements

- **Smart Detection:** WoW pack only activates for English messages (skips if foreign language characters detected)
- **Non-Interfering:** Doesn't interfere with foreign language translation
- **Grammar Rules:** Post-processing rules for correct article usage, capitalization, and pluralization
- **Pattern Matching:** Complex abbreviation patterns (e.g., "LF 1M tank", "WTS item 50g")

### 📝 Configuration

The WoW Abbreviations language pack can be enabled/disabled independently from other language packs in the addon configuration. Users can:
- Enable WoW pack for abbreviation expansion
- Enable foreign language packs (German, French, etc.) for translation
- Use both together - abbreviations expand, foreign languages translate

### 🐛 Bug Fixes

- Fixed duplicate expansion issues (e.g., "Stratholme Stratholme" → "Stratholme")
- Fixed "dps" expansion in context (keeps as "dps" when used as role abbreviation)
- Fixed spacing issues with currency and item names

### 📊 Statistics

- **New Language Pack:** 1 (WoW Abbreviations)
- **Total Tokens:** ~150+ abbreviations
- **Total Phrases:** ~30+ multi-word abbreviations
- **Total Patterns:** ~10 complex abbreviation patterns
- **Total Grammar Rules:** ~20 post-processing rules

---

**Version:** 0.7.0  
**Release Date:** 2024  
**Author:** Ross Nicholson

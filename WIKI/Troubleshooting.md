# Troubleshooting Guide

## 🔧 Common Issues

### Translations Not Showing

**Symptoms:**
- German messages appear but no translation
- No colored text in chat

**Possible Causes & Solutions:**

1. **Channel Not Enabled**
   - ✅ Open config (`/wdts`)
   - ✅ Check that the channel is enabled
   - ✅ Apply changes

2. **Confidence Too Low**
   - ✅ Lower confidence threshold (try 0.30)
   - ✅ Check with `/wdts debug` to see confidence scores
   - ✅ Some messages are intentionally hidden if too uncertain

3. **Language Not Detected**
   - ✅ Message might not be German
   - ✅ Mixed-language messages may not trigger
   - ✅ Very short messages may not detect

4. **Addon Disabled**
   - ✅ Check AddOns list at character select
   - ✅ Ensure "What Did They Say?" is checked

5. **Cache Issues**
   - ✅ Try `/wdts clearcache`
   - ✅ Reload UI (`/reload`)

### Wrong Translations

**Symptoms:**
- Translation appears but is incorrect
- Words are translated wrong

**Solutions:**

1. **Clear Cache**
   ```
   /wdts clearcache
   /reload
   ```

2. **Check Confidence**
   - Low confidence = less reliable
   - Increase threshold to 0.70 for more accuracy

3. **Report the Issue**
   - Use `/wdts debug` to get details
   - Report on GitHub Issues with:
     - Original message
     - Wrong translation
     - Expected translation

### Too Many Translations / Spam

**Symptoms:**
- Chat flooded with translations
- Too many yellow/green messages

**Solutions:**

1. **Increase Confidence Threshold**
   - Set to 0.70 or higher
   - Only very confident translations shown

2. **Disable Spam Channels**
   - Disable General, Trade, World channels
   - Only enable Whisper, Party, Guild

3. **Disable Auto-Translate**
   - Manual mode - click to show translations
   - Reduces chat clutter

### Addon Not Loading

**Symptoms:**
- Addon doesn't appear in AddOns list
- Lua errors on load

**Solutions:**

1. **Check Installation**
   - Verify folder structure is correct
   - Path: `AddOns/WhatDidTheySay/WhatDidTheySay.toc`
   - Ensure all files are present

2. **Check Interface Version**
   - Addon requires Interface 11508
   - Update WoW Classic if version mismatch

3. **Enable Lua Errors**
   ```
   /console scriptErrors 1
   ```
   - Reload UI
   - Check error messages

4. **Check for Conflicts**
   - Disable other addons
   - Test if addon loads
   - Re-enable addons one by one

### Performance Issues / Lag

**Symptoms:**
- Game stuttering
- FPS drops
- UI freezes

**Solutions:**

1. **Disable High-Traffic Channels**
   - Disable General, Trade, World
   - These channels have high message volume

2. **Increase Confidence Threshold**
   - Fewer translations = less processing
   - Set to 0.70 or higher

3. **Clear Cache**
   ```
   /wdts clearcache
   ```
   - Cache can grow large
   - Clearing helps performance

4. **Disable Auto-Translate for Some Channels**
   - Use manual mode for low-priority channels
   - Reduces processing load

### Titan Panel Warning

**Symptoms:**
```
Titan: Error: Error Registering Plugin:
name: 'WDTS'
issue: 'Plugin 'WDTS' already loaded...'
```

**Solution:**
- ✅ **This is a cosmetic warning only**
- ✅ Addon functionality works correctly
- ✅ Titan Panel button appears and works
- ✅ Can be safely ignored
- ✅ See [Issue #1](https://github.com/RossNicholson/WhatDidTheySay/issues/1) for details

### Language Detection Issues

**Symptoms:**
- English messages being translated
- German messages not detected

**Solutions:**

1. **Check Language Detection**
   - Use `/wdts debug` to see detection results
   - Check confidence scores

2. **Report False Positives**
   - Report on GitHub Issues
   - Include:
     - Original message
     - Detected language
     - Why it's wrong

3. **Mixed-Language Messages**
   - Messages with lots of English may not detect as German
   - This is by design to prevent false positives

### Translation Cache Issues

**Symptoms:**
- Old/wrong translations appearing
- Translations not updating

**Solutions:**

1. **Clear Cache**
   ```
   /wdts clearcache
   /reload
   ```

2. **Check Cache Size**
   - Cache limited to 500 entries
   - Oldest entries auto-removed
   - Clearing helps if stuck

### Configuration Not Saving

**Symptoms:**
- Settings reset on reload
- Changes don't persist

**Solutions:**

1. **Check File Permissions**
   - Ensure WoW can write to SavedVariables folder
   - Check `WTF/Account/[AccountName]/SavedVariables/`

2. **Check for Conflicts**
   - Other addons may interfere
   - Disable other addons to test

3. **Manual Backup**
   - Backup `WhatDidTheySayDB.lua`
   - Restore if needed

## 🐛 Debugging Commands

### View Translation History

```
/wdts debug
```

Shows:
- Recent translation attempts
- Confidence scores
- Intent detection results
- Failed translations

### Clear Cache

```
/wdts clearcache
```

Clears translation cache (500 entry limit).

### Test Translation

```
/wdts test
```

Runs test translations with sample messages.

### Clear History

```
/wdts clear
```

Clears translation history (debug info only).

## 📋 Diagnostic Checklist

Before reporting an issue, check:

- [ ] Addon is enabled in AddOns list
- [ ] Interface version matches (11508)
- [ ] Channel is enabled in config
- [ ] Confidence threshold is appropriate
- [ ] Cache cleared (`/wdts clearcache`)
- [ ] UI reloaded (`/reload`)
- [ ] Lua errors checked (`/console scriptErrors 1`)
- [ ] Other addons disabled (to test conflicts)

## 📞 Getting Help

### GitHub Issues

Report bugs or request features:
- [GitHub Issues](https://github.com/RossNicholson/WhatDidTheySay/issues)
- Include:
  - Description of issue
  - Steps to reproduce
  - Expected vs actual behavior
  - `/wdts debug` output if relevant

### GitHub Discussions

Ask questions or get help:
- [GitHub Discussions](https://github.com/RossNicholson/WhatDidTheySay/discussions)
- For:
  - General questions
  - Usage help
  - Feature suggestions

### Bug Report Template

```markdown
**Description:**
[Clear description of the issue]

**Steps to Reproduce:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Expected Behavior:**
[What should happen]

**Actual Behavior:**
[What actually happens]

**Configuration:**
- Confidence Threshold: [value]
- Channels Enabled: [list]
- Auto-Translate: [enabled/disabled]

**Debug Output:**
```
/wdts debug output here
```

**Additional Info:**
- WoW Version: [version]
- Interface Version: [version]
- Other Addons: [list if relevant]
```

## 🔍 Advanced Debugging

### Enable Verbose Logging

Currently not available, but planned for future versions.

### Check Translation Pipeline

Use `/wdts debug` to see:
- Tokenization results
- Language detection
- Confidence calculation
- Intent detection

### Test Language Detection

Create test messages:
- Pure German: Should detect as German
- Pure English: Should not translate
- Mixed: May or may not detect

## 📝 Next Steps

- **[User Guide](User-Guide)** - How to use the addon
- **[Configuration](Configuration)** - Settings explained
- **[FAQ](FAQ)** - Common questions

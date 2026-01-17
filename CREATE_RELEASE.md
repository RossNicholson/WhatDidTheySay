# How to Create v0.5.0 GitHub Release

The v0.5.0 tag already exists and has been pushed to GitHub. To create the GitHub release:

## Option 1: GitHub Web Interface (Recommended)

1. Go to: https://github.com/RossNicholson/WhatDidTheySay/releases/new

2. **Tag version**: Select `v0.5.0` from the dropdown (or type `v0.5.0`)

3. **Release title**: `v0.5.0 - Dependency Parsing`

4. **Description**: Copy and paste the content from `RELEASE_NOTES_v0.5.0.md`

5. **Check "Set as the latest release"** (this will make it the latest/pre-release)

6. Click **"Publish release"**

## Option 2: GitHub CLI (if installed)

```bash
gh release create v0.5.0 --title "v0.5.0 - Dependency Parsing" --notes-file RELEASE_NOTES_v0.5.0.md --latest
```

## Verification

After creating the release, verify:
- Visit: https://github.com/RossNicholson/WhatDidTheySay/releases
- v0.5.0 should appear as the latest release
- The release should show the full release notes

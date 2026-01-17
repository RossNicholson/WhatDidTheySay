# Wiki Documentation

This folder contains all wiki pages for the GitHub wiki.

## 📋 Pages Created

1. **Home.md** - Main wiki landing page with overview
2. **Installation.md** - Complete installation instructions
3. **User-Guide.md** - How to use the addon in-game
4. **Configuration.md** - Configuration options explained
5. **Language-Packs.md** - Guide for adding new languages
6. **Troubleshooting.md** - Common issues and solutions
7. **Technical-Details.md** - Architecture and implementation details
8. **Contributing.md** - How to contribute to the project
9. **FAQ.md** - Frequently asked questions

## 🚀 How to Upload to GitHub Wiki

### Option 1: GitHub Web Interface (Easiest)

1. Go to your repository: https://github.com/RossNicholson/WhatDidTheySay
2. Click on **"Wiki"** tab (if not visible, enable it in repository settings)
3. Click **"New Page"** for each file
4. Copy/paste content from the corresponding `.md` file
5. Name the page (e.g., "Home" for Home.md)
6. Save

### Option 2: Git Clone Wiki (Advanced)

GitHub wikis are git repositories:

```bash
# Clone the wiki repository
git clone https://github.com/RossNicholson/WhatDidTheySay.wiki.git

# Copy files from WIKI/ folder
cp WIKI/*.md .

# Commit and push
git add *.md
git commit -m "Add wiki documentation"
git push origin master
```

### Option 3: GitHub API (Automated)

Use GitHub API to create pages programmatically (requires authentication).

## 📝 Page Order

Recommended order for navigation:
1. Home (should be the default/wiki landing page)
2. Installation
3. User Guide
4. Configuration
5. Troubleshooting
6. FAQ
7. Language Packs
8. Technical Details
9. Contributing

## ✅ Checklist

- [ ] Enable Wiki in repository settings
- [ ] Upload Home.md (set as front page)
- [ ] Upload all other pages
- [ ] Verify all internal links work
- [ ] Test navigation
- [ ] Update README.md to link to wiki

## 🔗 Linking from README

Add this to your README.md:

```markdown
## 📚 Documentation

- **[Wiki Home](https://github.com/RossNicholson/WhatDidTheySay/wiki)** - Complete documentation
- **[Installation Guide](https://github.com/RossNicholson/WhatDidTheySay/wiki/Installation)** - How to install
- **[User Guide](https://github.com/RossNicholson/WhatDidTheySay/wiki/User-Guide)** - How to use
- **[FAQ](https://github.com/RossNicholson/WhatDidTheySay/wiki/FAQ)** - Common questions
```

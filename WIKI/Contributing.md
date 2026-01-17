# Contributing

Thank you for your interest in contributing to **What Did They Say?**! Contributions are welcome and appreciated.

## 🤝 How to Contribute

### Reporting Bugs

1. **Check Existing Issues**
   - Search [GitHub Issues](https://github.com/RossNicholson/WhatDidTheySay/issues)
   - Avoid duplicates

2. **Create New Issue**
   - Use bug report template
   - Include:
     - Description
     - Steps to reproduce
     - Expected vs actual behavior
     - Debug output (`/wdts debug`)

3. **Provide Details**
   - WoW version
   - Interface version
   - Configuration settings
   - Sample messages

### Suggesting Features

1. **Check Existing Ideas**
   - Search [GitHub Discussions](https://github.com/RossNicholson/WhatDidTheySay/discussions)
   - Check ENHANCEMENTS.md

2. **Create Discussion**
   - Explain the feature
   - Describe use case
   - Discuss implementation

3. **Wait for Feedback**
   - Maintainer will review
   - May request clarification
   - May approve or suggest alternatives

### Contributing Code

#### Getting Started

1. **Fork Repository**
   ```
   https://github.com/RossNicholson/WhatDidTheySay
   ```

2. **Clone Your Fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/WhatDidTheySay.git
   cd WhatDidTheySay
   ```

3. **Create Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

4. **Make Changes**
   - Follow code style
   - Add tests if applicable
   - Update documentation

5. **Test Changes**
   - Load addon in-game
   - Test functionality
   - Verify no errors

6. **Commit Changes**
   ```bash
   git add .
   git commit -m "Description of changes"
   ```

7. **Push to Fork**
   ```bash
   git push origin feature/your-feature-name
   ```

8. **Create Pull Request**
   - Use PR template
   - Describe changes
   - Link related issues

## 📋 Contribution Guidelines

### Code Style

- **Indentation:** 4 spaces (not tabs)
- **Line Length:** Keep under 120 characters when possible
- **Naming:** camelCase for functions, PascalCase for modules
- **Comments:** Explain why, not what
- **Structure:** Follow existing patterns

### File Organization

```
WhatDidTheySay/
├── Core/              # Core engine logic
├── Languages/         # Language packs
├── UI/                # User interface
└── WhatDidTheySay.lua # Main entry point
```

### Testing Requirements

- **In-Game Testing:** Always test changes in-game
- **Error Handling:** Test error cases
- **Edge Cases:** Test boundary conditions
- **Performance:** Verify no performance regression

### Documentation

- **Code Comments:** Explain complex logic
- **README Updates:** Update if adding features
- **Wiki Updates:** Update relevant wiki pages
- **Changelog:** Document changes

## 🎯 Contribution Areas

### High Priority

1. **Additional Language Packs**
   - French, Spanish, Russian
   - See [Language Packs](Language-Packs) guide

2. **Vocabulary Expansion**
   - Add missing German words
   - Add WoW-specific terms
   - Improve phrase coverage

3. **Bug Fixes**
   - Translation errors
   - Language detection issues
   - Performance problems

### Medium Priority

1. **Grammar Improvements**
   - Better word order rules
   - More natural translations
   - Context handling

2. **UI Enhancements**
   - Better configuration UI
   - Translation history window
   - Statistics display

3. **Testing**
   - More test cases
   - Automated testing
   - Test coverage

### Lower Priority

1. **Documentation**
   - Wiki improvements
   - Code documentation
   - User guides

2. **Code Refactoring**
   - Performance optimization
   - Code cleanup
   - Architecture improvements

## 🔍 Review Process

### Pull Request Review

1. **Automated Checks**
   - Code compiles
   - No syntax errors
   - Basic validation

2. **Manual Review**
   - Code quality
   - Testing
   - Documentation
   - Fit with project goals

3. **Feedback**
   - Reviewer provides feedback
   - Address requested changes
   - Update PR

4. **Approval**
   - Maintainer approves
   - Changes merged
   - Credit given

### Review Criteria

- ✅ Code works correctly
- ✅ Follows style guidelines
- ✅ Includes tests
- ✅ Documentation updated
- ✅ No breaking changes (unless intentional)
- ✅ Performance acceptable

## 📝 Pull Request Template

```markdown
## Description
[Clear description of changes]

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Language pack
- [ ] Documentation
- [ ] Refactoring

## Testing
- [ ] Tested in-game
- [ ] No Lua errors
- [ ] Performance acceptable
- [ ] Edge cases handled

## Checklist
- [ ] Code follows style guidelines
- [ ] Comments added for complex logic
- [ ] Documentation updated
- [ ] Tests added/updated
- [ ] No breaking changes (or documented)

## Related Issues
Closes #XXX
```

## 🌍 Adding a New Language Pack

See [Language Packs](Language-Packs) for detailed guide.

**Quick Steps:**
1. Create language folder
2. Add required files (tokens, phrases, patterns, grammar, intents)
3. Add function words to LanguageDetect.lua
4. Update WhatDidTheySay.toc
5. Test thoroughly
6. Submit PR

## 🐛 Fixing Translation Issues

### Adding Missing Words

1. **Identify Missing Word**
   - User report
   - Test failure
   - Debug output

2. **Add to tokens.lua**
   ```lua
   ["word"] = "translation",
   ```

3. **Test Translation**
   - Verify word translates correctly
   - Check in context

4. **Commit & PR**

### Improving Grammar Rules

1. **Identify Problem**
   - Wrong word order
   - Missing corrections

2. **Add Grammar Rule**
   ```lua
   {
       from = "wrong order",
       to = "correct order",
       priority = 10,
   }
   ```

3. **Test Rule**
   - Verify fixes the issue
   - Check doesn't break other translations

4. **Commit & PR**

## 💡 Ideas for Contribution

### User-Facing Features

- Custom vocabulary (user-defined words)
- Per-channel confidence thresholds
- Translation history UI window
- Export/import settings
- Per-character settings
- Translation statistics

### Developer Features

- Better test suite
- Automated testing
- Performance profiling
- Debug logging
- Code coverage tools

### Language Packs

- French (fr → en)
- Spanish (es → en)
- Russian (ru → en)
- Portuguese (pt → en)
- Italian (it → en)

## 📚 Resources

### Documentation

- **[Wiki Home](Home)** - Main wiki page
- **[Technical Details](Technical-Details)** - How it works
- **[Language Packs](Language-Packs)** - Adding languages

### Code

- **[GitHub Repository](https://github.com/RossNicholson/WhatDidTheySay)**
- **[Issues](https://github.com/RossNicholson/WhatDidTheySay/issues)**
- **[Discussions](https://github.com/RossNicholson/WhatDidTheySay/discussions)**

## 🙏 Recognition

Contributors will be:
- Credited in README
- Listed in release notes
- Acknowledged in commits

## ❓ Questions?

- **GitHub Discussions** - General questions
- **GitHub Issues** - Bug reports, feature requests
- **Pull Request Comments** - Code-specific questions

## 📋 Next Steps

1. **Fork the repository**
2. **Pick an area to contribute**
3. **Read relevant documentation**
4. **Make your changes**
5. **Submit a pull request**

Thank you for contributing! 🎉

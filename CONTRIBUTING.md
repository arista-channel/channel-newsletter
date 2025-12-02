# Contributing to Channel Newsletter

Thank you for contributing to the Arista Channel Newsletter! This document provides guidelines for contributing to this project.

## 🛡️ Branch Protection

The `main` branch is protected to ensure quality and prevent unintentional changes. All changes must go through a Pull Request (PR) process.

### Protected Branch Rules

- ✅ **Pull Request Required**: Direct commits to `main` are blocked
- ✅ **Review Required**: At least 1 approval needed before merging
- ✅ **Status Checks**: CI/CD workflow must pass
- ✅ **Linear History**: Merge commits are not allowed (use squash or rebase)
- ✅ **No Force Push**: Force pushes to `main` are blocked
- ✅ **No Deletion**: The `main` branch cannot be deleted

## 🔄 Contribution Workflow

### 1. Create a Feature Branch

```bash
# Update your local main branch
git checkout main
git pull origin main

# Create a new feature branch
git checkout -b feature/your-feature-name
# or for newsletter content:
git checkout -b content/month-year
# or for bug fixes:
git checkout -b fix/issue-description
```

### 2. Make Your Changes

```bash
# Make your changes to the files
# Test locally
mkdocs serve

# Stage your changes
git add .

# Commit with a descriptive message
git commit -m "✨ Add new feature: description"
```

### 3. Push Your Branch

```bash
# Push your feature branch to GitHub
git push origin feature/your-feature-name
```

### 4. Create a Pull Request

1. Go to https://github.com/arista-channel/channel-newsletter
2. Click "Pull requests" → "New pull request"
3. Select your branch
4. Fill out the PR template
5. Request review from @mbalagot12
6. Wait for approval and CI checks to pass

### 5. Merge Your PR

Once approved and all checks pass:
- Use **"Squash and merge"** (preferred) or **"Rebase and merge"**
- Delete your feature branch after merging

## 📝 Commit Message Guidelines

Use conventional commit format:

- `✨ feat:` New feature
- `🐛 fix:` Bug fix
- `📝 docs:` Documentation changes
- `🎨 style:` Formatting changes
- `♻️ refactor:` Code refactoring
- `🧪 test:` Adding tests
- `🔧 chore:` Maintenance tasks
- `📰 content:` Newsletter content updates

Examples:
```
✨ feat: Add partner success story section
🐛 fix: Correct broken link in January newsletter
📝 docs: Update contribution guidelines
📰 content: Add February 2026 newsletter
```

## 🚨 Emergency Hotfixes

For critical issues that need immediate attention:

1. Create a hotfix branch from main:
   ```bash
   git checkout -b hotfix/critical-issue main
   ```

2. Make the fix and test thoroughly

3. Create a PR with "HOTFIX" in the title

4. Request immediate review

5. After approval, merge and deploy

## 🔧 Local Development Setup

### Install Git Hooks (Recommended)

```bash
# Install local branch protection hooks
bash scripts/install-git-hooks.sh
```

This installs hooks that:
- Prevent accidental commits to `main`
- Warn before pushing to `main`

### Test Your Changes

```bash
# Serve locally
mkdocs serve

# Build to verify
mkdocs build

# Check for broken links (if you have the tool)
mkdocs build --strict
```

## 👥 Code Review Guidelines

### For Contributors

- Keep PRs focused and small
- Write clear descriptions
- Respond to feedback promptly
- Test your changes thoroughly

### For Reviewers

- Review within 24-48 hours
- Be constructive and respectful
- Check for:
  - Code quality
  - Newsletter content accuracy
  - Broken links
  - Formatting consistency
  - Mobile responsiveness

## 📋 Newsletter Content Guidelines

When adding newsletter content:

1. **Use the newsletter manager script**:
   ```bash
   bash scripts/newsletter-manager.sh
   ```

2. **Follow the content structure**:
   - Use proper markdown formatting
   - Include alt text for images
   - Test all links
   - Proofread for typos

3. **Image guidelines**:
   - Use web-optimized formats (WebP, PNG, JPG)
   - Keep file sizes under 500KB
   - Use descriptive filenames
   - Store in `content/[Month.Year]/assets/`

## ❓ Questions?

If you have questions about contributing:
- Open an issue on GitHub
- Contact @mbalagot12
- Email: mbalagot@arista.com

## 📜 License

By contributing, you agree that your contributions will be licensed under the same license as the project.


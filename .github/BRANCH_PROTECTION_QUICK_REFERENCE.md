# 🛡️ Branch Protection Quick Reference

## ⚡ Quick Commands

### Proper Workflow
```bash
# Create feature branch
git checkout -b feature/my-feature

# Make changes, commit, and push
git add .
git commit -m "✨ feat: Description"
git push origin feature/my-feature

# Then create PR on GitHub
```

### Check Protection Status
```bash
# View GitHub protection
gh api repos/arista-channel/channel-newsletter/branches/main/protection

# Check local hooks
ls -la .git/hooks/pre-commit .git/hooks/pre-push
```

### Reinstall Git Hooks
```bash
bash scripts/install-git-hooks.sh
```

## 🚫 What's Blocked

- ❌ Direct commits to `main`
- ❌ Direct pushes to `main`
- ❌ Force pushes to `main`
- ❌ Deleting `main` branch
- ❌ Merging without approval
- ❌ Merging with failing CI/CD
- ❌ Merging with unresolved conversations

## ✅ What's Required

- ✅ Create feature branch
- ✅ Push to feature branch
- ✅ Create Pull Request
- ✅ Get 1 approval
- ✅ Pass CI/CD checks
- ✅ Resolve all conversations
- ✅ Use squash or rebase merge

## 📝 Commit Message Format

```
✨ feat: Add new feature
🐛 fix: Fix bug
📝 docs: Update documentation
🎨 style: Format code
♻️ refactor: Refactor code
🧪 test: Add tests
🔧 chore: Maintenance
📰 content: Newsletter update
```

## 🆘 Emergency Bypass (Use with caution!)

```bash
# Bypass local git hooks only (GitHub will still block)
git commit --no-verify
git push --no-verify
```

⚠️ **Warning:** Server-side protection cannot be bypassed!

## 📚 Full Documentation

- [Complete Guide](../docs/BRANCH_PROTECTION.md)
- [Contributing Guidelines](../CONTRIBUTING.md)
- [Verification Report](../PROTECTION_VERIFICATION_REPORT.md)

## 📞 Help

- GitHub: @mbalagot12
- Email: mbalagot@arista.com


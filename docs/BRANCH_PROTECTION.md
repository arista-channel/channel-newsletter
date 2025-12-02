# 🛡️ Branch Protection Setup Guide

This guide explains how to protect the `main` branch from unintentional commits and merges.

## 📋 Overview

We use a **multi-layered protection strategy**:

1. **GitHub Branch Protection Rules** (Server-side) - Primary protection
2. **CODEOWNERS File** (Server-side) - Require specific reviewers
3. **Git Hooks** (Client-side) - Local prevention
4. **Pull Request Template** (Process) - Standardized workflow
5. **Documentation** (Education) - Clear guidelines

## 🚀 Quick Setup

### Step 1: Enable GitHub Branch Protection (Required)

**Option A: Using the Script (Recommended)**

```bash
# Run the automated setup script
bash scripts/setup-branch-protection.sh
```

**Option B: Manual Setup via GitHub UI**

1. Go to: https://github.com/arista-channel/channel-newsletter/settings/branches
2. Click "Add branch protection rule"
3. Branch name pattern: `main`
4. Enable these settings:
   - ✅ Require a pull request before merging
     - ✅ Require approvals: 1
     - ✅ Dismiss stale pull request approvals when new commits are pushed
   - ✅ Require status checks to pass before merging
     - ✅ Require branches to be up to date before merging
     - Add status check: `deploy`
   - ✅ Require linear history
   - ✅ Do not allow bypassing the above settings (optional)
   - ✅ Require conversation resolution before merging
   - ❌ Allow force pushes: OFF
   - ❌ Allow deletions: OFF
5. Click "Create" or "Save changes"

### Step 2: Install Local Git Hooks (Recommended)

```bash
# Install pre-commit and pre-push hooks
bash scripts/install-git-hooks.sh
```

This prevents accidental commits to `main` on your local machine.

### Step 3: Verify Setup

```bash
# Try to commit directly to main (should fail)
git checkout main
echo "test" >> test.txt
git add test.txt
git commit -m "test"
# Expected: Hook blocks the commit

# Clean up
git checkout -- test.txt
rm -f test.txt
```

## 🔒 Protection Layers Explained

### Layer 1: GitHub Branch Protection Rules

**What it does:**
- Blocks direct pushes to `main`
- Requires pull requests for all changes
- Requires at least 1 approval before merging
- Requires CI/CD checks to pass
- Enforces linear history (no merge commits)
- Prevents force pushes and branch deletion

**Pros:**
- ✅ Server-side enforcement (cannot be bypassed)
- ✅ Works for all contributors
- ✅ Integrates with CI/CD

**Setup:** Run `bash scripts/setup-branch-protection.sh`

### Layer 2: CODEOWNERS File

**What it does:**
- Automatically requests reviews from designated owners
- Ensures critical files are reviewed by specific people
- Provides accountability for changes

**Location:** `.github/CODEOWNERS`

**Example:**
```
# All files require review from @mbalagot12
* @mbalagot12

# Workflows require maintainer approval
/.github/workflows/ @mbalagot12
```

**Pros:**
- ✅ Automatic reviewer assignment
- ✅ Clear ownership
- ✅ Works with branch protection

### Layer 3: Git Hooks

**What it does:**
- **pre-commit**: Blocks commits to `main` locally
- **pre-push**: Warns before pushing to `main`

**Setup:** Run `bash scripts/install-git-hooks.sh`

**Pros:**
- ✅ Immediate feedback
- ✅ Prevents mistakes before they reach GitHub
- ✅ Educational (teaches proper workflow)

**Cons:**
- ⚠️ Client-side only (can be bypassed with `--no-verify`)
- ⚠️ Must be installed on each machine

**Bypass (emergency only):**
```bash
git commit --no-verify
git push --no-verify
```

### Layer 4: Pull Request Template

**What it does:**
- Provides a standardized PR format
- Includes checklists for quality assurance
- Ensures proper documentation

**Location:** `.github/PULL_REQUEST_TEMPLATE.md`

**Pros:**
- ✅ Consistent PR format
- ✅ Quality checklist
- ✅ Better documentation

### Layer 5: Documentation

**What it does:**
- Educates contributors on proper workflow
- Provides clear guidelines
- Reduces mistakes through awareness

**Location:** `CONTRIBUTING.md`

## 📖 Recommended Workflow

### For Regular Changes

```bash
# 1. Create feature branch
git checkout main
git pull origin main
git checkout -b feature/my-feature

# 2. Make changes
# ... edit files ...

# 3. Commit changes
git add .
git commit -m "✨ feat: Add new feature"

# 4. Push branch
git push origin feature/my-feature

# 5. Create PR on GitHub
# 6. Wait for review and approval
# 7. Merge via GitHub UI (squash and merge)
```

## 🚨 Emergency Procedures

### Critical Hotfix

```bash
# 1. Create hotfix branch
git checkout -b hotfix/critical-issue main

# 2. Make fix
# ... fix the issue ...

# 3. Commit and push
git commit -am "🐛 hotfix: Fix critical issue"
git push origin hotfix/critical-issue

# 4. Create PR with "HOTFIX" in title
# 5. Request immediate review
# 6. Merge after approval
```

### Bypass Protection (Admin Only)

If you're an admin and need to bypass protection:

1. Temporarily disable branch protection
2. Make the change
3. Re-enable branch protection immediately

**⚠️ WARNING:** Only use in extreme emergencies!

## ✅ Verification Checklist

After setup, verify:

- [ ] Branch protection rules are active on GitHub
- [ ] CODEOWNERS file is in place
- [ ] Git hooks are installed locally
- [ ] PR template appears when creating PRs
- [ ] Direct commits to `main` are blocked
- [ ] CI/CD checks run on PRs
- [ ] Team members understand the workflow

## 🔍 Monitoring

### Check Protection Status

```bash
# View branch protection settings
gh api repos/arista-channel/channel-newsletter/branches/main/protection

# View recent PRs
gh pr list --state all --limit 10
```

### Audit Trail

All changes to `main` are tracked:
- PR history: https://github.com/arista-channel/channel-newsletter/pulls
- Commit history: https://github.com/arista-channel/channel-newsletter/commits/main
- Branch protection events: Settings → Branches → Protection rules

## 📚 Additional Resources

- [GitHub Branch Protection Docs](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches)
- [CODEOWNERS Documentation](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
- [Git Hooks Documentation](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)

## ❓ Troubleshooting

### "Permission denied" when pushing to main

**Solution:** This is expected! Create a feature branch instead.

### Git hooks not working

**Solution:** Re-run `bash scripts/install-git-hooks.sh`

### Can't merge PR despite approval

**Solution:** Ensure CI/CD checks pass and conversations are resolved.

## 📞 Support

Questions? Contact:
- @mbalagot12 on GitHub
- mbalagot@arista.com


# 🛡️ Safe Refactoring Steps - No Breaking Changes

## ⚠️ PRIMARY GOAL
**Keep version 2026.1 live and functional on GitHub Pages throughout all changes**

---

## 🎯 Safe Refactoring Strategy

### Phase 0: Enable GitHub Pages FIRST ⚡
**STATUS: CRITICAL - Must do before anything else**

**Action Required:**
1. Go to https://github.com/arista-channel/channel-newsletter/settings/pages
2. Under "Build and deployment":
   - Source: Deploy from a branch
   - Branch: `gh-pages` / (root)
3. Click Save
4. Verify site loads at https://arista-channel.github.io/channel-newsletter/

**Why:** Currently getting 404 because GitHub Pages is disabled. This doesn't require code changes.

---

## Phase 1: Organize Without Breaking (Safe Moves)

### 1.1 Create New Directories (Additive Only)
Create new structure WITHOUT removing anything:

```bash
mkdir -p docs/project
mkdir -p docs/guides  
mkdir -p scripts/core
mkdir -p scripts/setup
mkdir -p scripts/legacy
```

**Risk: None** - Just creating empty directories

### 1.2 Copy (Not Move) Documentation Files
Copy root docs to new location:

```bash
cp BRANCH_PROTECTION_SUMMARY.md docs/project/
cp CLEANUP_SUMMARY.md docs/project/
cp DEPLOYMENT_READY.md docs/project/
cp NEWSLETTER_QUARTERLY_TRANSITION.md docs/project/
cp PROTECTION_VERIFICATION_REPORT.md docs/project/
cp PUBLISHING_WORKFLOW.md docs/project/
cp QUARTERLY_SCHEDULE_UPDATE.md docs/project/
```

**Risk: None** - Files are copied, not moved. Originals still exist.

### 1.3 Copy (Not Move) Scripts
Organize scripts by copying:

```bash
# Core scripts
cp scripts/publish-newsletter.sh scripts/core/
cp scripts/quarterly-newsletter-manager.sh scripts/core/

# Setup scripts  
cp scripts/setup-newsletter.sh scripts/setup/
cp scripts/install-git-hooks.sh scripts/setup/

# Legacy scripts
cp scripts/fix-*.sh scripts/legacy/
cp scripts/deploy-to-github-pages.sh scripts/legacy/
```

**Risk: None** - Originals still work

---

## Phase 2: Fix GitHub Actions (Backward Compatible)

### 2.1 Update Deploy Workflow
**Current issue:** Uses `Jan.2026` instead of `2026.1`

**Safe fix:**
```yaml
# Change line 46 in .github/workflows/deploy.yml
# FROM:
mike deploy --push --update-aliases Jan.2026 latest

# TO:
mike deploy --push --update-aliases 2026.1 latest
```

**Why safe:**
- Mike can handle both versions simultaneously
- Both `Jan.2026` and `2026.1` will exist
- Won't break existing deployment

### 2.2 Test Locally First
Before pushing, test:
```bash
uv venv .venv
source .venv/bin/activate
uv pip install -r requirements.txt
mike serve
```

---

## Phase 3: Documentation Updates (No Breaking Changes)

### 3.1 Update README.md
Add note about new structure but keep all existing instructions working.

### 3.2 Create New Documentation
Add (don't replace):
- `docs/project/ARCHITECTURE.md`
- `docs/guides/DEPLOYMENT.md`
- `docs/guides/VERSION_MANAGEMENT.md`

**Risk: None** - Only adding new documentation

---

## Phase 4: Cleanup (Only After Verification)

### 4.1 Remove Root Documentation Files
**ONLY after confirming new location works:**
```bash
# Verify new docs work first!
# Then:
rm BRANCH_PROTECTION_SUMMARY.md
rm CLEANUP_SUMMARY.md
# etc...
```

### 4.2 Remove Duplicate Scripts
**ONLY after confirming organized scripts work:**
```bash
# Test new script locations first!
# Then remove originals
```

---

## 🚦 Safe Execution Order

### Step 1: Pre-Flight Check ✅
- [ ] Verify current site status
- [ ] Check gh-pages branch exists
- [ ] Confirm mike versions: `mike list`
- [ ] Test local build works

### Step 2: Enable GitHub Pages ✅
- [ ] Enable Pages in repository settings
- [ ] Verify site loads (wait 2-3 minutes)
- [ ] Check version 2026.1 is visible

### Step 3: Additive Changes Only ✅
- [ ] Create new directories
- [ ] Copy (not move) files
- [ ] Test everything still works
- [ ] Commit and push

### Step 4: Fix Version Naming ✅
- [ ] Update GitHub Actions to use `2026.1`
- [ ] Test locally first
- [ ] Push and verify deployment
- [ ] Confirm both versions accessible

### Step 5: Documentation ✅
- [ ] Add new documentation
- [ ] Update README
- [ ] No breaking changes

### Step 6: Cleanup (Last!) ✅
- [ ] Verify everything works for 1 week
- [ ] Remove duplicates only after confirmation
- [ ] Keep backups

---

## 🛡️ Safety Checklist

Before ANY change:
- [ ] Can this break the live site?
- [ ] Is there a backup/rollback plan?
- [ ] Can I test locally first?
- [ ] Am I only adding, not removing?
- [ ] Have I verified gh-pages branch?

After ANY change:
- [ ] Does local build work?
- [ ] Does GitHub Actions succeed?
- [ ] Is the site still accessible?
- [ ] Is version 2026.1 still live?

---

## 🚨 What NOT to Do

❌ **DO NOT:**
- Delete `/content/2026.1/` directory
- Remove `mkdocs.yml` 
- Delete `.github/workflows/deploy.yml`
- Remove `gh-pages` branch
- Change `docs_dir` in mkdocs.yml without testing
- Delete scripts that might be in use
- Force push to main or gh-pages
- Disable GitHub Actions

✅ **DO:**
- Add new files/directories
- Copy before moving
- Test locally always
- Make small, incremental changes
- Verify after each step
- Keep backups
- Document what you change

---

## 📞 Rollback Plan

If something breaks:

1. **Revert last commit:**
   ```bash
   git revert HEAD
   git push origin main
   ```

2. **Emergency restore:**
   ```bash
   git checkout main
   git reset --hard <last-good-commit>
   git push --force origin main
   ```

3. **Re-enable GitHub Pages:**
   - Go to Settings → Pages
   - Re-select gh-pages branch

---

## 🎯 Immediate Next Steps

**What should we do RIGHT NOW?**

1. **Enable GitHub Pages** (safest, no code changes)
2. **Fix version naming** in GitHub Actions (low risk)
3. **Organize documentation** (zero risk - additive only)

**Which would you like to start with?**

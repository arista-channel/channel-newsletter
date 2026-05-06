# 🔄 Newsletter Codebase Refactoring Plan

## ⚠️ **CRITICAL CONSTRAINT**
**MUST keep 2026.1 live and functional on GitHub Pages at all times**
- No breaking changes to current deployment
- All changes must be backwards compatible
- Test before removing anything
- Incremental, safe improvements only

---

## 📊 Current State Analysis

### Issues Identified:
1. **Version Naming Inconsistency**: GitHub Actions uses `Jan.2026`, content uses `2026.1`
2. **Directory Redundancy**: Duplicate content in `docs/` and `content/` directories
3. **Root Clutter**: 9 documentation files in root that should be organized
4. **Hardcoded Values**: Version names hardcoded in `.github/workflows/deploy.yml`
5. **Unused Scripts**: Multiple legacy setup/fix scripts
6. **Configuration Drift**: `mkdocs.yml` points to `content/2026.1` but should be dynamic
7. **GitHub Pages Disabled**: Currently getting 404 errors (needs re-enabling)

---

## 🎯 Refactoring Goals

1. **Standardize Version Format**: Use `YYYY.Q` (e.g., `2026.1`) everywhere
2. **Consolidate Directories**: Single source of truth for content
3. **Organize Documentation**: Move root docs to `docs/` directory
4. **Dynamic Configuration**: Remove hardcoded version references
5. **Clean Up Scripts**: Archive or remove unused scripts
6. **Improve CI/CD**: Make GitHub Actions workflow version-agnostic

---

## 📁 Phase 1: Directory Restructuring

### 1.1 Remove Root Documentation Files
Move these files to `docs/project/`:
- `BRANCH_PROTECTION_SUMMARY.md`
- `CLEANUP_SUMMARY.md`
- `DEPLOYMENT_READY.md`
- `NEWSLETTER_QUARTERLY_TRANSITION.md`
- `PROTECTION_VERIFICATION_REPORT.md`
- `PUBLISHING_WORKFLOW.md`
- `QUARTERLY_SCHEDULE_UPDATE.md`

Keep in root:
- `README.md`
- `CONTRIBUTING.md`

### 1.2 Consolidate Content Directories
**Current structure:**
```
/content/2026.1/
/content/2026.2/
/content/2026.3/
/content/2026.4/
/docs/  (duplicate of content/2026.1)
```

**Proposed structure:**
```
/content/
  2026.1/
    index.md
    about.md
    archive.md
    current-issue.md
    assets/
  2026.2/
  2026.3/
  2026.4/
/docs/
  project/        # Project documentation
  guides/         # Author guides
  templates/      # Move from /templates/
```

### 1.3 Scripts Organization
**Current:** 11 scripts in `/scripts/`
**Proposed structure:**
```
/scripts/
  core/
    publish-newsletter.sh        # Keep
    quarterly-newsletter-manager.sh  # Keep
  setup/
    setup-newsletter.sh          # Keep
    install-git-hooks.sh         # Keep
  legacy/                        # Archive old scripts
    fix-*.sh
    deploy-to-github-pages.sh
```

---

## ⚙️ Phase 2: Configuration Updates

### 2.1 Fix GitHub Actions Workflow
**Current issue:** Hardcoded version `Jan.2026`
**Solution:** Make it dynamic or use proper version format

### 2.2 Update mkdocs.yml
**Current issue:** `docs_dir: content/2026.1` is hardcoded
**Solutions:**
- Option A: Dynamic version detection from environment variable
- Option B: Symbolic link to current version
- Option C: Use Mike's built-in version handling

### 2.3 Standardize Version Format
**Decision needed:** Choose ONE format:
- Option A: `YYYY.Q` (2026.1, 2026.2, etc.) - **RECOMMENDED**
- Option B: `Mon.YYYY` (Mar.2026, Jun.2026, etc.)

Update:
- GitHub Actions workflow
- Content folder names
- Mike deployment commands
- All documentation

---

## 🔧 Phase 3: Code Improvements

### 3.1 Update publish-newsletter.sh
- Add validation for version format
- Add dry-run option
- Improve error handling
- Add rollback capability

### 3.2 Create Configuration File
Create `config.yml` for project settings:
```yaml
newsletter:
  current_version: "2026.1"
  version_format: "YYYY.Q"
  schedule:
    - quarter: 1
      month: "March"
      week: 2
    - quarter: 2
      month: "June"
      week: 2
    # ...
```

### 3.3 Improve CI/CD
- Add version validation
- Add automated testing
- Add deployment preview
- Add rollback mechanism

---

## 📝 Phase 4: Documentation Updates

### 4.1 Consolidate Documentation
- Update README.md with new structure
- Create ARCHITECTURE.md
- Update CONTRIBUTING.md
- Create DEPLOYMENT.md

### 4.2 Update Author Guides
- Reflect new directory structure
- Update version naming conventions
- Add examples using new structure

---

## 🚀 Phase 5: Migration Steps

### Step 1: Create New Structure (No Breaking Changes)
1. Create new directories
2. Copy files to new locations
3. Update configuration files
4. Test locally

### Step 2: Update CI/CD
1. Update GitHub Actions workflow
2. Test deployment
3. Verify GitHub Pages

### Step 3: Clean Up Old Structure
1. Remove duplicate files
2. Archive old scripts
3. Update all references

### Step 4: Documentation & Communication
1. Update all documentation
2. Create migration guide
3. Update team on changes

---

## ✅ Implementation Checklist

- [ ] **Phase 1: Directory Restructuring**
  - [ ] Create `docs/project/` directory
  - [ ] Move root documentation files
  - [ ] Remove duplicate `/docs/` content
  - [ ] Organize scripts into subdirectories
  
- [ ] **Phase 2: Configuration Updates**
  - [ ] Fix GitHub Actions version naming
  - [ ] Update mkdocs.yml
  - [ ] Standardize all version references
  
- [ ] **Phase 3: Code Improvements**
  - [ ] Update publish-newsletter.sh
  - [ ] Create config.yml
  - [ ] Improve CI/CD workflow
  
- [ ] **Phase 4: Documentation**
  - [ ] Update README.md
  - [ ] Create ARCHITECTURE.md
  - [ ] Update CONTRIBUTING.md
  - [ ] Update author guides
  
- [ ] **Phase 5: Testing & Deployment**
  - [ ] Test locally
  - [ ] Test CI/CD pipeline
  - [ ] Verify GitHub Pages
  - [ ] Clean up old files

---

## 🎯 Expected Outcomes

After refactoring:
- ✅ Clear, consistent version naming throughout
- ✅ Organized directory structure
- ✅ No duplicate content
- ✅ Dynamic, maintainable configuration
- ✅ Clean root directory
- ✅ Better developer experience
- ✅ Easier to maintain and extend

---

## 🤔 Questions to Answer

1. **Version Format**: Confirm `YYYY.Q` vs `Mon.YYYY`
2. **GitHub Pages**: Do you want to re-enable it now?
3. **Breaking Changes**: Are you okay with restructuring directories?
4. **Timeline**: When should this refactoring be completed?
5. **Testing**: Do you want a staging environment first?

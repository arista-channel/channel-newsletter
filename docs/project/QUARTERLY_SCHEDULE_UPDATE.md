# Newsletter Schedule Update - Quarterly Publishing

## 📅 Schedule Change Summary

**Previous Schedule**: Monthly (12 issues per year)  
**New Schedule**: Quarterly (4 issues per year, every 3 months)  
**First Issue**: Q1 2026 (March) - 2nd week of March 2026

---

## 🔄 Changes Made

### 1. Content Updates

#### ✅ Updated Files:
- **content/Mar.2026/index.md** - Updated to Q1 2026 with quarterly schedule
- **content/Mar.2026/about.md** - New file with quarterly publishing details
- **content/Mar.2026/current-issue.md** - New file with Q1 2026 information
- **content/Mar.2026/archive.md** - New file with quarterly archive structure
- **docs/index.md** - Updated to Q1 2026 (March) with quarterly references

#### ✅ Configuration Files:
- **mkdocs.yml** - Updated:
  - `site_description`: Changed to "quarterly newsletter"
  - `docs_dir`: Changed from `content/Jan.2026` to `content/Mar.2026`

#### ✅ Documentation:
- **README.md** - Updated:
  - Description changed to "quarterly newsletter platform"
  - Release schedule updated to quarterly (March, June, September, December)
  - Version format examples updated (Mar.2026, Jun.2026, Sep.2026, Dec.2026)
  - Schedule table updated with quarterly releases

---

## 📆 2026 Quarterly Publishing Schedule

| Quarter | Month | Version | Release Week | Status |
|---------|-------|---------|--------------|--------|
| Q1 2026 | March | `Mar.2026` | 2nd week of March | ✅ Ready |
| Q2 2026 | June | `Jun.2026` | 2nd week of June | 📝 Planned |
| Q3 2026 | September | `Sep.2026` | 2nd week of September | 📝 Planned |
| Q4 2026 | December | `Dec.2026` | 2nd week of December | 📝 Planned |

**Publishing Pattern**: 2nd week of March, June, September, and December

---

## 📋 Next Steps

### 1. Deploy the Q1 2026 Newsletter

```bash
# Option 1: Using the newsletter manager script (if updated for quarterly)
./scripts/newsletter-manager.sh deploy Mar.2026

# Option 2: Manual deployment with mike
uv run mike deploy Mar.2026 latest --update-aliases
uv run mike set-default Mar.2026
```

### 2. Create Future Quarterly Issues

When ready to create the next quarterly issue (Q2 2026 - June):

```bash
# Create Jun.2026 directory
mkdir -p content/Jun.2026

# Copy the template structure from Mar.2026
cp -r content/Mar.2026/* content/Jun.2026/

# Update the content for Q2 2026
# Edit: content/Jun.2026/index.md
# Edit: content/Jun.2026/about.md
# Edit: content/Jun.2026/current-issue.md
# Edit: content/Jun.2026/archive.md
```

### 3. Update Newsletter Manager Script (Optional)

The `scripts/newsletter-manager.sh` script is currently designed for monthly newsletters. You may want to:

**Option A**: Update the script to support quarterly publishing
- Change MONTHS array to quarterly months only
- Update schedule calculation logic
- Update help text and examples

**Option B**: Create a new quarterly-specific script
- Create `scripts/quarterly-newsletter-manager.sh`
- Implement quarterly-specific logic

**Option C**: Use manual deployment
- Continue using mike commands directly
- Document the quarterly deployment process

---

## 🔍 Files That Still Reference Monthly Schedule

The following files still contain monthly/Jan.2026 references and may need updates:

### Scripts:
- **scripts/newsletter-manager.sh** - Designed for monthly newsletters
  - Line 4: "Manages monthly newsletter versions"
  - Line 25: "2nd Tuesday of each month"
  - Line 186-188: Initializes with Jan.2026
  - Multiple references to monthly schedule throughout

### Recommendation:
If you plan to continue using the newsletter-manager.sh script, it should be updated to support quarterly publishing. Otherwise, you can use mike commands directly for quarterly deployments.

---

## ✅ Verification Checklist

Before deploying, verify:

- [ ] All content files in `content/Mar.2026/` are updated
- [ ] `mkdocs.yml` points to `content/Mar.2026`
- [ ] README.md reflects quarterly schedule
- [ ] Assets are copied to `content/Mar.2026/assets/`
- [ ] All dates reference March 2026 (not January)
- [ ] Schedule information shows quarterly pattern
- [ ] About page explains quarterly publishing

---

## 📞 Contact

**Newsletter Team**: [cse-newsletter@arista.com](mailto:cse-newsletter@arista.com)
**Partner Support**: [partners-techhelp@arista.com](mailto:partners-techhelp@arista.com)

---

*This document summarizes the changes made to transition from monthly to quarterly newsletter publishing.*


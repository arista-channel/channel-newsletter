# 📅 Newsletter Transition to Quarterly Publishing

## Summary

The Arista Channel Newsletter has been successfully updated to a **quarterly publishing schedule**, starting with **Q1 2026 (March)** in the 2nd week of March 2026.

---

## 🔄 What Changed

### Publishing Schedule
- **Previous**: Monthly (12 issues per year)
- **New**: Quarterly (4 issues per year, every 3 months)
- **Release Pattern**: 2nd week of March, June, September, and December

### 2026 Quarterly Schedule

| Quarter | Month | Version | Release Week | Status |
|---------|-------|---------|--------------|--------|
| Q1 2026 | March | `Mar.2026` | 2nd week of March | ✅ Ready |
| Q2 2026 | June | `Jun.2026` | 2nd week of June | 📝 Planned |
| Q3 2026 | September | `Sep.2026` | 2nd week of September | 📝 Planned |
| Q4 2026 | December | `Dec.2026` | 2nd week of December | 📝 Planned |

---

## ✅ Files Updated

### Content Files
1. **content/Mar.2026/index.md** - Q1 2026 newsletter with quarterly schedule
2. **content/Mar.2026/about.md** - Updated mission and quarterly publishing details
3. **content/Mar.2026/current-issue.md** - Q1 2026 issue information
4. **content/Mar.2026/archive.md** - Quarterly archive structure
5. **docs/index.md** - Updated to Q1 2026 (March) references

### Configuration Files
6. **mkdocs.yml** - Updated:
   - Site description: "quarterly newsletter"
   - docs_dir: `content/Mar.2026`

### Documentation
7. **README.md** - Updated:
   - Description: "quarterly newsletter platform"
   - Schedule table with quarterly releases
   - Examples using Mar.2026 instead of Jan.2026

### New Files Created
8. **scripts/quarterly-newsletter-manager.sh** - New quarterly-specific deployment script
9. **QUARTERLY_SCHEDULE_UPDATE.md** - Detailed change documentation
10. **NEWSLETTER_QUARTERLY_TRANSITION.md** - This summary document

---

## 🚀 How to Deploy Q1 2026 Newsletter

### Option 1: Using the Quarterly Newsletter Manager (Recommended)

```bash
# Initialize Mike (first time only)
./scripts/quarterly-newsletter-manager.sh init

# Deploy Q1 2026 (March)
./scripts/quarterly-newsletter-manager.sh deploy Mar.2026

# View the schedule
./scripts/quarterly-newsletter-manager.sh schedule 2026

# Check status
./scripts/quarterly-newsletter-manager.sh status
```

### Option 2: Manual Deployment with Mike

```bash
# Ensure mkdocs.yml points to Mar.2026
# (Already updated in mkdocs.yml)

# Deploy with mike
uv run mike deploy Mar.2026 latest --update-aliases --push
uv run mike set-default Mar.2026

# Verify deployment
uv run mike list
```

---

## 📋 Creating Future Quarterly Issues

### For Q2 2026 (June):

```bash
# 1. Create directory structure
mkdir -p content/Jun.2026/assets

# 2. Copy template from Mar.2026
cp content/Mar.2026/index.md content/Jun.2026/
cp content/Mar.2026/about.md content/Jun.2026/
cp content/Mar.2026/current-issue.md content/Jun.2026/
cp content/Mar.2026/archive.md content/Jun.2026/
cp -r content/Mar.2026/assets/* content/Jun.2026/assets/

# 3. Update content for Q2 2026
# Edit: content/Jun.2026/index.md (change Q1 to Q2, March to June)
# Edit: content/Jun.2026/current-issue.md (update dates and quarter)
# Edit: content/Jun.2026/archive.md (add Q1 to archive, mark Q2 as current)

# 4. Deploy when ready
./scripts/quarterly-newsletter-manager.sh deploy Jun.2026
```

### Quick Reference for Future Quarters:

| Quarter | Version | Month | Release Week |
|---------|---------|-------|--------------|
| Q2 2026 | Jun.2026 | June | 2nd week |
| Q3 2026 | Sep.2026 | September | 2nd week |
| Q4 2026 | Dec.2026 | December | 2nd week |
| Q1 2027 | Mar.2027 | March | 2nd week |

---

## 🛠️ Tools Available

### Quarterly Newsletter Manager Script
**Location**: `scripts/quarterly-newsletter-manager.sh`

**Commands**:
- `init` - Initialize Mike version control
- `deploy <VERSION>` - Deploy a newsletter version
- `schedule [YEAR]` - Show quarterly schedule
- `list` - List all deployed versions
- `status` - Show current status
- `help` - Show help message

**Example Usage**:
```bash
# View help
./scripts/quarterly-newsletter-manager.sh help

# View 2026 schedule
./scripts/quarterly-newsletter-manager.sh schedule 2026

# Deploy March 2026
./scripts/quarterly-newsletter-manager.sh deploy Mar.2026
```

### Original Monthly Newsletter Manager
**Location**: `scripts/newsletter-manager.sh`

**Status**: Still available but designed for monthly publishing. Use the quarterly script instead.

---

## 📊 Content Structure

Each quarterly newsletter includes:

### Main Content (index.md)
- Quarter and year header (e.g., "Q1 2026 (March)")
- Product updates from all workgroups
- Industry spotlight with Arista news
- Upcoming events for the quarter
- Quarterly schedule information

### Supporting Pages
- **about.md** - Mission, audience, quarterly publishing details
- **current-issue.md** - Current quarter overview and statistics
- **archive.md** - Historical issues and upcoming quarters

### Assets
- Logo and images in `assets/` directory
- Copied from previous quarter or created new

---

## ✅ Verification Checklist

Before deploying each quarterly issue:

- [ ] Content directory exists (e.g., `content/Mar.2026/`)
- [ ] All required files present (index.md, about.md, current-issue.md, archive.md)
- [ ] Assets copied to `assets/` subdirectory
- [ ] Dates and quarter references are correct
- [ ] Schedule information shows quarterly pattern
- [ ] mkdocs.yml points to correct content directory
- [ ] Previous quarter added to archive.md
- [ ] Events and dates updated for current quarter

---

## 🌐 Deployment URLs

- **GitHub Pages**: https://arista-channel.github.io/channel-newsletter/
- **Repository**: https://github.com/arista-channel/channel-newsletter
- **Branch Settings**: https://github.com/arista-channel/channel-newsletter/settings/branches

---

## 📞 Contact

**Newsletter Team**: [cse-newsletter@arista.com](mailto:cse-newsletter@arista.com)
**Partner Support**: [partners-techhelp@arista.com](mailto:partners-techhelp@arista.com)
**Partner Portal**: [partners.arista.com](https://partners.arista.com)

---

## 🎯 Next Steps

1. **Review the updated content** in `content/Mar.2026/`
2. **Deploy Q1 2026** using the quarterly newsletter manager script
3. **Verify deployment** at the GitHub Pages URL
4. **Plan Q2 2026 content** for June publication
5. **Update branch protection** if needed (already configured)

---

*Last Updated: December 2, 2024*  
*Transition completed successfully! 🎉*


# Newsletter Publishing Workflow

This document describes how to publish new newsletter versions and manage the archive.

## 📋 Overview

The newsletter uses a **single active version** approach:
- Only the **current quarter's newsletter** is visible to readers
- Previous versions are **archived** (still accessible but not marked as "latest")
- Future versions are **kept in development** until ready to publish

## 🗂️ Version Structure

```
content/
├── 2026.1/  ← Q1 2026 (March) - Currently published
├── 2026.2/  ← Q2 2026 (June) - In development (hidden)
├── 2026.3/  ← Q3 2026 (September) - In development (hidden)
└── 2026.4/  ← Q4 2026 (December) - In development (hidden)
```

## 📅 Publishing Schedule

| Quarter | Version | Month     | Week      |
|---------|---------|-----------|-----------|
| Q1      | 2026.1  | March     | 2nd week  |
| Q2      | 2026.2  | June      | 2nd week  |
| Q3      | 2026.3  | September | 2nd week  |
| Q4      | 2026.4  | December  | 2nd week  |

## 🚀 How to Publish a New Newsletter

### Step 1: Prepare Content

1. Create or update the content directory for the new version:
   ```bash
   # Example: Preparing June 2026 (version 2026.2)
   ls content/2026.2/
   ```

2. Ensure the following files are ready:
   - `index.md` - Main newsletter content
   - `current-issue.md` - Current issue page
   - `archive-entry.md` - Archive entry
   - `about.md` - About page
   - `archive.md` - Archive page
   - `assets/` - Images and assets

### Step 2: Run the Publishing Script

```bash
./scripts/publish-newsletter.sh 2026.2
```

The script will:
1. ✅ Validate the version format
2. ✅ Check that content exists
3. ✅ Show current version and ask for confirmation
4. ✅ Update `mkdocs.yml` to point to new version
5. ✅ Deploy new version as "latest"
6. ✅ Archive previous version (removes "latest" tag)
7. ✅ Set new version as default

### Step 3: Test Locally

```bash
uv run mike serve -a 0.0.0.0:8082
```

Open http://localhost:8082/ and verify:
- New version is displayed
- Content is correct
- Version selector shows only published versions
- Previous version is in archive (if you have an archive page)

### Step 4: Commit and Push

```bash
# Commit the changes
git add -A
git commit -m "Publish newsletter version 2026.2"

# Push to GitHub
git push origin main
git push origin gh-pages --force
```

### Step 5: Verify Live Deployment

Visit https://arista-channel.github.io/channel-newsletter/ and confirm:
- ✅ New version is live
- ✅ Previous version is archived
- ✅ Future versions are not visible

## 📚 Managing Versions

### View All Deployed Versions

```bash
uv run mike list
```

### Delete a Version

```bash
uv run mike delete <version> --ignore-remote-status

# Example: Delete version 2026.1
uv run mike delete 2026.1 --ignore-remote-status
```

### Manually Deploy a Version

```bash
# Deploy as latest
uv run mike deploy <version> latest --update-aliases --ignore-remote-status

# Deploy without latest tag (archived)
uv run mike deploy <version> --ignore-remote-status
```

## 🔄 Example: Publishing June 2026 Newsletter

**Current State:**
- Version 2026.1 (March 2026) is live and marked as "latest"

**Publishing Process:**

```bash
# 1. Prepare content in content/2026.2/
# 2. Run publishing script
./scripts/publish-newsletter.sh 2026.2

# 3. Test locally
uv run mike serve -a 0.0.0.0:8082

# 4. Commit and push
git add -A
git commit -m "Publish newsletter version 2026.2 (Q2 June 2026)"
git push origin main
git push origin gh-pages --force
```

**Result:**
- Version 2026.2 is now live and marked as "latest"
- Version 2026.1 is archived (still accessible but not "latest")
- Versions 2026.3 and 2026.4 remain hidden (not deployed)

## 🎯 Best Practices

1. **Keep Future Versions Hidden**: Don't deploy versions until they're ready to publish
2. **Test Before Publishing**: Always test locally before pushing to production
3. **Archive Old Versions**: Previous versions remain accessible for reference
4. **One Version at a Time**: Only one version should be marked as "latest"
5. **Consistent Naming**: Use YYYY.Q format (e.g., 2026.1, 2026.2)

## 🛠️ Troubleshooting

### Version Not Showing Up

```bash
# Check deployed versions
uv run mike list

# Rebuild and redeploy
uv run mike deploy <version> latest --update-aliases --ignore-remote-status
uv run mike set-default <version> --ignore-remote-status
```

### Wrong Version is Default

```bash
# Set correct default
uv run mike set-default <version> --ignore-remote-status
```

### Need to Rollback

```bash
# Redeploy previous version as latest
uv run mike deploy <previous_version> latest --update-aliases --ignore-remote-status
uv run mike set-default <previous_version> --ignore-remote-status
```

## 📧 Contact

For questions about the publishing workflow, contact:
- **Email**: cse-newsletter@arista.com
- **Code Owner**: @mbalagot12


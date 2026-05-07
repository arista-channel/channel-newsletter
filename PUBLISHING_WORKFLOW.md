# Newsletter Publishing Workflow

Simple workflow for creating and publishing quarterly newsletters using **Option 1: Manual but Simple**.

## 📅 Quarterly Publishing Schedule

- **Q1 (2026.1)**: March 2026 ✅ Published
- **Q2 (2026.2)**: June 2026 - In Development
- **Q3 (2026.3)**: September 2026
- **Q4 (2026.4)**: December 2026

---

## 🎯 Workflow Overview

### Phase 1: Content Collection (Google Docs)
Authors draft articles in Google Docs → You collect and organize

### Phase 2: Conversion to Markdown
Export/convert Google Docs to Markdown format

### Phase 3: Local Editing & Preview
Add content to `content/2026.X/index.md` → Preview locally

### Phase 4: Publish to Live Site
Push to GitHub → Auto-deploys to website

---

## 📝 Detailed Steps

### **Step 1: Set Up Local Preview**

```bash
# Start local development server
cd channel-newsletter
mkdocs serve

# OR with versioning preview
mike serve

# Open in browser: http://localhost:8000/
```

The preview auto-reloads as you edit files! ✨

---

### **Step 2: Get Content from Google Docs**

**Option A: Manual Copy/Paste (Easiest)**
1. Open Google Doc
2. Copy content
3. Paste into `content/2026.2/index.md`
4. Clean up formatting (see tips below)

**Option B: Export as Markdown (Cleaner)**
1. Install "Docs to Markdown" Google Docs add-on
2. Open your Google Doc
3. Extensions → Docs to Markdown → Convert
4. Copy the generated Markdown
5. Paste into `content/2026.2/index.md`

**Option C: Download as HTML, Convert with Pandoc**
1. File → Download → Web Page (.html)
2. Run: `pandoc -f html -t markdown input.html -o output.md`
3. Copy content from `output.md` into newsletter

---

### **Step 3: Edit the Newsletter Content**

**File to edit:** `content/2026.2/index.md`

**Structure to follow** (based on 2026.1):

```markdown
# Engineers' Exchange - Version 2026.2

[Header with logo]

*Published: June 2026 | Version 2026.2 | Q2 2026 Edition*

## 📰 In This Issue
[Table of contents]

## 🚀 Product Updates
### 1️⃣ [Article 1 Title]
✍️ Authors: Name, Title
[Content]

### 2️⃣ [Article 2 Title]
[Content]

## 📊 Industry Spotlight
[News and trends]

## 📅 Upcoming Events
[Event table]

## 📧 Contact Us
[Footer]
```

**Tips:**
- Use `content/2026.1/index.md` as a reference template
- Keep the same heading structure (##, ###)
- Preserve the author format: `✍️ Authors: Name, Title`
- Add images to `content/2026.2/assets/` folder

---

### **Step 4: Add Content Incrementally**

**You can update the newsletter gradually!**

1. Edit `content/2026.2/index.md` - Add one article
2. Preview locally with `mkdocs serve` - See changes instantly
3. Commit to Git:
   ```bash
   git add content/2026.2/index.md
   git commit -m "Add article: [Title]"
   git push origin main
   ```
4. **Result**: Content is saved to GitHub, but **NOT published live yet!**

The 2026.2 version only becomes visible when you run the publish command (Step 5).

---

### **Step 5: Publish the Newsletter (When Ready)**

**When all content is complete and ready for June:**

```bash
# Deploy the new quarterly version
mike deploy --push --update-aliases 2026.2 latest
mike set-default --push latest

# Verify deployment
mike list
```

**Result:**
- ✅ Version 2026.2 is now live
- ✅ Website shows "2026.2" in version dropdown
- ✅ Set as "latest" version
- ✅ Accessible at: https://arista-channel.github.io/channel-newsletter/

---

## 🔄 Updating Published Content

**If you need to fix/update content after publishing:**

1. Edit `content/2026.2/index.md`
2. Commit and push:
   ```bash
   git add content/2026.2/index.md
   git commit -m "Update: [description]"
   git push origin main
   ```
3. GitHub Actions auto-deploys the update
4. Changes appear on live site within 1-2 minutes

---

## 📋 Quick Reference

### Common Commands

```bash
# Local preview
mkdocs serve

# Preview with versioning
mike serve

# Publish new quarterly version
mike deploy --push --update-aliases 2026.2 latest
mike set-default --push latest

# List all versions
mike list

# Delete a version (if needed)
mike delete <version> --push
```

### Important Files

- `content/2026.2/index.md` - Main newsletter content
- `content/2026.2/assets/` - Images and media files
- `.github/workflows/deploy.yml` - Auto-deployment config
- `mkdocs.yml` - Site configuration

---

## ✅ Benefits of This Workflow

1. **Flexible**: Add content anytime, publish when ready
2. **Safe**: Preview everything locally before publishing
3. **Simple**: No complex automation to maintain
4. **Controlled**: You decide when to make it live
5. **Reversible**: Can update or fix content anytime

---

## 📧 Questions?

Contact: [cse-newsletter@arista.com](mailto:cse-newsletter@arista.com)

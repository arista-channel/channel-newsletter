# Quick Start: Writing Technical Articles

Choose your preferred workflow and get started in 5 minutes!

---

## 🚀 Option 1: Google Docs (Recommended for Collaboration)

**Best for:** Teams, collaborative writing, non-technical authors

### Step 1: Open the HTML Template

1. Navigate to `templates/google-docs-blank-template.html`
2. Open it in your web browser (Chrome, Safari, Firefox)
3. Select all content: **Cmd+A** (Mac) or **Ctrl+A** (Windows)
4. Copy: **Cmd+C** (Mac) or **Ctrl+C** (Windows)

### Step 2: Create Google Doc

1. Go to [docs.google.com](https://docs.google.com)
2. Click **"Blank document"**
3. Paste: **Cmd+V** (Mac) or **Ctrl+V** (Windows)
4. ✅ Formatting is preserved automatically!

### Step 3: Fill In Your Content

Replace all **red placeholders** with your content:
- `[Article Title]` → Your article title
- `[Author Name, Title]` → Your name and role
- `[Overview text]` → Your 2-3 sentence overview
- Continue for all sections...

### Step 4: Share & Collaborate

1. Click **"Share"** button
2. Add co-authors' email addresses
3. Set permissions to "Can edit"
4. Collaborate in real-time!

### Step 5: Convert to Markdown

**Option A: Use Docs to Markdown Add-on**
1. Extensions → Add-ons → Get add-ons
2. Search "Docs to Markdown"
3. Install and run
4. Copy the Markdown output

**Option B: Manual Conversion**
1. Copy content from Google Doc
2. Paste into text editor
3. Add Markdown formatting:
   - `**Bold text**` for bold
   - `### Heading` for section headers
   - `- Bullet` for lists

### Step 6: Add to Newsletter

1. Open `content/YYYY.Q/index.md`
2. Paste your Markdown content
3. Submit PR for review

---

## 📝 Option 2: Markdown (Recommended for Technical Authors)

**Best for:** Individual authors, technical writers, Markdown experts

### Step 1: Copy Template

```bash
cd /path/to/channel-newsletter
cp templates/blank-technical-article.md my-article.md
```

### Step 2: Edit in Your Favorite Editor

Open `my-article.md` in:
- VS Code
- Sublime Text
- Vim/Neovim
- Any text editor

### Step 3: Fill In Content

Replace all `[placeholders]` with your content following the structure.

### Step 4: Preview (Optional)

Use a Markdown previewer:
- VS Code: Built-in preview (Cmd+Shift+V)
- Browser extension: Markdown Preview Plus
- Online: [StackEdit](https://stackedit.io)

### Step 5: Add to Newsletter

1. Copy your content
2. Paste into `content/YYYY.Q/index.md`
3. Submit PR for review

---

## 📋 Template Structure Reference

Every article follows this structure:

```markdown
### [#]️⃣ [Title]: [Subtitle]
**✍️ Authors:** [Names]

**Overview** (2-3 sentences, 50-75 words)

**Key Technical Highlights** (3-5 bullets)
- **Highlight 1**: Description
- **Highlight 2**: Description

**Platform Specifications** (optional)
**[Product Name]**
- **Spec 1**: Details
- **Use Cases**: Applications

**Technical Benefits** (3-5 categories)
**1. [Category]**
- **Sub-benefit**: Details

**Deployment Use Cases** (4-6 scenarios)
**[Use Case Title]**
- **Challenge**: Pain point
- **Solution**: How it solves
- **Benefits**: Outcomes

**Partner Opportunities** (3-5 bullets)
- **Opportunity**: Description

**Resources** (3-5 links)
- Description: URL or [Coming Soon]
```

---

## ✅ Quality Checklist

Before submitting, verify:

- [ ] Overview is 2-3 sentences (50-75 words)
- [ ] All placeholders replaced
- [ ] Technical claims verified
- [ ] Use cases are realistic
- [ ] Links tested (use `target="_blank"` for external)
- [ ] Article is 800-1200 words
- [ ] Bold formatting used consistently
- [ ] No jargon without explanation

---

## 📚 Need More Help?

- **Detailed Guide**: `templates/AUTHOR_GUIDE.md`
- **Full Template**: `templates/technical-content-template.md`
- **Example Article**: `content/2026.1/index.md` (710HXP Industrial Switching)
- **All Templates**: `templates/README.md`

---

## 🎯 Example: Industrial Switching Article

See the complete example in `content/2026.1/index.md`:

**Title:** "Industrial-Grade Ruggedized Switching: Cognitive Campus for the Edge"

**Structure:**
- Overview: 2 sentences about 710HXP Series
- Key Highlights: 4 bullets (Environment, PoE, Connectivity, Platform)
- Platform Specs: 2 products (Din Rail, 1RU)
- Technical Benefits: 4 categories (Operations, Reliability, Device Support, Security)
- Use Cases: 6 scenarios (Manufacturing, Transportation, Campus, Utilities, Warehousing, Retail)
- Partner Opportunities: 4 bullets
- Resources: 4 links

**Word Count:** ~950 words ✅

---

## 💡 Pro Tips

### Writing
- **Lead with value**: Why should readers care?
- **Be specific**: "90W PoE" not "high-power"
- **Show, don't tell**: Use concrete examples
- **Quantify benefits**: "50% faster" not "faster"

### Formatting
- **Use bold** for key terms and titles
- **Keep bullets short** (1-2 lines max)
- **Add blank lines** between sections
- **Test all links** before submitting

### Collaboration
- **Google Docs**: Best for real-time collaboration
- **Markdown**: Best for version control
- **Hybrid**: Draft in Google Docs, finalize in Markdown

---

**Ready to write? Pick your workflow and start! 🚀**


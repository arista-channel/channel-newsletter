# Newsletter Content Templates

This directory contains templates and guides for writing technical articles for the Engineers' Exchange newsletter.

---

## 📁 Files in This Directory

### For Authors

| File | Purpose | When to Use |
|------|---------|-------------|
| **AUTHOR_GUIDE.md** | Comprehensive writing guide | Read this first before writing |
| **blank-technical-article.md** | Clean Markdown template | Copy this to start writing in Markdown |
| **google-docs-blank-template.html** | HTML template for Google Docs | Import into Google Docs for collaborative writing |
| **google-docs-template.md** | Instructions for Google Docs | Learn how to use Google Docs for drafting |

### For Reference

| File | Purpose |
|------|---------|
| **technical-content-template.md** | Full template with detailed instructions and examples |
| **example-industrial-switching-google-doc.md** | Complete example article (710HXP Industrial Switching) |

---

## 🚀 Quick Start Guide

### Option 1: Write in Markdown (Recommended for Technical Authors)

1. **Copy the blank template:**
   ```bash
   cp templates/blank-technical-article.md my-article.md
   ```

2. **Fill in your content** following the structure

3. **Review against checklist** in `AUTHOR_GUIDE.md`

4. **Add to newsletter:**
   - Paste into `content/YYYY.Q/index.md`
   - Submit PR for review

### Option 2: Write in Google Docs (Recommended for Collaborative Writing)

1. **Open the HTML template:**
   - Open `templates/google-docs-blank-template.html` in a web browser
   - Copy all content (Cmd+A, Cmd+C)

2. **Create a new Google Doc:**
   - Go to [Google Docs](https://docs.google.com)
   - Create a blank document
   - Paste the content (Cmd+V)
   - Google Docs will preserve formatting

3. **Fill in your content:**
   - Replace all red placeholders
   - Share with co-authors for collaboration

4. **Convert to Markdown:**
   - Use "Docs to Markdown" add-on, or
   - Manually convert following `google-docs-template.md` instructions

5. **Add to newsletter:**
   - Paste into `content/YYYY.Q/index.md`
   - Submit PR for review

---

## 📋 Template Structure

All technical articles follow this structure:

```markdown
### [#]️⃣ [Title]: [Subtitle]
**✍️ Authors:** [Names and Titles]

**Overview** (2-3 sentences)
**Key Technical Highlights** (3-5 bullets)
**Platform Specifications** (optional)
**Technical Benefits** (3-5 categories)
**Deployment Use Cases** (4-6 scenarios)
**Partner Opportunities** (3-5 bullets)
**Resources** (3-5 links)
```

---

## 📖 Detailed Documentation

### AUTHOR_GUIDE.md

**Comprehensive guide covering:**
- Section-by-section explanations
- Writing style and tone
- Formatting standards
- Content length guidelines
- Quality checklist
- Common mistakes to avoid

**Read this first** before writing your article.

### technical-content-template.md

**Full template with:**
- Detailed instructions for each section
- Real examples from published articles
- Usage guidelines
- Variations for different content types (software, hardware, architecture)

**Use this as reference** while writing.

---

## ✅ Quality Checklist

Before submitting your article, verify:

### Content
- [ ] Overview is concise and compelling (2-3 sentences, 50-75 words)
- [ ] All technical claims are accurate and verified
- [ ] Use cases are realistic and relatable
- [ ] Partner opportunities are specific and actionable
- [ ] Business value is clearly articulated alongside technical details

### Formatting
- [ ] Author attribution is complete and accurate
- [ ] All section headers follow the template structure
- [ ] Bold formatting is used consistently
- [ ] Numbered emojis are used correctly (1️⃣, 2️⃣, 3️⃣)
- [ ] Spacing is consistent (blank line before/after major sections)

### Links and Resources
- [ ] All links are tested and working
- [ ] External links use `<a href="URL" target="_blank">Link Text</a>` format
- [ ] Future resources are marked "[Coming Soon]"
- [ ] At least 3 resources are provided

### Length and Readability
- [ ] Article is 800-1200 words
- [ ] Content is scannable (good use of bullets, bold, headers)
- [ ] Technical depth is appropriate for the audience
- [ ] No jargon without explanation

---

## 📝 Example Article

See the complete example in `content/2026.1/index.md`:

**"Industrial-Grade Ruggedized Switching: Cognitive Campus for the Edge"**
- Authors: Bill Dyrek, Miguel Balagot
- Topic: 710HXP Series ruggedized switches
- Demonstrates all template sections with real content

---

## 🔄 Workflow

### 1. Draft
- Copy blank template (Markdown or Google Docs)
- Fill in content following the structure
- Collaborate with co-authors

### 2. Review
- Self-review against quality checklist
- Share with technical reviewers
- Incorporate feedback

### 3. Submit
- Convert to Markdown (if using Google Docs)
- Add to newsletter `content/YYYY.Q/index.md`
- Create PR for final review

### 4. Publish
- Merge PR to main branch
- Run `./scripts/publish-newsletter.sh YYYY.Q`
- Push to GitHub Pages

---

## 💡 Tips for Great Articles

### Do's ✅
- **Lead with business value** - Why should readers care?
- **Use specific numbers** - "90W PoE" not "high-power PoE"
- **Show real use cases** - Concrete examples, not generic scenarios
- **Balance technical depth** - Detailed but accessible
- **Quantify benefits** - Cost savings, time reduction, performance gains

### Don'ts ❌
- **Avoid marketing hype** - Let the technology speak for itself
- **Don't assume knowledge** - Explain acronyms and concepts
- **Don't be vague** - "Improves performance" → "Reduces latency by 50%"
- **Don't skip use cases** - Readers need to see practical applications
- **Don't forget partner opportunities** - Help partners identify revenue potential

---

## 🆘 Need Help?

### Resources
- **Author Guide**: `templates/AUTHOR_GUIDE.md`
- **Full Template**: `templates/technical-content-template.md`
- **Example Article**: `content/2026.1/index.md`

### Contact
- **Email**: cse-newsletter@arista.com
- **Code Owner**: @mbalagot12
- **GitHub Issues**: [Create an issue](https://github.com/arista-channel/channel-newsletter/issues)

---

## 📊 Template Versions

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-01-07 | Initial template creation |

---

**Happy Writing! 🚀**


# 🚀 Quick Start for New Contributors

This guide will get you up and running with the Engineers' Exchange newsletter in 5 minutes.

---

## ✅ Minimum Requirements

### Software Required:
1. **Git** - Version control
2. **Python 3.8+** - Programming language
3. **Text Editor** - VS Code, Sublime, or any editor

### Optional (Recommended):
- **UV Package Manager** - Faster Python package management
- **GitHub Account** - For submitting contributions

---

## 📥 Step 1: Clone the Repository

Choose one option:

### Option A: Clone (Recommended for Contributors)
```bash
git clone https://github.com/arista-channel/channel-newsletter.git
cd channel-newsletter
```

### Option B: Fork (For External Contributors)
1. Click "Fork" button on GitHub
2. Clone your fork:
```bash
git clone https://github.com/YOUR-USERNAME/channel-newsletter.git
cd channel-newsletter
git remote add upstream https://github.com/arista-channel/channel-newsletter.git
```

---

## 🔧 Step 2: Install Dependencies

### Option A: Using UV (Recommended - Faster)
```bash
# Install UV
curl -LsSf https://astral.sh/uv/install.sh | sh

# Create virtual environment
uv venv .venv

# Activate virtual environment
source .venv/bin/activate  # macOS/Linux
# OR
.venv\Scripts\activate     # Windows

# Install dependencies
uv pip install -r requirements.txt
```

### Option B: Using Standard pip
```bash
# Create virtual environment
python3 -m venv .venv

# Activate virtual environment
source .venv/bin/activate  # macOS/Linux
# OR
.venv\Scripts\activate     # Windows

# Install dependencies
pip install -r requirements.txt
```

---

## 🏃 Step 3: Run Local Preview

```bash
# Start the local development server
mkdocs serve

# OR if using mike versioning:
mike serve
```

**Open your browser to:** http://localhost:8000

---

## ✏️ Step 4: Make Your First Edit

### Edit Newsletter Content:
1. Navigate to `content/2026.1/index.md`
2. Make your changes
3. Save the file
4. Refresh your browser to see changes (auto-reload enabled)

### Example Edit:
```markdown
# Edit content/2026.1/index.md

## 🚀 Product Updates

Add your technical article here...
```

---

## 💾 Step 5: Submit Your Changes

### A. Create a Feature Branch
```bash
git checkout -b feature/my-newsletter-update
```

### B. Commit Your Changes
```bash
git add content/2026.1/index.md
git commit -m "Update newsletter content for 2026.1"
```

### C. Push Your Branch
```bash
git push origin feature/my-newsletter-update
```

### D. Create Pull Request
1. Go to GitHub repository
2. Click "Pull Requests" → "New Pull Request"
3. Select your branch
4. Add description
5. Submit for review

---

## 📚 What You Need to Know

### File Structure:
```
channel-newsletter/
├── content/2026.1/        # Current newsletter content
│   └── index.md           # Main newsletter page
├── templates/             # Article templates
├── mkdocs.yml             # Configuration
└── requirements.txt       # Python dependencies
```

### Key Files to Edit:
- **Newsletter Content**: `content/2026.1/index.md`
- **Templates**: `templates/blank-technical-article.md`
- **Configuration**: `mkdocs.yml` (rarely needed)

---

## 🆘 Troubleshooting

### Issue: Port 8000 already in use
```bash
# Use a different port
mkdocs serve -a localhost:8001
```

### Issue: Python dependencies not found
```bash
# Make sure virtual environment is activated
source .venv/bin/activate  # macOS/Linux
.venv\Scripts\activate     # Windows

# Reinstall dependencies
pip install -r requirements.txt
```

### Issue: Git push rejected
```bash
# The main branch is protected
# Always work on a feature branch
git checkout -b feature/my-changes
```

---

## 📖 Next Steps

Once you're comfortable with the basics:

1. **Read**: `CONTRIBUTING.md` - Full contribution guidelines
2. **Review**: `templates/AUTHOR_GUIDE.md` - How to write technical articles
3. **Explore**: `docs/project/` - Project documentation
4. **Learn**: Run `scripts/core/publish-newsletter.sh --help` for publishing

---

## 💡 Tips for Success

✅ **DO:**
- Work on feature branches
- Test locally before pushing
- Follow the article templates
- Write clear commit messages
- Ask questions if stuck

❌ **DON'T:**
- Commit directly to main branch
- Skip local testing
- Ignore the templates
- Force push to shared branches

---

## 🤝 Need Help?

- **Questions?** Open an issue on GitHub
- **Email**: cse-newsletter@arista.com
- **Documentation**: Check `templates/` folder for guides

---

## ⚡ TL;DR - Absolute Minimum

```bash
# 1. Clone
git clone https://github.com/arista-channel/channel-newsletter.git
cd channel-newsletter

# 2. Install
pip install mkdocs mkdocs-material mike

# 3. Preview
mkdocs serve

# 4. Edit
# Edit content/2026.1/index.md

# 5. Contribute
git checkout -b feature/my-update
git add .
git commit -m "Update newsletter"
git push origin feature/my-update
# Then create PR on GitHub
```

**That's it! You're ready to contribute! 🎉**

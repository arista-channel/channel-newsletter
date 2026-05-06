# 📰 Channel Newsletter

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live-brightgreen)](https://arista-channel.github.io/channel-newsletter/)
[![MkDocs](https://img.shields.io/badge/MkDocs-Material-blue)](https://squidfunk.github.io/mkdocs-material/)
[![Mike Versioning](https://img.shields.io/badge/Mike-Versioning-orange)](https://github.com/jimporter/mike)
[![UV](https://img.shields.io/badge/UV-Environment-purple)](https://github.com/astral-sh/uv)
[![Branch Protected](https://img.shields.io/badge/Branch-Protected-red)](docs/BRANCH_PROTECTION.md)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Professional quarterly newsletter platform** with automated version control, featuring **Mike versioning system**, **UV environment management**, and **GitHub Pages deployment**. Each quarterly edition is automatically archived and protected from future changes.

## 🌟 Key Features

### 📅 **Quarterly Newsletter Schedule**
- **Release Schedule**: 2nd week of March, June, September, and December (every 3 months)
- **Version Format**: `Mar.2026`, `Jun.2026`, `Sep.2026`, `Dec.2026`, etc.
- **Archive Protection**: Published versions are protected from overwrites
- **Automated Dating**: Smart date calculation for consistent releases

### 🚀 **Advanced Version Control**
- **Mike Integration**: Professional version management with MkDocs
- **Protected Versions**: Prevent accidental overwrites of published content
- **Version Aliases**: Support for `latest`, `stable`, and custom aliases
- **Archive System**: Automatic archiving of all published editions

### ⚡ **Modern Development Stack**
- **UV Environment**: Fast Python package management
- **MkDocs Material**: Beautiful, responsive documentation theme
- **GitHub Pages**: Automated deployment and hosting
- **Smart Automation**: Intelligent content management and deployment

## 🚀 Quick Start

**New Contributors:** See **[QUICKSTART.md](QUICKSTART.md)** for a detailed 5-minute getting started guide.

### Prerequisites

- **Python 3.8+**
- **Git**
- **UV Package Manager** (recommended)
- **GitHub account** (for deployment)

### 1. Clone and Setup

```bash
# Clone the repository
git clone https://github.com/arista-channel/channel-newsletter.git
cd channel-newsletter

# Set up UV environment (recommended)
curl -LsSf https://astral.sh/uv/install.sh | sh
uv venv .venv
source .venv/bin/activate  # macOS/Linux
# or .venv\Scripts\activate  # Windows

# Install dependencies
uv pip install -r requirements.txt
```

### 2. Initialize Newsletter System

```bash
# Initialize Mike version control and create first newsletter
./scripts/newsletter-manager.sh init

# Create your first newsletter edition
./scripts/newsletter-manager.sh create Mar.2026
```

### 3. Local Development

```bash
# Start local development server
./scripts/newsletter-manager.sh serve

# Visit: http://localhost:8000/
```

### 4. Setup Branch Protection (Recommended)

```bash
# Install local git hooks to prevent accidental commits to main
bash scripts/install-git-hooks.sh

# Setup GitHub branch protection rules (requires admin access)
bash scripts/setup-branch-protection.sh
```

📖 **See [Branch Protection Guide](docs/BRANCH_PROTECTION.md) for complete setup instructions**

### 5. Deploy to GitHub Pages

```bash
# Deploy current version
./scripts/newsletter-manager.sh deploy Mar.2026

# Set as default version
./scripts/newsletter-manager.sh set-default Mar.2026
```

## 🛡️ Branch Protection

The `main` branch is protected to prevent unintentional commits and ensure quality. All changes must go through Pull Requests.

### Quick Setup

```bash
# Install local protection (prevents accidental commits)
bash scripts/install-git-hooks.sh

# Enable GitHub protection (requires admin access)
bash scripts/setup-branch-protection.sh
```

### Contribution Workflow

```bash
# 1. Create feature branch
git checkout -b feature/my-feature

# 2. Make changes and commit
git add .
git commit -m "✨ feat: Add new feature"

# 3. Push and create PR
git push origin feature/my-feature
# Then create Pull Request on GitHub
```

📖 **Full documentation:** [Branch Protection Guide](docs/BRANCH_PROTECTION.md) | [Contributing Guidelines](CONTRIBUTING.md)

## 🛠️ Newsletter Manager Commands

### Core Operations

```bash
# Initialize the newsletter system
./scripts/newsletter-manager.sh init

# Create new newsletter edition
./scripts/newsletter-manager.sh create <version>

# Deploy newsletter version
./scripts/newsletter-manager.sh deploy <version> [description]

# Deploy locally only (no GitHub push)
./scripts/newsletter-manager.sh deploy-local <version> [description]

# Set default version
./scripts/newsletter-manager.sh set-default <version>
```

### Development & Testing

```bash
# Start local development server
./scripts/newsletter-manager.sh serve [version]

# Check system status
./scripts/newsletter-manager.sh status

# List all versions
./scripts/newsletter-manager.sh list

# Validate newsletter content
./scripts/newsletter-manager.sh validate <version>
```

### Content Management

```bash
# Archive old version
./scripts/newsletter-manager.sh archive <version>

# Create backup
./scripts/newsletter-manager.sh backup

# Sync with GitHub
./scripts/newsletter-manager.sh sync
```

## 📁 Project Structure

```
channel-newsletter/
├── content/                       # Newsletter content by version
│   ├── Jan.2026/                 # January 2026 edition
│   │   ├── index.md              # Main newsletter content
│   │   ├── current-issue.md      # Current issue details
│   │   └── assets/               # Images, attachments
│   └── templates/                # Newsletter templates
├── docs/                         # Generated documentation
│   ├── stylesheets/              # Custom CSS
│   ├── javascripts/              # Custom JavaScript
│   └── assets/                   # Static assets
├── scripts/                      # Automation scripts
│   ├── newsletter-manager.sh     # Main management script
│   ├── setup-newsletter.sh       # Initial setup
│   └── utils/                    # Utility scripts
├── logs/                         # Operation logs
├── .venv/                        # UV virtual environment
├── requirements.txt              # Python dependencies
├── mkdocs.yml                    # MkDocs configuration
└── README.md                     # This file
```

## 📅 Newsletter Schedule & Versioning

### 2026 Quarterly Release Schedule

| Quarter | Month | Version | Release Week | Status |
|---------|-------|---------|--------------|--------|
| Q1 2026 | March | `Mar.2026` | 2nd week of March | 🚀 Ready |
| Q2 2026 | June | `Jun.2026` | 2nd week of June | 📝 Planned |
| Q3 2026 | September | `Sep.2026` | 2nd week of September | 📝 Planned |
| Q4 2026 | December | `Dec.2026` | 2nd week of December | 📝 Planned |

**Publishing Frequency**: Quarterly (every 3 months)
**Release Pattern**: 2nd week of March, June, September, and December

### Version Protection

- **Protected Versions**: Published newsletters cannot be overwritten
- **Archive System**: All versions are automatically archived
- **Rollback Support**: Easy rollback to previous versions if needed
- **Alias Management**: Support for `latest`, `stable`, and custom aliases

## 🎨 Customization

### Theme Customization

Edit `docs/stylesheets/extra.css` for custom styling:

```css
/* Newsletter header styling */
.newsletter-header {
    background: linear-gradient(135deg, #1976d2, #42a5f5);
    color: white;
    padding: 2rem;
    border-radius: 8px;
}

/* Custom highlight boxes */
.highlight-box {
    background: #f5f5f5;
    border-left: 4px solid #1976d2;
    padding: 1rem;
    margin: 1rem 0;
}
```

### Content Templates

Newsletter templates are stored in `content/templates/`:

- `newsletter-template.md` - Standard monthly newsletter
- `special-edition-template.md` - Special announcements
- `archive-entry-template.md` - Archive page entries

### Configuration

Key settings in `mkdocs.yml`:

```yaml
site_name: Channel Newsletter
theme:
  name: material
  palette:
    primary: blue
    accent: indigo

extra:
  version:
    provider: mike
    default: latest
```

## 🧪 Testing Workflows

### Local Testing

```bash
# Create test version
./scripts/newsletter-manager.sh create Test.2026

# Deploy locally
./scripts/newsletter-manager.sh deploy-local Test.2026

# Test with development server
./scripts/newsletter-manager.sh serve Test.2026
```

### GitHub Pages Testing

```bash
# Deploy to GitHub for testing
./scripts/newsletter-manager.sh deploy Test.2026 "Testing version"

# Visit: https://mbalagot12.github.io/channel-newsletter/Test.2026/
```

### Production Deployment

```bash
# Deploy production version
./scripts/newsletter-manager.sh deploy Jan.2026 "January 2026 Newsletter"

# Set as default
./scripts/newsletter-manager.sh set-default Jan.2026
```

## 🔧 Troubleshooting

### Common Issues

#### UV Environment Issues
```bash
# Reinstall UV environment
rm -rf .venv
uv venv .venv
source .venv/bin/activate
uv pip install -r requirements.txt
```

#### Git Repository Issues
```bash
# Check git status
git status

# Add GitHub remote if missing
git remote add origin https://github.com/mbalagot12/channel-newsletter.git
```

#### Mike Version Issues
```bash
# List current versions
mike list

# Reset Mike if needed
rm -rf site/
./scripts/newsletter-manager.sh init
```

#### Port Conflicts
```bash
# The newsletter manager handles port conflicts automatically
# It will try ports 8000, 8001, 8002, etc.
./scripts/newsletter-manager.sh serve
```

### Getting Help

```bash
# Show all available commands
./scripts/newsletter-manager.sh help

# Check system status
./scripts/newsletter-manager.sh status

# View logs
tail -f logs/newsletter-*.log
```

## 🌐 Live Newsletter Access

### Production Platforms

- **🌐 Main Site**: [https://mbalagot12.github.io/channel-newsletter/](https://mbalagot12.github.io/channel-newsletter/)
- **📦 Current Version**: [https://mbalagot12.github.io/channel-newsletter/Jan.2026/](https://mbalagot12.github.io/channel-newsletter/Jan.2026/)
- **📚 Archive**: [https://mbalagot12.github.io/channel-newsletter/archive/](https://mbalagot12.github.io/channel-newsletter/archive/)

### Version Navigation

- **Version Selector**: Available on all pages
- **Direct Access**: `https://mbalagot12.github.io/channel-newsletter/[version]/`
- **Latest Version**: Always available at root URL

## 🚀 Advanced Features

### Automated Content Management

- **Smart Templates**: Automatic template application for new newsletters
- **Asset Management**: Organized asset storage by version
- **Link Validation**: Automatic checking of internal and external links
- **SEO Optimization**: Built-in SEO features with Material theme

### Integration Capabilities

- **Email Integration**: Ready for email newsletter distribution
- **Analytics**: Google Analytics integration support
- **Social Sharing**: Built-in social media sharing buttons
- **RSS Feeds**: Automatic RSS feed generation

### Backup & Recovery

- **Automatic Backups**: Regular backups of all content
- **Version Recovery**: Easy recovery of any previous version
- **Content Export**: Export newsletters to various formats
- **Migration Tools**: Tools for migrating from other platforms

## 📚 Documentation

### Complete Guide Collection

- **[SETUP_GUIDE.md](docs/SETUP_GUIDE.md)**: Detailed setup instructions
- **[CONTENT_GUIDE.md](docs/CONTENT_GUIDE.md)**: Content creation guidelines
- **[DEPLOYMENT_GUIDE.md](docs/DEPLOYMENT_GUIDE.md)**: Deployment procedures
- **[CUSTOMIZATION_GUIDE.md](docs/CUSTOMIZATION_GUIDE.md)**: Theme and styling guide
- **[TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)**: Common issues and solutions

### External Resources

- [MkDocs Documentation](https://www.mkdocs.org/)
- [MkDocs Material Theme](https://squidfunk.github.io/mkdocs-material/)
- [Mike Versioning](https://github.com/jimporter/mike)
- [UV Package Manager](https://github.com/astral-sh/uv)

## 🤝 Contributing

We welcome contributions! To contribute:

1. **Fork the repository**
2. **Create feature branch**: `git checkout -b feature/amazing-feature`
3. **Make changes and test**: `./scripts/newsletter-manager.sh validate`
4. **Commit changes**: `git commit -m "Add amazing feature"`
5. **Push to branch**: `git push origin feature/amazing-feature`
6. **Submit pull request**

### Development Guidelines

- Follow existing code style and conventions
- Test all changes locally before submitting
- Update documentation for new features
- Add appropriate logging for new functionality

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Contributors

### Project Maintainer

- **Miguel Balagot** ([mbalagot@arista.com](mailto:mbalagot@arista.com))
  - *Lead Developer & Newsletter Manager*
  - *Arista Networks Channel Partner Team*

### Recent Enhancements (2025)

- ✅ **UV Environment Integration**: Modern Python package management
- ✅ **Mike Version Control**: Professional newsletter versioning
- ✅ **Automated Scheduling**: Smart release date calculation
- ✅ **GitHub Pages Deployment**: Seamless hosting integration
- ✅ **Content Protection**: Archive system with overwrite protection
- ✅ **Enhanced Automation**: Comprehensive management scripts
- ✅ **Professional Theming**: Material Design with custom styling

## 📞 Support

### Getting Help

- **📧 Email**: [mbalagot@arista.com](mailto:mbalagot@arista.com)
- **🐛 Issues**: [GitHub Issues](https://github.com/mbalagot12/channel-newsletter/issues)
- **💬 Discussions**: [GitHub Discussions](https://github.com/mbalagot12/channel-newsletter/discussions)

### Newsletter Content

For newsletter content suggestions, corrections, or submissions:

- **Content Team**: [newsletter@arista.com](mailto:newsletter@arista.com)
- **Technical Issues**: Use GitHub Issues for technical problems
- **Feature Requests**: Use GitHub Discussions for new feature ideas

---

## 🎯 Quick Commands Reference

### **🚀 Essential Commands**

```bash
# Complete setup from scratch
git clone https://github.com/mbalagot12/channel-newsletter.git
cd channel-newsletter && ./scripts/newsletter-manager.sh init

# Create and deploy new newsletter
./scripts/newsletter-manager.sh create Jan.2026
./scripts/newsletter-manager.sh deploy Jan.2026 "January 2026 Newsletter"

# Local development
./scripts/newsletter-manager.sh serve    # Start development server
./scripts/newsletter-manager.sh status  # Check system status
```

### **📊 Monitoring & Management**

```bash
# Version management
./scripts/newsletter-manager.sh list              # List all versions
./scripts/newsletter-manager.sh set-default <version>  # Set default
./scripts/newsletter-manager.sh archive <version>      # Archive version

# System maintenance
./scripts/newsletter-manager.sh backup            # Create backup
./scripts/newsletter-manager.sh sync             # Sync with GitHub
tail -f logs/newsletter-*.log                    # View logs
```

---

## 🎉 **Your Professional Newsletter Platform is Ready!**

### **✅ What's Included:**
- 📰 **Professional newsletter system** with version control
- 🚀 **Automated deployment** to GitHub Pages
- 📅 **Smart scheduling** for monthly releases
- 🛡️ **Content protection** and archiving
- ⚡ **Modern development stack** with UV and MkDocs
- 🎨 **Beautiful Material Design** theme

### **🎯 Next Steps:**
1. **Initialize**: Run `./scripts/newsletter-manager.sh init`
2. **Create content**: Edit your first newsletter in `content/Jan.2026/`
3. **Deploy**: Run `./scripts/newsletter-manager.sh deploy Jan.2026`
4. **Go live**: Visit your newsletter at GitHub Pages

**Your professional newsletter platform is now ready for monthly publications!** 📰✨

---

*Built with ❤️ using [MkDocs](https://www.mkdocs.org/), [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/), [Mike](https://github.com/jimporter/mike), and [UV](https://github.com/astral-sh/uv)*
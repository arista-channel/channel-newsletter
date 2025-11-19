#!/bin/bash

# Newsletter Setup Script with UV Environment
# One-time setup for the newsletter project with Mike version control

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
VENV_DIR="$PROJECT_ROOT/.venv"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

print_header() {
    echo -e "\n${CYAN}================================${NC}"
    echo -e "${CYAN}$1${NC}"
    echo -e "${CYAN}================================${NC}\n"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Install UV if not present
install_uv() {
    if ! command -v uv &> /dev/null; then
        print_info "UV not found. Installing UV..."
        curl -LsSf https://astral.sh/uv/install.sh | sh
        
        # Add UV to PATH for current session
        export PATH="$HOME/.cargo/bin:$PATH"
        
        # Verify installation
        if command -v uv &> /dev/null; then
            print_success "UV installed successfully"
        else
            print_error "UV installation failed. Please install manually:"
            echo "curl -LsSf https://astral.sh/uv/install.sh | sh"
            exit 1
        fi
    else
        print_success "UV is already installed"
    fi
}

# Setup UV virtual environment
setup_uv_environment() {
    print_info "Setting up UV virtual environment..."
    
    cd "$PROJECT_ROOT"
    
    # Create virtual environment
    if [ ! -d "$VENV_DIR" ]; then
        print_info "Creating UV virtual environment..."
        uv venv .venv
        print_success "Virtual environment created"
    else
        print_info "Virtual environment already exists"
    fi
    
    # Install dependencies
    print_info "Installing dependencies with UV..."
    uv pip install -r requirements.txt
    print_success "Dependencies installed"
    
    # Show installed packages
    print_info "Installed packages:"
    uv pip list
}

print_header "NEWSLETTER PROJECT SETUP WITH UV"

cd "$PROJECT_ROOT"

# Install UV
install_uv

# Create necessary directories
print_info "Creating project directories..."
mkdir -p content
mkdir -p logs
mkdir -p docs/assets/images
mkdir -p .github/workflows

# Make scripts executable
print_info "Making scripts executable..."
chmod +x scripts/*.sh

# Create requirements.txt with all necessary packages
print_info "Creating requirements.txt..."
cat > requirements.txt << EOF
# MkDocs and theme
mkdocs>=1.5.0
mkdocs-material>=9.0.0

# Mike for version control
mike>=2.0.0

# Extensions
pymdown-extensions>=10.0.0
mkdocs-minify-plugin>=0.7.0

# Additional useful plugins
mkdocs-git-revision-date-plugin>=0.3.2
mkdocs-glightbox>=0.3.4
mkdocs-print-site-plugin>=2.3.4
EOF

# Setup UV environment
setup_uv_environment

# Initialize git if not already done
if [ ! -d ".git" ]; then
    print_info "Initializing git repository..."
    git init
    git add .
    git commit -m "Initial newsletter project setup with UV"
fi

# Create Mike configuration
print_info "Creating Mike configuration..."
cat > .mike.yml << EOF
# Mike configuration for newsletter versioning
remote: origin
branch: gh-pages
EOF

# Update mkdocs.yml for Mike compatibility
print_info "Updating mkdocs.yml for Mike version control..."
cat > mkdocs.yml << EOF
site_name: Channel Newsletter
site_url: https://yourusername.github.io/channel-newsletter/
site_description: Professional monthly newsletter with version control
site_author: Your Organization

repo_name: yourusername/channel-newsletter
repo_url: https://github.com/yourusername/channel-newsletter
edit_uri: edit/main/docs/

theme:
  name: material
  palette:
    - scheme: default
      primary: blue
      accent: indigo
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode
    - scheme: slate
      primary: blue
      accent: indigo
      toggle:
        icon: material/brightness-4
        name: Switch to light mode
  
  favicon: assets/images/favicon.png
  logo: assets/images/logo.png
  
  features:
    - navigation.tabs
    - navigation.sections
    - navigation.top
    - navigation.tracking
    - search.highlight
    - search.suggest
    - content.code.copy

extra_css:
  - stylesheets/extra.css

extra_javascript:
  - javascripts/extra.js

markdown_extensions:
  - abbr
  - attr_list
  - admonition
  - def_list
  - footnotes
  - meta
  - tables
  - toc:
      permalink: true
  - pymdownx.details
  - pymdownx.superfences
  - pymdownx.tasklist:
      custom_checkbox: true

nav:
  - Home: index.md
  - Current Issue: current-issue.md
  - Archive: archive.md
  - About: about.md

plugins:
  - search
  - minify:
      minify_html: true

copyright: Copyright &copy; 2024-2026 Your Organization. All rights reserved.

extra:
  version:
    provider: mike
    default: latest
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/yourusername
    - icon: fontawesome/solid/envelope
      link: mailto:newsletter@yourcompany.com
EOF

# Create initial docs structure for Mike
print_info "Creating initial documentation structure..."

# Create overrides directory and basic custom files
mkdir -p overrides
mkdir -p docs/stylesheets
mkdir -p docs/javascripts

# Create basic custom CSS
cat > docs/stylesheets/extra.css << EOF
/* Custom styles for newsletter */
.newsletter-header {
    background: linear-gradient(135deg, #1976d2, #42a5f5);
    color: white;
    padding: 2rem;
    border-radius: 8px;
    margin-bottom: 2rem;
}

.newsletter-date {
    font-style: italic;
    color: #666;
    margin-bottom: 1rem;
}

.highlight-box {
    background: #f5f5f5;
    border-left: 4px solid #1976d2;
    padding: 1rem;
    margin: 1rem 0;
}
EOF

# Create basic custom JavaScript
cat > docs/javascripts/extra.js << EOF
// Custom JavaScript for newsletter
document.addEventListener('DOMContentLoaded', function() {
    console.log('Newsletter loaded with UV environment');
});
EOF

cat > docs/index.md << EOF
# Channel Newsletter

Welcome to our monthly channel newsletter with version control powered by UV!

## Current Issue

The latest newsletter issue is always available at the current version.

## Version History

Use the version selector (top of page) to browse previous newsletter issues. Each month's newsletter is archived and protected from changes.

## Publication Schedule

- **Frequency**: Monthly
- **Publication**: 2nd Tuesday of each month
- **First Issue**: January 2026
- **Format**: Month.Year (e.g., Jan.2026, Feb.2026)

## Development Environment

This project uses UV for fast Python package management:
- **Virtual Environment**: .venv/
- **Package Manager**: UV (faster than pip)
- **Dependencies**: Managed via requirements.txt

## Subscribe

Stay informed with our monthly updates delivered directly to your inbox.

Contact: newsletter@yourcompany.com
EOF

cat > docs/current-issue.md << EOF
# Current Newsletter Issue

This page will contain the current month's newsletter content.

Use the newsletter manager script to create and deploy monthly issues:

\`\`\`bash
# Create next month's newsletter
./scripts/newsletter-manager.sh create-next

# Deploy a newsletter version
./scripts/newsletter-manager.sh deploy Jan.2026

# Check UV environment status
./scripts/newsletter-manager.sh env-status
\`\`\`

## Version Control with UV

Each newsletter issue is version-controlled using Mike with UV environment:
- Previous issues are archived and read-only
- Version selector allows browsing all issues
- Each version has its own URL path
- Fast dependency management with UV

## Development Workflow

1. **Environment Setup**: UV creates and manages virtual environment
2. **Content Creation**: Templates generated for each month
3. **Version Control**: Mike handles version archiving
4. **Deployment**: Automated deployment to GitHub Pages

EOF

cat > docs/archive.md << EOF
# Newsletter Archive

Browse previous newsletter issues using the version selector at the top of the page.

## Available Versions

All published newsletter versions are listed in the version selector. Each version represents a monthly issue that has been archived and is read-only.

## Version Format

- **Jan.2026** - January 2026 issue
- **Feb.2026** - February 2026 issue
- And so on...

## Search Archive

Use the search function to find specific topics across all newsletter versions.

## Technical Details

- **Environment**: UV virtual environment (.venv/)
- **Version Control**: Mike for documentation versioning
- **Deployment**: GitHub Pages with automated workflows
EOF

# Create UV-optimized GitHub Actions workflow
print_info "Creating GitHub Actions workflow for UV..."
cat > .github/workflows/deploy.yml << EOF
name: Deploy Newsletter with UV

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'

      - name: Install UV
        run: |
          curl -LsSf https://astral.sh/uv/install.sh | sh
          echo "\$HOME/.cargo/bin" >> \$GITHUB_PATH

      - name: Set up UV environment
        run: |
          uv venv .venv
          echo "VIRTUAL_ENV=.venv" >> \$GITHUB_ENV
          echo "PATH=.venv/bin:\$PATH" >> \$GITHUB_ENV

      - name: Install dependencies
        run: |
          uv pip install -r requirements.txt

      - name: Configure Git
        run: |
          git config --global user.name "GitHub Actions"
          git config --global user.email "actions@github.com"

      - name: Deploy with Mike
        run: |
          mike deploy --push --update-aliases \${GITHUB_REF#refs/heads/} latest
          mike set-default latest

  deploy:
    if: github.ref == 'refs/heads/main'
    environment:
      name: github-pages
      url: \${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v2
EOF

# Create .gitignore with UV-specific entries
print_info "Creating .gitignore..."
cat > .gitignore << EOF
# UV and Python
.venv/
__pycache__/
*.py[cod]
*\$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# MkDocs
site/

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Logs
logs/
*.log

# Mike
.mike.yml.bak
EOF

print_success "Newsletter project setup complete with UV!"

print_header "UV ENVIRONMENT VERIFICATION"
echo "UV Version: $(uv --version)"
echo "Virtual Environment: $VENV_DIR"
echo "Python Version: $(source .venv/bin/activate && python --version)"

print_header "NEXT STEPS"
echo "1. Initialize Mike version control:"
echo "   ./scripts/newsletter-manager.sh init"
echo ""
echo "2. Create 2026 newsletter templates:"
echo "   ./scripts/newsletter-manager.sh init-year 2026"
echo ""
echo "3. View publication schedule:"
echo "   ./scripts/newsletter-manager.sh schedule 2026"
echo ""
echo "4. Check UV environment:"
echo "   ./scripts/newsletter-manager.sh env-status"
echo ""
echo "5. Test locally:"
echo "   ./scripts/newsletter-manager.sh serve"
echo ""
echo "6. Deploy first newsletter:"
echo "   ./scripts/newsletter-manager.sh deploy Jan.2026"

print_warning "Don't forget to:"
echo "- Add your logo.png and favicon.png to docs/assets/images/"
echo "- Update company information in mkdocs.yml"
echo "- Set up GitHub repository and enable GitHub Pages"
echo "- The UV virtual environment is ready at .venv/"

print_success "UV environment is active and ready for development!"

#!/bin/bash

# Deploy newsletter to GitHub Pages
set -e

echo "🚀 Deploying newsletter to GitHub Pages..."

# Ensure we're in the project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_ROOT"

# Check if UV environment exists
if [ ! -d ".venv" ]; then
    echo "📦 Setting up UV environment..."
    uv venv .venv
    source .venv/bin/activate
    uv pip install -r requirements.txt
else
    source .venv/bin/activate
fi

# Initialize Mike if needed
if [ ! -f ".mike.yml" ]; then
    echo "⚙️ Initializing Mike version control..."
    cat > .mike.yml << EOF
remote: origin
branch: gh-pages
EOF
fi

# Create initial newsletter content if it doesn't exist
if [ ! -d "content/Jan.2026" ]; then
    echo "📝 Creating initial newsletter content..."
    mkdir -p content/Jan.2026
    cat > content/Jan.2026/index.md << EOF
# Channel Newsletter - January 2026

Welcome to our professional monthly newsletter!

## This Month's Highlights

- Newsletter platform successfully deployed
- Professional documentation system active
- Version control and archiving enabled

## Next Steps

- Add your newsletter content here
- Customize the theme and styling
- Set up automated monthly releases

---

*Published: January 2026 | Version: Jan.2026*
EOF
fi

# Build and deploy with Mike
echo "🏗️ Building and deploying with Mike..."
mike deploy Jan.2026 latest --push --update-aliases

# Set as default
mike set-default latest --push

echo "✅ Newsletter deployed successfully!"
echo ""
echo "🌐 Your newsletter is now live at:"
echo "   https://mbalagot12.github.io/channel-newsletter/"
echo ""
echo "📝 Edit content in: content/Jan.2026/index.md"
echo "🔄 Redeploy with: ./scripts/deploy-to-github-pages.sh"
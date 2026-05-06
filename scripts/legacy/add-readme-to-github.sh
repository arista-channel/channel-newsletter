#!/bin/bash

# Add README.md to GitHub repository
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

echo "📝 Adding README.md to GitHub repository..."

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Not a git repository. Initializing..."
    git init
    echo "✅ Git repository initialized"
fi

# Check if origin exists
if ! git remote get-url origin >/dev/null 2>&1; then
    echo "⚠️  No 'origin' remote found. Adding GitHub repository..."
    git remote add origin https://github.com/mbalagot12/channel-newsletter.git
    echo "✅ Added origin remote"
fi

# Add and commit README.md
echo "📄 Adding README.md to repository..."
git add README.md

# Check if there are other changes to commit
if git diff --cached --quiet; then
    echo "ℹ️  README.md is already up to date"
else
    git commit -m "📝 Add comprehensive README.md with complete documentation

- Professional newsletter platform documentation
- Complete setup and usage instructions  
- Advanced features and customization guide
- Troubleshooting and support information
- Quick reference commands
- Project structure and architecture details"

    echo "✅ README.md committed to repository"
fi

# Push to GitHub
echo "🚀 Pushing to GitHub..."
if git push origin main; then
    echo "✅ README.md successfully pushed to GitHub!"
    echo ""
    echo "🌐 View your repository at:"
    echo "   https://github.com/mbalagot12/channel-newsletter"
    echo ""
    echo "📖 Your professional README.md is now live on GitHub!"
else
    echo "⚠️  Push failed. You may need to create the repository first:"
    echo "   gh repo create channel-newsletter --public"
    echo "   Or create it manually at: https://github.com/new"
fi
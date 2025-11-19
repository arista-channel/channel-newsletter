#!/bin/bash

# Fix git setup for newsletter deployment
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

echo "🔧 Fixing git setup for deployment..."

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Not a git repository. Initializing..."
    git init
    echo "✅ Git repository initialized"
fi

# Check if origin exists
if ! git remote get-url origin >/dev/null 2>&1; then
    echo "⚠️  No 'origin' remote found."
    echo ""
    echo "Please add your GitHub repository as origin:"
    echo "  git remote add origin https://github.com/yourusername/channel-newsletter.git"
    echo ""
    echo "Or if you want to deploy locally only, use:"
    echo "  ./scripts/newsletter-manager.sh deploy-local Jan.2026"
    echo ""
    read -p "Enter your GitHub repository URL (or press Enter to skip): " REPO_URL
    
    if [ -n "$REPO_URL" ]; then
        git remote add origin "$REPO_URL"
        echo "✅ Added origin: $REPO_URL"
        
        # Test connection
        if git ls-remote origin >/dev/null 2>&1; then
            echo "✅ Connection to origin successful"
        else
            echo "⚠️  Cannot connect to origin. Check your credentials and repository access."
        fi
    else
        echo "⏭️  Skipped adding origin. Use local deployment instead."
    fi
else
    ORIGIN_URL=$(git remote get-url origin)
    echo "✅ Origin already configured: $ORIGIN_URL"
    
    # Test connection
    if git ls-remote origin >/dev/null 2>&1; then
        echo "✅ Connection to origin successful"
    else
        echo "⚠️  Cannot connect to origin. Check your credentials."
    fi
fi

echo ""
echo "🚀 Next steps:"
echo "   1. For GitHub deployment: ./scripts/newsletter-manager.sh deploy Jan.2026"
echo "   2. For local deployment: ./scripts/newsletter-manager.sh deploy-local Jan.2026"
echo "   3. To serve locally: ./scripts/newsletter-manager.sh serve"
#!/bin/bash

# Fix Mike setup for newsletter
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

echo "🔧 Fixing Mike setup..."

# Activate UV environment
if [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
    echo "✅ UV environment activated"
else
    echo "❌ UV environment not found. Run setup first."
    exit 1
fi

# Check if we have any versions
VERSIONS=$(mike list 2>/dev/null || echo "")

if [ -z "$VERSIONS" ]; then
    echo "📝 No versions found. Creating initial version..."
    
    # Deploy first version
    mike deploy Jan.2026 "Initial newsletter version"
    
    # Set as default
    mike set-default Jan.2026
    
    echo "✅ Created and set Jan.2026 as default version"
else
    echo "📋 Existing versions found:"
    mike list
    
    # Check if default is set
    if mike list | grep -q "default"; then
        echo "✅ Default version already set"
    else
        echo "⚠️  No default version set. Setting first available version as default..."
        FIRST_VERSION=$(mike list | head -1 | awk '{print $1}')
        mike set-default "$FIRST_VERSION"
        echo "✅ Set $FIRST_VERSION as default"
    fi
fi

echo ""
echo "🚀 Now you can run:"
echo "   ./scripts/newsletter-manager.sh serve"
echo ""
echo "📍 Visit: http://localhost:8000/"
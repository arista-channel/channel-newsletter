#!/bin/bash

# Newsletter Publishing Script
# This script helps publish a new newsletter version and archive the previous one
# Usage: ./scripts/publish-newsletter.sh <new_version>
# Example: ./scripts/publish-newsletter.sh 2026.2

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored messages
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

# Check if version argument is provided
if [ -z "$1" ]; then
    print_error "No version specified!"
    echo "Usage: $0 <new_version>"
    echo "Example: $0 2026.2"
    exit 1
fi

NEW_VERSION="$1"

# Validate version format (YYYY.Q where Q is 1-4)
if ! [[ "$NEW_VERSION" =~ ^[0-9]{4}\.[1-4]$ ]]; then
    print_error "Invalid version format: $NEW_VERSION"
    echo "Version must be in format YYYY.Q (e.g., 2026.2)"
    exit 1
fi

# Check if content directory exists
if [ ! -d "content/$NEW_VERSION" ]; then
    print_error "Content directory not found: content/$NEW_VERSION"
    echo "Please create the content directory first with the newsletter content."
    exit 1
fi

print_info "Publishing Newsletter Version $NEW_VERSION"
echo ""

# Get current latest version
CURRENT_VERSION=$(uv run mike list | grep -v "^$" | head -n 1 | awk '{print $1}')

if [ -n "$CURRENT_VERSION" ]; then
    print_info "Current version: $CURRENT_VERSION"
    print_warning "This version will be archived (no longer marked as 'latest')"
    echo ""
    read -p "Continue? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Publishing cancelled."
        exit 0
    fi
fi

# Update mkdocs.yml to point to new version
print_info "Updating mkdocs.yml to point to content/$NEW_VERSION..."
sed -i '' "s|docs_dir: content/.*|docs_dir: content/$NEW_VERSION|g" mkdocs.yml
print_success "mkdocs.yml updated"

# Deploy new version as latest
print_info "Deploying version $NEW_VERSION as 'latest'..."
uv run mike deploy "$NEW_VERSION" latest --update-aliases --ignore-remote-status
print_success "Version $NEW_VERSION deployed"

# Set as default version
print_info "Setting $NEW_VERSION as default version..."
uv run mike set-default "$NEW_VERSION" --ignore-remote-status
print_success "Default version set to $NEW_VERSION"

# Show current versions
echo ""
print_success "Publishing complete! Current versions:"
uv run mike list

echo ""
print_info "Next steps:"
echo "  1. Test locally: uv run mike serve -a 0.0.0.0:8082"
echo "  2. Commit changes: git add -A && git commit -m 'Publish newsletter version $NEW_VERSION'"
echo "  3. Push to GitHub: git push origin main && git push origin gh-pages --force"
echo ""
print_success "Newsletter version $NEW_VERSION is ready to publish!"


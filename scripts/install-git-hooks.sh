#!/bin/bash
# Install Git hooks for local branch protection
# This prevents accidental direct commits to main branch

set -e

REPO_ROOT="$(git rev-parse --show-toplevel)"
HOOKS_DIR="${REPO_ROOT}/.git/hooks"

echo "🔧 Installing Git hooks for branch protection..."

# Create pre-commit hook
cat > "${HOOKS_DIR}/pre-commit" << 'EOF'
#!/bin/bash
# Pre-commit hook to prevent direct commits to main branch

BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null || echo "detached")

if [ "$BRANCH" = "main" ]; then
    echo ""
    echo "❌ ERROR: Direct commits to 'main' branch are not allowed!"
    echo ""
    echo "📋 Please follow this workflow instead:"
    echo "   1. Create a feature branch:"
    echo "      git checkout -b feature/your-feature-name"
    echo ""
    echo "   2. Make your changes and commit:"
    echo "      git add ."
    echo "      git commit -m 'Your commit message'"
    echo ""
    echo "   3. Push your branch:"
    echo "      git push origin feature/your-feature-name"
    echo ""
    echo "   4. Create a Pull Request on GitHub"
    echo ""
    echo "💡 To bypass this check (emergency only):"
    echo "   git commit --no-verify"
    echo ""
    exit 1
fi

exit 0
EOF

# Create pre-push hook
cat > "${HOOKS_DIR}/pre-push" << 'EOF'
#!/bin/bash
# Pre-push hook to warn about pushing to main branch

while read local_ref local_sha remote_ref remote_sha
do
    if [[ "$remote_ref" == "refs/heads/main" ]]; then
        echo ""
        echo "⚠️  WARNING: You are about to push to 'main' branch!"
        echo ""
        read -p "Are you sure you want to continue? (yes/no): " -n 3 -r
        echo ""
        if [[ ! $REPLY =~ ^[Yy][Ee][Ss]$ ]]; then
            echo "❌ Push cancelled."
            exit 1
        fi
    fi
done

exit 0
EOF

# Make hooks executable
chmod +x "${HOOKS_DIR}/pre-commit"
chmod +x "${HOOKS_DIR}/pre-push"

echo "✅ Git hooks installed successfully!"
echo ""
echo "📋 Installed hooks:"
echo "   ✓ pre-commit: Blocks direct commits to main"
echo "   ✓ pre-push: Warns before pushing to main"
echo ""
echo "💡 These hooks run locally on your machine."
echo "   To bypass (emergency only): use --no-verify flag"


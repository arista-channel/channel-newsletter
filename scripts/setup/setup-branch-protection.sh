#!/bin/bash
# Setup Branch Protection for main branch
# This script configures GitHub branch protection rules to prevent unintentional commits

set -e

REPO="arista-channel/channel-newsletter"
BRANCH="main"

echo "🛡️  Setting up branch protection for ${BRANCH} branch..."

# Check if gh CLI is installed and authenticated
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed."
    echo "Install it from: https://cli.github.com/"
    exit 1
fi

# Check authentication
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub CLI."
    echo "Run: gh auth login"
    exit 1
fi

echo "✅ GitHub CLI is authenticated"

# Apply branch protection rules
echo "📋 Applying branch protection rules..."

gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "/repos/${REPO}/branches/${BRANCH}/protection" \
  --input - <<EOF
{
  "required_status_checks": {
    "strict": true,
    "contexts": ["deploy"]
  },
  "enforce_admins": false,
  "required_pull_request_reviews": {
    "dismiss_stale_reviews": true,
    "require_code_owner_reviews": false,
    "required_approving_review_count": 1,
    "require_last_push_approval": false
  },
  "restrictions": null,
  "required_linear_history": true,
  "allow_force_pushes": false,
  "allow_deletions": false,
  "block_creations": false,
  "required_conversation_resolution": true,
  "lock_branch": false,
  "allow_fork_syncing": true
}
EOF

echo ""
echo "✅ Branch protection rules applied successfully!"
echo ""
echo "📋 Protection Summary:"
echo "   ✓ Require pull request reviews (1 approval required)"
echo "   ✓ Dismiss stale reviews when new commits are pushed"
echo "   ✓ Require status checks to pass (deploy workflow)"
echo "   ✓ Require linear history (no merge commits)"
echo "   ✓ Block force pushes"
echo "   ✓ Block branch deletion"
echo "   ✓ Require conversation resolution before merging"
echo ""
echo "🔍 View protection rules at:"
echo "   https://github.com/${REPO}/settings/branches"


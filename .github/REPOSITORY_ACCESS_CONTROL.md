# 🔐 Repository Access Control

## 📊 Current Configuration

### Repository Visibility
- **Status**: 🌍 **PUBLIC**
- **URL**: https://github.com/arista-channel/channel-newsletter
- **GitHub Pages**: https://arista-channel.github.io/channel-newsletter/

### Access Model
✅ **Anyone can:**
- View the repository and all code
- Fork the repository
- Clone the repository
- Submit pull requests
- View GitHub Pages site

🔒 **Only invited collaborators can:**
- Push directly to branches
- Approve and merge pull requests
- Modify repository settings
- Manage GitHub Actions

---

## 🛡️ Branch Protection Rules (main branch)

### ✅ Active Protections

| Protection | Status | Description |
|------------|--------|-------------|
| **Require Pull Request** | ✅ Enabled | All changes must go through PR |
| **Required Approvals** | ✅ 1 Review | At least 1 approval required |
| **Code Owner Review** | ✅ Enabled | CODEOWNERS must approve |
| **Dismiss Stale Reviews** | ✅ Enabled | New commits dismiss old approvals |
| **Conversation Resolution** | ✅ Enabled | All comments must be resolved |
| **Enforce for Admins** | ✅ Enabled | Rules apply to everyone |
| **Force Push** | ❌ Blocked | Cannot force push to main |
| **Branch Deletion** | ❌ Blocked | Cannot delete main branch |

---

## 👥 Code Owners

The following users are designated as code owners and must approve changes:

- **@mbalagot12** - Repository owner and primary reviewer

### Protected Paths
- `*` - All files (default)
- `/.github/workflows/` - GitHub Actions workflows
- `/mkdocs.yml` - MkDocs configuration
- `/requirements.txt` - Python dependencies
- `/pyproject.toml` - Project configuration
- `/scripts/` - Newsletter management scripts
- `/content/` - Newsletter content

See [CODEOWNERS](.github/CODEOWNERS) for details.

---

## 🔄 Contribution Workflow

### For External Contributors (Public)

1. **Fork** the repository
2. **Clone** your fork
3. **Create** a feature branch
4. **Make** your changes
5. **Push** to your fork
6. **Submit** a pull request
7. **Wait** for code owner review
8. **Address** review feedback
9. **Get approval** from code owner
10. **Merge** will be done by maintainers

### For Invited Collaborators

1. **Clone** the repository directly
2. **Create** a feature branch
3. **Make** your changes
4. **Push** to origin
5. **Create** a pull request
6. **Get approval** from code owner
7. **Merge** after approval

---

## 🚫 What's Blocked

- ❌ Direct commits to `main` branch
- ❌ Direct pushes to `main` branch
- ❌ Force pushes to `main` branch
- ❌ Deleting the `main` branch
- ❌ Merging without 1 approval
- ❌ Merging without code owner review
- ❌ Merging with unresolved conversations
- ❌ Bypassing protection rules (even for admins)

---

## ✅ Required for Merging

- ✅ Pull request created
- ✅ At least 1 approval from code owner
- ✅ All conversations resolved
- ✅ No conflicting files
- ✅ Branch is up to date with main

---

## 🔧 Managing Collaborators

### Add a Collaborator
```bash
# Via GitHub CLI
gh api -X PUT repos/arista-channel/channel-newsletter/collaborators/USERNAME \
  -f permission=push

# Or via GitHub Web UI
# Settings → Collaborators → Add people
```

### Remove a Collaborator
```bash
# Via GitHub CLI
gh api -X DELETE repos/arista-channel/channel-newsletter/collaborators/USERNAME

# Or via GitHub Web UI
# Settings → Collaborators → Remove
```

### Collaborator Permission Levels
- **Read**: Can view and fork
- **Triage**: Can manage issues and PRs
- **Write**: Can push to branches (not main)
- **Maintain**: Can manage repo without access to sensitive actions
- **Admin**: Full access to repository

---

## 📞 Support

- **Repository Owner**: @mbalagot12
- **Email**: mbalagot@arista.com
- **Documentation**: See [BRANCH_PROTECTION_QUICK_REFERENCE.md](.github/BRANCH_PROTECTION_QUICK_REFERENCE.md)

---

## 🔄 Last Updated

**Date**: December 13, 2025  
**Updated By**: @mbalagot12  
**Reason**: Changed repository from private to public with enhanced branch protection


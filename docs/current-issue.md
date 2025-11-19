# Current Newsletter Issue

This page will contain the current month's newsletter content.

Use the newsletter manager script to create and deploy monthly issues:

```bash
# Create next month's newsletter
./scripts/newsletter-manager.sh create-next

# Deploy a newsletter version
./scripts/newsletter-manager.sh deploy Jan.2026

# Check UV environment status
./scripts/newsletter-manager.sh env-status
```

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


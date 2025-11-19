#!/bin/bash

# Quick setup script
echo "🚀 Setting up Newsletter Project with Mike Version Control..."

# Make scripts executable
chmod +x scripts/*.sh

# Run the main setup
./scripts/setup-newsletter.sh

echo ""
echo "✅ Setup complete! Run these commands to get started:"
echo ""
echo "1. Initialize Mike: ./scripts/newsletter-manager.sh init"
echo "2. Create 2026 templates: ./scripts/newsletter-manager.sh init-year 2026"
echo "3. View schedule: ./scripts/newsletter-manager.sh schedule 2026"
echo "4. Start development: ./scripts/newsletter-manager.sh serve"
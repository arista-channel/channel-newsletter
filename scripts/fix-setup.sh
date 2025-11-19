#!/bin/bash

# Quick fix script for missing directories
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

echo "🔧 Fixing missing directories and files..."

# Create missing directories
mkdir -p overrides
mkdir -p docs/stylesheets  
mkdir -p docs/javascripts
mkdir -p docs/assets/images

# Create basic custom CSS
cat > docs/stylesheets/extra.css << EOF
/* Custom styles for newsletter */
.newsletter-header {
    background: linear-gradient(135deg, #1976d2, #42a5f5);
    color: white;
    padding: 2rem;
    border-radius: 8px;
    margin-bottom: 2rem;
}

.newsletter-date {
    font-style: italic;
    color: #666;
    margin-bottom: 1rem;
}

.highlight-box {
    background: #f5f5f5;
    border-left: 4px solid #1976d2;
    padding: 1rem;
    margin: 1rem 0;
}
EOF

# Create basic custom JavaScript
cat > docs/javascripts/extra.js << EOF
// Custom JavaScript for newsletter
document.addEventListener('DOMContentLoaded', function() {
    console.log('Newsletter loaded with UV environment');
});
EOF

# Update mkdocs.yml to remove custom_dir reference
cat > mkdocs.yml << EOF
site_name: Channel Newsletter
site_url: https://yourusername.github.io/channel-newsletter/
site_description: Professional monthly newsletter with version control
site_author: Your Organization

repo_name: yourusername/channel-newsletter
repo_url: https://github.com/yourusername/channel-newsletter
edit_uri: edit/main/docs/

theme:
  name: material
  palette:
    - scheme: default
      primary: blue
      accent: indigo
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode
    - scheme: slate
      primary: blue
      accent: indigo
      toggle:
        icon: material/brightness-4
        name: Switch to light mode
  
  features:
    - navigation.tabs
    - navigation.sections
    - navigation.top
    - navigation.tracking
    - search.highlight
    - search.suggest
    - content.code.copy

extra_css:
  - stylesheets/extra.css

extra_javascript:
  - javascripts/extra.js

markdown_extensions:
  - abbr
  - attr_list
  - admonition
  - def_list
  - footnotes
  - meta
  - tables
  - toc:
      permalink: true
  - pymdownx.details
  - pymdownx.superfences
  - pymdownx.tasklist:
      custom_checkbox: true

nav:
  - Home: index.md
  - Current Issue: current-issue.md
  - Archive: archive.md
  - About: about.md

plugins:
  - search
  - minify:
      minify_html: true

copyright: Copyright &copy; 2024-2026 Your Organization. All rights reserved.

extra:
  version:
    provider: mike
    default: latest
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/yourusername
    - icon: fontawesome/solid/envelope
      link: mailto:newsletter@yourcompany.com
EOF

echo "✅ Fixed missing directories and updated mkdocs.yml"
echo "Now run: ./scripts/newsletter-manager.sh init"
#!/bin/bash

# Newsletter Manager Script with Mike Version Control
# Manages monthly newsletter versions starting Jan 2026
# Each month is archived and protected from future changes
# Uses UV for Python environment management

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
LOG_DIR="$PROJECT_ROOT/logs"
LOG_FILE="$LOG_DIR/newsletter-$(date +%Y%m%d-%H%M%S).log"
VENV_DIR="$PROJECT_ROOT/.venv"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Newsletter schedule - 2nd Tuesday of each month
MONTHS=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
START_YEAR=2026

# Initialize logging
init_logging() {
    mkdir -p "$LOG_DIR"
    touch "$LOG_FILE"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Newsletter Manager Started" >> "$LOG_FILE"
}

# Logging function
log() {
    local level=$1
    local message=$2
    echo "$(date '+%Y-%m-%d %H:%M:%S') - [$level] $message" >> "$LOG_FILE"
}

# Print functions
print_header() {
    echo -e "\n${CYAN}================================${NC}"
    echo -e "${CYAN}$1${NC}"
    echo -e "${CYAN}================================${NC}\n"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
    log "INFO" "$1"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
    log "SUCCESS" "$1"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
    log "WARNING" "$1"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
    log "ERROR" "$1"
}

# Setup UV environment
setup_uv_env() {
    print_info "Setting up UV virtual environment..."
    
    # Check if UV is installed
    if ! command -v uv &> /dev/null; then
        print_error "UV is not installed. Please install it first:"
        echo "curl -LsSf https://astral.sh/uv/install.sh | sh"
        exit 1
    fi
    
    cd "$PROJECT_ROOT"
    
    # Create virtual environment if it doesn't exist
    if [ ! -d "$VENV_DIR" ]; then
        print_info "Creating UV virtual environment..."
        uv venv .venv
        print_success "Virtual environment created at .venv"
    fi
    
    # Install dependencies
    if [ -f "requirements.txt" ]; then
        print_info "Installing dependencies with UV..."
        uv pip install -r requirements.txt
        print_success "Dependencies installed"
    fi
    
    # Activate environment for current session
    export VIRTUAL_ENV="$VENV_DIR"
    export PATH="$VENV_DIR/bin:$PATH"
    
    print_success "UV environment activated"
}

# Run command in UV environment
run_in_uv() {
    cd "$PROJECT_ROOT"
    
    # Ensure environment is activated
    if [ -z "$VIRTUAL_ENV" ] || [ "$VIRTUAL_ENV" != "$VENV_DIR" ]; then
        export VIRTUAL_ENV="$VENV_DIR"
        export PATH="$VENV_DIR/bin:$PATH"
    fi
    
    # Run the command
    "$@"
}

# Check prerequisites
check_prerequisites() {
    print_info "Checking prerequisites..."
    
    # Check UV
    if ! command -v uv &> /dev/null; then
        print_error "UV is not installed. Install with:"
        echo "curl -LsSf https://astral.sh/uv/install.sh | sh"
        exit 1
    fi
    
    # Check git
    if ! command -v git &> /dev/null; then
        print_error "Git is required but not installed"
        exit 1
    fi
    
    # Check if we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        print_error "Not in a git repository. Please run 'git init' first."
        exit 1
    fi
    
    # Setup UV environment
    setup_uv_env
    
    # Check if required Python packages are available
    local required_packages=("mkdocs" "mike")
    for pkg in "${required_packages[@]}"; do
        if ! run_in_uv python -c "import $pkg" 2>/dev/null; then
            print_error "Required package not found: $pkg"
            print_info "Installing missing dependencies..."
            run_in_uv uv pip install -r requirements.txt
            break
        fi
    done
    
    print_success "All prerequisites met"
}

# Calculate 2nd Tuesday of month
get_second_tuesday() {
    local year=$1
    local month_num=$2
    
    # Get first day of month and its day of week
    local first_day=$(date -d "$year-$(printf "%02d" $month_num)-01" +%u)
    
    # Calculate 2nd Tuesday
    # Tuesday is day 2 of week (1=Monday, 7=Sunday)
    local days_to_add=$((9 - first_day))
    if [ $first_day -le 2 ]; then
        days_to_add=$((2 - first_day + 7))
    fi
    
    local second_tuesday=$(date -d "$year-$(printf "%02d" $month_num)-01 +$days_to_add days" +%Y-%m-%d)
    echo "$second_tuesday"
}

# Initialize Mike version control
init_mike() {
    print_header "INITIALIZING MIKE VERSION CONTROL"
    
    cd "$PROJECT_ROOT"
    
    # Initialize mike if not already done
    if [ ! -f ".mike.yml" ]; then
        print_info "Initializing Mike version control..."
        run_in_uv mike deploy --push --update-aliases Jan.2026 latest
        run_in_uv mike set-default Jan.2026
        print_success "Mike initialized with Jan.2026 as first version"
    else
        print_info "Mike already initialized"
    fi
    
    # List current versions
    print_info "Current Mike versions:"
    run_in_uv mike list
}

# Create newsletter content template
create_newsletter_template() {
    local version=$1
    local year=$2
    local month=$3
    local month_num=$4
    local publish_date=$5
    
    print_info "Creating newsletter template for $version..."
    
    # Create version-specific content directory
    local content_dir="$PROJECT_ROOT/content/$version"
    mkdir -p "$content_dir"
    
    # Create main newsletter content
    cat > "$content_dir/index.md" << EOF
# Channel Newsletter - $month $year

*Published: $(date -d "$publish_date" "+%B %d, %Y")*

Welcome to the $month $year edition of our Channel Newsletter!

## 📰 In This Issue

- **Product Updates**: Latest releases and announcements
- **Industry News**: Market trends and insights
- **Partner Spotlight**: Success stories from our community
- **Technical Resources**: Documentation and guides
- **Upcoming Events**: Webinars and conferences

---

## 🚀 Product Updates

### New Features This Month

!!! info "Feature Highlight"
    Add your key product updates and feature announcements here.

**What's New:**
- Feature 1: Description
- Feature 2: Description
- Feature 3: Description

---

## 📊 Industry Spotlight

### Market Trends - $month $year

Key developments in our industry this month:

| Trend | Impact | Opportunity |
|-------|--------|-------------|
| Trend 1 | High | Description |
| Trend 2 | Medium | Description |
| Trend 3 | Low | Description |

---

## 🌟 Partner Success Story

### Featured Partner: [Partner Name]

> "Quote from partner about their success"
> 
> *- Partner Representative, Company Name*

**Key Achievements:**
- Achievement 1
- Achievement 2
- Achievement 3

---

## 📅 Upcoming Events

### $(date -d "$publish_date +1 month" "+%B %Y") Events

**Event Name**  
**Date**: TBD  
**Location**: TBD  
**Registration**: [Link]

---

## 📞 Contact Information

**Newsletter Team**  
Email: newsletter@yourcompany.com  
Phone: 1-800-555-0123

**Partner Support**  
Email: partners@yourcompany.com  
Portal: [partner.yourcompany.com](https://partner.yourcompany.com)

---

*Thank you for being a valued partner. We look forward to continued success together!*

## 📋 Newsletter Schedule

**Next Issue**: $(date -d "$publish_date +1 month" "+%B %Y") - Publishing $(get_second_tuesday $((year + (month_num == 12 ? 1 : 0))) $((month_num == 12 ? 1 : month_num + 1)))

EOF

    # Create archive entry
    cat > "$content_dir/archive-entry.md" << EOF
# $month $year Newsletter

*Published: $(date -d "$publish_date" "+%B %d, %Y")*

[📖 Read Full Issue](../$version/)

## Highlights

- Product updates and new features
- Industry trends and analysis
- Partner success stories
- Upcoming events and webinars

---

*This issue has been archived and is read-only.*
EOF

    print_success "Newsletter template created for $version"
}

# Deploy new newsletter version
deploy_version() {
    local version=$1
    local description=$2
    local set_as_latest=${3:-true}
    
    print_header "DEPLOYING NEWSLETTER VERSION: $version"
    
    cd "$PROJECT_ROOT"
    
    # Check if version already exists
    if run_in_uv mike list | grep -q "$version"; then
        print_warning "Version $version already exists!"
        read -p "Do you want to overwrite it? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_info "Deployment cancelled"
            return 1
        fi
    fi
    
    # Copy version-specific content to docs
    local content_dir="content/$version"
    if [ -d "$content_dir" ]; then
        print_info "Copying content from $content_dir to docs/"
        cp -r "$content_dir"/* docs/
    fi
    
    # Deploy with Mike
    print_info "Deploying version $version..."
    if [ "$set_as_latest" = true ]; then
        run_in_uv mike deploy --push --update-aliases "$version" latest
        run_in_uv mike set-default "$version"
        print_success "Version $version deployed and set as latest"
    else
        run_in_uv mike deploy --push "$version"
        print_success "Version $version deployed (not set as latest)"
    fi
    
    # List all versions
    print_info "Current versions:"
    run_in_uv mike list
}

# Generate yearly schedule
generate_schedule() {
    local year=${1:-$START_YEAR}
    
    print_header "NEWSLETTER SCHEDULE FOR $year"
    
    echo -e "${CYAN}Month${NC}     ${CYAN}Version${NC}      ${CYAN}Publish Date (2nd Tuesday)${NC}"
    echo "=================================================="
    
    for i in "${!MONTHS[@]}"; do
        local month="${MONTHS[$i]}"
        local month_num=$((i + 1))
        local version="$month.$year"
        local publish_date=$(get_second_tuesday $year $month_num)
        
        printf "%-8s %-12s %s\n" "$month" "$version" "$publish_date"
    done
    
    echo ""
}

# Initialize full year
init_year() {
    local year=${1:-$START_YEAR}
    
    print_header "INITIALIZING NEWSLETTER YEAR $year"
    
    for i in "${!MONTHS[@]}"; do
        local month="${MONTHS[$i]}"
        local month_num=$((i + 1))
        local version="$month.$year"
        local publish_date=$(get_second_tuesday $year $month_num)
        
        print_info "Setting up $version (publish: $publish_date)..."
        create_newsletter_template "$version" "$year" "$month" "$month_num" "$publish_date"
    done
    
    print_success "Year $year initialized with all monthly templates"
}

# Create next month's newsletter
create_next_month() {
    print_header "CREATING NEXT MONTH'S NEWSLETTER"
    
    # Calculate next month
    local current_date=$(date +%Y-%m-%d)
    local next_month_date=$(date -d "$current_date +1 month" +%Y-%m)
    local next_year=$(date -d "$next_month_date-01" +%Y)
    local next_month_num=$(date -d "$next_month_date-01" +%m)
    local next_month_name="${MONTHS[$((10#$next_month_num - 1))]}"
    local version="$next_month_name.$next_year"
    local publish_date=$(get_second_tuesday $next_year $((10#$next_month_num)))
    
    print_info "Next newsletter: $version"
    print_info "Publish date: $publish_date"
    
    create_newsletter_template "$version" "$next_year" "$next_month_name" "$((10#$next_month_num))" "$publish_date"
    
    print_success "Next month's newsletter template created: $version"
    print_info "Edit content in: content/$version/index.md"
    print_info "Deploy when ready: ./scripts/newsletter-manager.sh deploy $version"
}

# Start development server
serve_newsletter() {
    local version="${1:-latest}"
    
    print_header "STARTING DEVELOPMENT SERVER"
    print_info "Serving version: $version"
    print_info "Server will be available at: http://127.0.0.1:8000"
    print_info "Press Ctrl+C to stop the server"
    
    cd "$PROJECT_ROOT"
    run_in_uv mike serve --dev-addr=127.0.0.1:8000
}

# Show environment status
show_env_status() {
    print_header "UV ENVIRONMENT STATUS"
    
    echo "UV Version:"
    uv --version
    
    echo -e "\nVirtual Environment:"
    if [ -d "$VENV_DIR" ]; then
        echo "✅ Virtual environment exists at: $VENV_DIR"
        echo "Python: $(run_in_uv python --version)"
    else
        echo "❌ Virtual environment not found"
    fi
    
    echo -e "\nInstalled Packages:"
    if [ -d "$VENV_DIR" ]; then
        run_in_uv uv pip list
    else
        echo "No virtual environment found"
    fi
}

# Show usage
show_usage() {
    cat << EOF
Newsletter Manager - Mike Version Control with UV Environment

USAGE:
    $0 <command> [options]

COMMANDS:
    init                    Initialize Mike version control and UV environment
    init-year [YEAR]        Initialize all monthly templates for year (default: $START_YEAR)
    create-next            Create next month's newsletter template
    deploy <VERSION>       Deploy newsletter version (e.g., Jan.2026)
    schedule [YEAR]        Show publication schedule for year
    list                   List all newsletter versions
    serve [VERSION]        Start local development server
    status                 Show current status
    env-status             Show UV environment status

EXAMPLES:
    $0 init                     # Initialize Mike and UV environment
    $0 init-year 2026          # Create all 2026 monthly templates
    $0 create-next             # Create next month's template
    $0 deploy Jan.2026         # Deploy January 2026 newsletter
    $0 schedule 2026           # Show 2026 publication schedule
    $0 serve Jan.2026          # Preview January 2026 locally
    $0 env-status              # Check UV environment

NEWSLETTER SCHEDULE:
    - Publication: 2nd Tuesday of each month
    - First Issue: January 2026
    - Version Format: Month.Year (e.g., Jan.2026, Feb.2026)
    - Each version is archived and protected after publication

ENVIRONMENT:
    - Uses UV for fast Python package management
    - Virtual environment: .venv/
    - Dependencies managed via requirements.txt

EOF
}

# Main script logic
main() {
    init_logging
    
    case "${1:-}" in
        "init")
            check_prerequisites
            init_mike
            ;;
        "init-year")
            check_prerequisites
            init_year "${2:-$START_YEAR}"
            ;;
        "create-next")
            check_prerequisites
            create_next_month
            ;;
        "deploy")
            if [ -z "${2:-}" ]; then
                print_error "Version required. Usage: $0 deploy <VERSION>"
                exit 1
            fi
            check_prerequisites
            deploy_version "$2" "Newsletter deployment" true
            ;;
        "schedule")
            generate_schedule "${2:-$START_YEAR}"
            ;;
        "list")
            check_prerequisites
            print_header "NEWSLETTER VERSIONS"
            run_in_uv mike list
            ;;
        "serve")
            check_prerequisites
            serve_newsletter "${2:-latest}"
            ;;
        "status")
            check_prerequisites
            print_header "NEWSLETTER STATUS"
            echo "Git Status:"
            git status --short
            echo -e "\nMike Versions:"
            run_in_uv mike list
            echo -e "\nContent Directories:"
            ls -la content/ 2>/dev/null || echo "No content directories found"
            ;;
        "env-status")
            show_env_status
            ;;
        "help"|"--help"|"-h"|"")
            show_usage
            ;;
        *)
            print_error "Unknown command: $1"
            show_usage
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"

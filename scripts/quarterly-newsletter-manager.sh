#!/bin/bash

# Quarterly Newsletter Manager Script
# Manages quarterly newsletter versions starting Q1 2026 (March)
# Publishing schedule: March, June, September, December (every 3 months)
# Uses UV for Python environment management

set -e

# Configuration
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOG_DIR="$PROJECT_ROOT/logs"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Quarterly schedule - 2nd week of March, June, September, December
QUARTERS=("Q1" "Q2" "Q3" "Q4")
MONTHS=("Mar" "Jun" "Sep" "Dec")
MONTH_NAMES=("March" "June" "September" "December")
START_YEAR=2026

# Print functions
print_header() {
    echo -e "\n${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${CYAN}ℹ${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Run command in UV environment
run_in_uv() {
    cd "$PROJECT_ROOT"
    uv run "$@"
}

# Check prerequisites
check_prerequisites() {
    print_info "Checking prerequisites..."
    
    local missing=0
    
    # Check UV
    if ! command -v uv &> /dev/null; then
        print_error "UV not found. Install from: https://github.com/astral-sh/uv"
        missing=1
    else
        print_success "UV found: $(uv --version)"
    fi
    
    # Check Git
    if ! command -v git &> /dev/null; then
        print_error "Git not found"
        missing=1
    else
        print_success "Git found: $(git --version | head -n1)"
    fi
    
    # Check if in git repository
    if ! git -C "$PROJECT_ROOT" rev-parse --git-dir > /dev/null 2>&1; then
        print_error "Not in a git repository"
        missing=1
    else
        print_success "Git repository detected"
    fi
    
    if [ $missing -eq 1 ]; then
        print_error "Missing prerequisites. Please install required tools."
        exit 1
    fi
    
    print_success "All prerequisites met"
}

# Initialize Mike version control
init_mike() {
    print_header "INITIALIZING MIKE VERSION CONTROL"
    
    cd "$PROJECT_ROOT"
    
    # Initialize mike if not already done
    if [ ! -f ".mike.yml" ]; then
        print_info "Initializing Mike version control..."
        run_in_uv mike deploy --push --update-aliases Mar.2026 latest
        run_in_uv mike set-default Mar.2026
        print_success "Mike initialized with Mar.2026 as first version"
    else
        print_info "Mike already initialized"
    fi
    
    # List current versions
    print_info "Current versions:"
    run_in_uv mike list
}

# Deploy newsletter version
deploy_version() {
    local version=$1
    
    if [ -z "$version" ]; then
        print_error "Version required"
        exit 1
    fi
    
    print_header "DEPLOYING NEWSLETTER VERSION: $version"
    
    # Check if content directory exists
    if [ ! -d "$PROJECT_ROOT/content/$version" ]; then
        print_error "Content directory not found: content/$version"
        exit 1
    fi
    
    # Update mkdocs.yml to point to this version
    print_info "Updating mkdocs.yml to use content/$version..."
    sed -i.bak "s|docs_dir: content/.*|docs_dir: content/$version|" "$PROJECT_ROOT/mkdocs.yml"
    
    # Deploy with mike
    print_info "Deploying $version with Mike..."
    cd "$PROJECT_ROOT"
    run_in_uv mike deploy --push --update-aliases "$version" latest
    
    print_success "Newsletter $version deployed successfully!"
    print_info "View at: https://arista-channel.github.io/channel-newsletter/"
}

# Generate quarterly schedule
generate_schedule() {
    local year=${1:-$START_YEAR}
    
    print_header "QUARTERLY NEWSLETTER SCHEDULE FOR $year"
    
    echo -e "${CYAN}Quarter${NC}  ${CYAN}Month${NC}      ${CYAN}Version${NC}      ${CYAN}Release Week${NC}"
    echo "============================================================"
    
    for i in "${!QUARTERS[@]}"; do
        local quarter="${QUARTERS[$i]}"
        local month="${MONTHS[$i]}"
        local month_name="${MONTH_NAMES[$i]}"
        local version="$month.$year"
        
        printf "%-8s %-10s %-12s 2nd week of %s\n" "$quarter" "$month_name" "$version" "$month_name"
    done
    
    echo ""
    print_info "Publishing frequency: Quarterly (every 3 months)"
}

# List all versions
list_versions() {
    print_header "NEWSLETTER VERSIONS"
    
    cd "$PROJECT_ROOT"
    run_in_uv mike list
}

# Show status
show_status() {
    print_header "NEWSLETTER STATUS"
    
    # Current version in mkdocs.yml
    local current_version=$(grep "docs_dir:" "$PROJECT_ROOT/mkdocs.yml" | sed 's/.*content\///' | tr -d ' ')
    print_info "Current version in mkdocs.yml: $current_version"
    
    # Available content directories
    print_info "Available content directories:"
    ls -d "$PROJECT_ROOT/content"/*/ 2>/dev/null | xargs -n1 basename || print_warning "No content directories found"
    
    # Mike versions
    print_info "Deployed versions:"
    cd "$PROJECT_ROOT"
    run_in_uv mike list || print_warning "No versions deployed yet"
}

# Show help
show_help() {
    cat << EOF
${BLUE}Quarterly Newsletter Manager${NC}

Manages quarterly newsletter versions with Mike version control.
Publishing schedule: March, June, September, December (every 3 months)

${YELLOW}USAGE:${NC}
    $0 <command> [options]

${YELLOW}COMMANDS:${NC}
    init                    Initialize Mike version control
    deploy <VERSION>        Deploy newsletter version (e.g., Mar.2026)
    schedule [YEAR]         Show quarterly publication schedule
    list                    List all deployed newsletter versions
    status                  Show current status
    help                    Show this help message

${YELLOW}EXAMPLES:${NC}
    $0 init                     # Initialize Mike version control
    $0 deploy Mar.2026          # Deploy Q1 2026 (March) newsletter
    $0 deploy Jun.2026          # Deploy Q2 2026 (June) newsletter
    $0 schedule 2026            # Show 2026 quarterly schedule
    $0 list                     # List all deployed versions
    $0 status                   # Show current status

${YELLOW}QUARTERLY SCHEDULE:${NC}
    - Q1: March (2nd week)
    - Q2: June (2nd week)
    - Q3: September (2nd week)
    - Q4: December (2nd week)
    
    Version Format: Month.Year (e.g., Mar.2026, Jun.2026, Sep.2026, Dec.2026)

${YELLOW}DEPLOYMENT WORKFLOW:${NC}
    1. Create/update content in content/<VERSION>/
    2. Deploy: $0 deploy <VERSION>
    3. Verify at: https://arista-channel.github.io/channel-newsletter/

EOF
}

# Main script logic
main() {
    case "${1:-}" in
        "init")
            check_prerequisites
            init_mike
            ;;
        "deploy")
            if [ -z "${2:-}" ]; then
                print_error "Version required. Usage: $0 deploy <VERSION>"
                exit 1
            fi
            check_prerequisites
            deploy_version "$2"
            ;;
        "schedule")
            generate_schedule "${2:-$START_YEAR}"
            ;;
        "list")
            check_prerequisites
            list_versions
            ;;
        "status")
            show_status
            ;;
        "help"|"--help"|"-h")
            show_help
            ;;
        *)
            print_error "Unknown command: ${1:-}"
            echo ""
            show_help
            exit 1
            ;;
    esac
}

# Run main function
main "$@"


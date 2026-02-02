#!/bin/bash

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                    CLAUDE CODE VIRTUOSO - QUICK INSTALL                    ║
# ║                      AI Engineering Team Orchestrator                       ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Symbols
CHECK="${GREEN}✓${NC}"
ARROW="${CYAN}→${NC}"
STAR="${YELLOW}★${NC}"

echo ""
echo -e "${PURPLE}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║${NC}         ${CYAN}CLAUDE CODE VIRTUOSO${NC} - Quick Install                  ${PURPLE}║${NC}"
echo -e "${PURPLE}║${NC}         AI-Powered Engineering Team Orchestrator            ${PURPLE}║${NC}"
echo -e "${PURPLE}╚═══════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Get target directory (default: current directory)
TARGET_DIR="${1:-.}"

# Convert to absolute path
TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd)" || {
    echo -e "${YELLOW}Creating directory: $1${NC}"
    mkdir -p "$1"
    TARGET_DIR="$(cd "$1" && pwd)"
}

echo -e "${ARROW} Target directory: ${YELLOW}${TARGET_DIR}${NC}"
echo ""

# Get script directory (where .claude and CLAUDE.md are)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if source files exist
if [ ! -d "${SCRIPT_DIR}/.claude" ] || [ ! -f "${SCRIPT_DIR}/CLAUDE.md" ]; then
    echo -e "${YELLOW}⚠ Error: Source files not found in ${SCRIPT_DIR}${NC}"
    echo "Make sure you're running this from the claude-code-virtuoso directory."
    exit 1
fi

# Handle existing installation
if [ -d "${TARGET_DIR}/.claude" ]; then
    echo -e "${YELLOW}⚠ Existing installation found${NC}"
    echo -e "${CYAN}User data will be preserved (DECISIONS.md, specs/, decisions/)${NC}"
    echo ""
    read -p "Update installation? (y/N): " -n 1 -r
    echo ""
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 0
    fi
    
    # Backup user data
    echo -e "${ARROW} Backing up user data..."
    BACKUP_DIR=$(mktemp -d)
    
    [ -f "${TARGET_DIR}/.claude/docs/DECISIONS.md" ] && \
        cp "${TARGET_DIR}/.claude/docs/DECISIONS.md" "${BACKUP_DIR}/"
    
    [ -d "${TARGET_DIR}/.claude/docs/specs" ] && \
        cp -r "${TARGET_DIR}/.claude/docs/specs" "${BACKUP_DIR}/"
    
    [ -d "${TARGET_DIR}/.claude/docs/decisions" ] && \
        cp -r "${TARGET_DIR}/.claude/docs/decisions" "${BACKUP_DIR}/"
    
    # Remove old installation
    rm -rf "${TARGET_DIR}/.claude"
fi

# Install
echo -e "${ARROW} Installing..."

# Copy .claude directory
cp -r "${SCRIPT_DIR}/.claude" "${TARGET_DIR}/"

# Copy CLAUDE.md
cp "${SCRIPT_DIR}/CLAUDE.md" "${TARGET_DIR}/"

# Restore user data if exists
if [ -n "${BACKUP_DIR}" ] && [ -d "${BACKUP_DIR}" ]; then
    echo -e "${ARROW} Restoring user data..."
    
    [ -f "${BACKUP_DIR}/DECISIONS.md" ] && \
        cp "${BACKUP_DIR}/DECISIONS.md" "${TARGET_DIR}/.claude/docs/"
    
    [ -d "${BACKUP_DIR}/specs" ] && \
        cp -r "${BACKUP_DIR}/specs" "${TARGET_DIR}/.claude/docs/"
    
    [ -d "${BACKUP_DIR}/decisions" ] && \
        cp -r "${BACKUP_DIR}/decisions" "${TARGET_DIR}/.claude/docs/"
    
    rm -rf "${BACKUP_DIR}"
fi

echo ""
echo -e "${CHECK} ${GREEN}Installation complete!${NC}"
echo ""

# Show installed components
echo -e "${CYAN}Installed:${NC}"
echo -e "  ${CHECK} CLAUDE.md"
echo -e "  ${CHECK} .claude/settings.json"
echo -e "  ${CHECK} .claude/agents/ (8 agents)"
echo -e "  ${CHECK} .claude/skills/ (11 skills)"
echo -e "  ${CHECK} .claude/docs/ (DECISIONS.md, MANUAL.md)"
echo ""

# Next steps
echo -e "${STAR} ${YELLOW}Next Steps:${NC}"
echo ""
echo -e "  ${CYAN}1. Start Claude Code:${NC}"
echo "     cd ${TARGET_DIR}"
echo "     claude"
echo ""
echo -e "  ${CYAN}2. For NEW projects:${NC}"
echo "     @product-manager /vision \"your project idea\""
echo ""
echo -e "  ${CYAN}3. For existing projects:${NC}"
echo "     /guide"
echo ""

# Check if claude CLI is available
if command -v claude &> /dev/null; then
    echo -e "${CHECK} Claude CLI found"
else
    echo -e "${YELLOW}⚠ Claude CLI not found${NC}"
    echo -e "   Install: npm install -g @anthropic-ai/claude-code"
fi

echo ""
echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
echo -e "  ${CYAN}Docs:${NC} github.com/emirrtopaloglu/claude-code-virtuoso"
echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
echo ""

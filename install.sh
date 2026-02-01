#!/bin/bash

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                    CLAUDE CODE VIRTUOSO - QUICK INSTALL                    ║
# ║                      AI Engineering Team Orchestrator                       ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Symbols
CHECK="${GREEN}✓${NC}"
CROSS="${RED}✗${NC}"
ARROW="${CYAN}→${NC}"
STAR="${YELLOW}★${NC}"

echo ""
echo -e "${PURPLE}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║${NC}         ${CYAN}CLAUDE CODE VIRTUOSO${NC} - Quick Install                  ${PURPLE}║${NC}"
echo -e "${PURPLE}║${NC}         AI-Powered Engineering Team Orchestrator            ${PURPLE}║${NC}"
echo -e "${PURPLE}╚═══════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if we're in a project directory
if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo -e "${CYAN}Usage:${NC}"
    echo "  ./install.sh              Install in current directory"
    echo "  ./install.sh [path]       Install in specified directory"
    echo "  ./install.sh --global     Clone to ~/claude-code-virtuoso for reuse"
    echo ""
    echo -e "${CYAN}Examples:${NC}"
    echo "  ./install.sh              # Install in current project"
    echo "  ./install.sh ~/my-app     # Install in ~/my-app"
    echo "  ./install.sh --global     # Clone for future copying"
    echo ""
    exit 0
fi

# Determine installation mode
if [ "$1" == "--global" ]; then
    INSTALL_DIR="$HOME/claude-code-virtuoso"
    MODE="global"
elif [ -n "$1" ]; then
    INSTALL_DIR="$1"
    MODE="custom"
else
    INSTALL_DIR="$(pwd)"
    MODE="current"
fi

echo -e "${ARROW} Installation mode: ${YELLOW}${MODE}${NC}"
echo -e "${ARROW} Target directory: ${YELLOW}${INSTALL_DIR}${NC}"
echo ""

# Check if .claude already exists
EXISTING_INSTALL=false
if [ -d "${INSTALL_DIR}/.claude" ]; then
    echo -e "${YELLOW}⚠ .claude directory already exists in ${INSTALL_DIR}${NC}"
    echo -e "${CYAN}ℹ User data (DECISIONS.md, decisions/, specs/) will be preserved${NC}"
    read -p "Update existing installation? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}Installation cancelled.${NC}"
        exit 1
    fi
    EXISTING_INSTALL=true
    
    # Backup user data that should be preserved
    BACKUP_DIR=$(mktemp -d)
    echo -e "${ARROW} Backing up user data..."
    
    # Files/folders to preserve (user's project-specific data)
    if [ -f "${INSTALL_DIR}/.claude/docs/DECISIONS.md" ]; then
        cp "${INSTALL_DIR}/.claude/docs/DECISIONS.md" "${BACKUP_DIR}/DECISIONS.md"
    fi
    if [ -d "${INSTALL_DIR}/.claude/docs/decisions" ]; then
        cp -r "${INSTALL_DIR}/.claude/docs/decisions" "${BACKUP_DIR}/decisions"
    fi
    if [ -d "${INSTALL_DIR}/.claude/docs/specs" ]; then
        cp -r "${INSTALL_DIR}/.claude/docs/specs" "${BACKUP_DIR}/specs"
    fi
    
    # Remove old installation
    rm -rf "${INSTALL_DIR}/.claude"
fi

# Create directory if needed
if [ ! -d "${INSTALL_DIR}" ]; then
    echo -e "${ARROW} Creating directory: ${INSTALL_DIR}"
    mkdir -p "${INSTALL_DIR}"
fi

# Global mode: Clone repository
if [ "$MODE" == "global" ]; then
    echo -e "${ARROW} Cloning Claude Code Virtuoso..."
    
    if [ -d "${INSTALL_DIR}" ]; then
        rm -rf "${INSTALL_DIR}"
    fi
    
    git clone --depth 1 https://github.com/emirrtopaloglu/claude-code-virtuoso.git "${INSTALL_DIR}" 2>/dev/null || {
        echo -e "${CROSS} Failed to clone repository"
        echo -e "${YELLOW}Trying alternative method...${NC}"
        
        # Alternative: Download as zip
        curl -sL https://github.com/emirrtopaloglu/claude-code-virtuoso/archive/main.zip -o /tmp/virtuoso.zip
        unzip -q /tmp/virtuoso.zip -d /tmp
        mv /tmp/claude-code-virtuoso-main "${INSTALL_DIR}"
        rm /tmp/virtuoso.zip
    }
    
    echo ""
    echo -e "${CHECK} Claude Code Virtuoso cloned to ${GREEN}${INSTALL_DIR}${NC}"
    echo ""
    echo -e "${STAR} ${CYAN}To use in a new project:${NC}"
    echo -e "   cd your-project"
    echo -e "   cp -r ~/claude-code-virtuoso/.claude ."
    echo -e "   cp ~/claude-code-virtuoso/CLAUDE.md ."
    echo ""
    exit 0
fi

# Get the script's directory (where the source files are)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if we're running from the virtuoso repo
if [ -d "${SCRIPT_DIR}/.claude" ]; then
    SOURCE_DIR="${SCRIPT_DIR}"
elif [ -d "$HOME/claude-code-virtuoso/.claude" ]; then
    SOURCE_DIR="$HOME/claude-code-virtuoso"
else
    echo -e "${ARROW} Downloading Claude Code Virtuoso..."
    
    # Download to temp and copy
    TEMP_DIR=$(mktemp -d)
    git clone --depth 1 https://github.com/emirrtopaloglu/claude-code-virtuoso.git "${TEMP_DIR}" 2>/dev/null || {
        curl -sL https://github.com/emirrtopaloglu/claude-code-virtuoso/archive/main.zip -o /tmp/virtuoso.zip
        unzip -q /tmp/virtuoso.zip -d /tmp
        mv /tmp/claude-code-virtuoso-main/* "${TEMP_DIR}/"
        rm /tmp/virtuoso.zip
    }
    SOURCE_DIR="${TEMP_DIR}"
fi

echo -e "${ARROW} Installing Claude Code Virtuoso..."

# Copy .claude directory
cp -r "${SOURCE_DIR}/.claude" "${INSTALL_DIR}/"

# Copy CLAUDE.md to project root
cp "${SOURCE_DIR}/CLAUDE.md" "${INSTALL_DIR}/"

# Restore user data if this was an existing installation
if [ "$EXISTING_INSTALL" = true ] && [ -n "${BACKUP_DIR}" ] && [ -d "${BACKUP_DIR}" ]; then
    echo -e "${ARROW} Restoring user data..."
    
    if [ -f "${BACKUP_DIR}/DECISIONS.md" ]; then
        cp "${BACKUP_DIR}/DECISIONS.md" "${INSTALL_DIR}/.claude/docs/DECISIONS.md"
        echo -e "  ${CHECK} Restored DECISIONS.md"
    fi
    if [ -d "${BACKUP_DIR}/decisions" ]; then
        rm -rf "${INSTALL_DIR}/.claude/docs/decisions"
        cp -r "${BACKUP_DIR}/decisions" "${INSTALL_DIR}/.claude/docs/decisions"
        echo -e "  ${CHECK} Restored decisions/"
    fi
    if [ -d "${BACKUP_DIR}/specs" ]; then
        rm -rf "${INSTALL_DIR}/.claude/docs/specs"
        cp -r "${BACKUP_DIR}/specs" "${INSTALL_DIR}/.claude/docs/specs"
        echo -e "  ${CHECK} Restored specs/"
    fi
    
    # Cleanup backup
    rm -rf "${BACKUP_DIR}"
fi

# Cleanup temp if used
if [ -n "${TEMP_DIR}" ] && [ -d "${TEMP_DIR}" ]; then
    rm -rf "${TEMP_DIR}"
fi

echo ""
echo -e "${CHECK} ${GREEN}Installation complete!${NC}"
echo ""

# Show what was installed
echo -e "${CYAN}Installed components:${NC}"
echo -e "  ${CHECK} CLAUDE.md (Main orchestration system)"
echo -e "  ${CHECK} .claude/settings.json (Hooks & configuration)"
echo -e "  ${CHECK} .claude/docs/DECISIONS.md (Memory system)"
echo -e "  ${CHECK} .claude/docs/MANUAL.md (User guide)"
echo -e "  ${CHECK} 8 specialized agents"
echo -e "  ${CHECK} 10 production-ready skills"
echo ""

# Show directory structure
echo -e "${CYAN}Directory structure:${NC}"
echo "  ${INSTALL_DIR}/"
echo "  ├── CLAUDE.md"
echo "  └── .claude/"
echo "      ├── settings.json"
echo "      ├── agents/ (8 files)"
echo "      ├── skills/ (10 folders)"
echo "      ├── docs/"
echo "      │   ├── DECISIONS.md"
echo "      │   ├── MANUAL.md"
echo "      │   ├── specs/"
echo "      │   └── decisions/"
echo "      └── templates/ (3 files)"
echo ""

# Next steps
echo -e "${STAR} ${YELLOW}Next steps:${NC}"
echo ""
echo -e "  1. ${CYAN}Start Claude Code:${NC}"
echo "     cd ${INSTALL_DIR}"
echo "     claude"
echo ""
echo -e "  2. ${CYAN}Run the onboarding guide:${NC}"
echo "     /guide"
echo ""
echo -e "  3. ${CYAN}Start building:${NC}"
echo "     /interview \"describe your project idea\""
echo ""

# Check if claude is installed
if command -v claude &> /dev/null; then
    echo -e "${CHECK} Claude Code CLI detected"
else
    echo -e "${YELLOW}⚠ Claude Code CLI not found${NC}"
    echo -e "  Install: ${CYAN}npm install -g @anthropic-ai/claude-code${NC}"
fi

echo ""
echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
echo -e "  ${CYAN}Documentation:${NC} https://github.com/emirrtopaloglu/claude-code-virtuoso"
echo -e "  ${CYAN}Issues:${NC} https://github.com/emirrtopaloglu/claude-code-virtuoso/issues"
echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
echo ""

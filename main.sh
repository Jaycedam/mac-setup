#!/bin/bash

# Path Variables
ROOT_DIR="$(dirname "${BASH_SOURCE[0]}")"
BACKUP_DIR="$ROOT_DIR/dotfiles" # Path for all backups

# Color variables
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
MAGENTA='\033[35m'
CYAN='\033[36m'
WHITE='\033[37m'
RESET='\033[0m'

# Indicator for new sections
ARROW="${MAGENTA}==>${RESET}"

# Prompt user for input
echo -e "Script Options:\n1.Automated Setup\n2.Update Backup"
read -rp "Enter number: " choice

if [ "$choice" -eq 1 ]; then
    echo -e "${ARROW} ${GREEN}Starting automatic setup..."
    # Installs brew and packages from Brewfile
    source "$ROOT_DIR/modules/brew.sh"

    # Restores config files backed up
    source "$ROOT_DIR/modules/restore.sh"

    # Fish shell
    source "$ROOT_DIR/modules/fish.sh"

    # LSP
    source "$ROOT_DIR/modules/lsp.sh"

    # Changes macOS defaults
    source "$ROOT_DIR/modules/defaults.sh"
    source "$ROOT_DIR/modules/dock_apps.sh"
    source "$ROOT_DIR/modules/enviroment.sh"
    source "$ROOT_DIR/modules/keyboard.sh"
    source "$ROOT_DIR/modules/dns.sh"

    echo -e "${ARROW} Next steps: Log out for all changes to apply."

elif [ "$choice" -eq 2 ]; then
    echo -e "${ARROW} ${GREEN}Updating backup..."
    source "$ROOT_DIR/modules/backup.sh"
else
    echo "Invalid input, please enter a valid option."
fi

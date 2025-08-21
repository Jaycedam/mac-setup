#!/bin/bash

# Path Variables
ROOT_DIR="$(dirname "${BASH_SOURCE[0]}")"
BACKUP_DIR="$ROOT_DIR/dotfiles" # Path for all backups
MODULES_DIR="$ROOT_DIR/modules" # Path for all backups

# Color variables
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
MAGENTA='\033[35m'
RESET='\033[0m'

# Indicator for new sections
ARROW="${MAGENTA}==>${RESET}"

# Prompt user for input
echo -e "Script Options:\n1.Automated Setup\n2.Update Backup"
read -rp "Enter number: " choice

if [ "$choice" -eq 1 ]; then
    echo -e "${ARROW} ${GREEN}Starting automatic setup..."
    # Installs brew and packages from Brewfile
    # shellcheck source=modules/brew.sh
    source "$MODULES_DIR/brew.sh"
    # Symlink dotfiles to home directory
    # shellcheck source=modules/restore.sh
    source "$MODULES_DIR/restore.sh"
    # Installs fish shell and configures it as the default shell
    # shellcheck source=modules/fish.sh
    source "$MODULES_DIR/fish.sh"
    # Installs LSP servers missing from brew packages
    # shellcheck source=modules/lsp.sh
    source "$MODULES_DIR/lsp.sh"
    # Changes macOS defaults
    # shellcheck source=modules/defaults.sh
    source "$MODULES_DIR/defaults.sh"
    # Adds persistent dock apps
    # shellcheck source=modules/dock_apps.sh
    source "$MODULES_DIR/dock_apps.sh"
    # Misc macOS settings like touchid for sudo, etc.
    # shellcheck source=modules/misc.sh
    source "$MODULES_DIR/misc.sh"
    # Sets up Kanata and Karabiner driver as services for keyboard cusomization and layers
    # shellcheck source=modules/keyboard.sh
    source "$MODULES_DIR/keyboard.sh"
    # Sets up DNS over HTTPS with Adblock (Mullvad)
    # shellcheck source=modules/dns.sh
    source "$MODULES_DIR/dns.sh"
    # Initializes apps for first time setup and permissions
    # shellcheck source=modules/init.sh
    source "$MODULES_DIR/init.sh"

    echo -e "${ARROW} Next steps: Log out for all changes to apply."

elif [ "$choice" -eq 2 ]; then
    echo -e "${ARROW} ${GREEN}Updating backup..."
    # shellcheck source=modules/backup.sh
    source "$ROOT_DIR/modules/backup.sh"
else
    echo "Invalid input, please enter a valid option."
fi

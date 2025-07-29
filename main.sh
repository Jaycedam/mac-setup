#!/bin/bash

# Path Variables
ROOT_DIR="$HOME/Developer/mac-setup" # Project path (IMPORTANT for creating symlings and load modules, don't change this unless you know what you're doing)
BACKUP_DIR="$ROOT_DIR/dotfiles"      # Path for all backups
OS="$(uname -s)"                     # Saves current OS (eg: Darwin, Linux)

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
read -p "Enter number: " choice

if [ "$choice" -eq 1 ]; then
    echo -e "${ARROW} ${GREEN}Starting automatic setup..."
    # Installs brew and packages from Brewfile
    source $ROOT_DIR/modules/brew.sh

    # Restores config files backed up
    source $ROOT_DIR/modules/restore.sh

    # LSP
    source $ROOT_DIR/modules/lsp.sh

    # neovim nightly
    source $ROOT_DIR/modules/nvim_nightly.sh

    # Only run this on macOS
    if [ $OS = "Darwin" ]; then
        echo -e "${ARROW} macOS detected, running modifications."
        # Changes macOS defaults
        source $ROOT_DIR/modules/darwin/defaults.sh
        source $ROOT_DIR/modules/darwin/enviroment.sh
        source $ROOT_DIR/modules/darwin/keyboard.sh
    fi

    echo -e "${ARROW} Next steps: Log out for all changes to apply."

elif [ "$choice" -eq 2 ]; then
    echo -e "${ARROW} ${GREEN}Updating backup..."
    source $ROOT_DIR/modules/backup.sh
else
    echo "Invalid input, please enter a valid option."
fi

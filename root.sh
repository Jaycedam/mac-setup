#!/bin/bash

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
ARROW="${MAGENTA}==> ${RESET}"

# Path Variables
# Path for all backups
BACKUP_DIR="./backup"

# Path for macOS Prefrences
PREFERENCES_DIR="$HOME/Library/Preferences"

# Path for current script
SCRIPT_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

# Path to VSCodium settings
VSC_SETTINGS="$HOME/Library/Application Support/VSCodium/User"

# Checks if current directory is correct, otherwise there will be issues with relative paths
if [ $PWD != "$SCRIPT_DIR" ]; then
    echo -e "${RED}Error.${RESET} The script must be executed from the directory $SCRIPT_DIR"
    echo "To change the directory run 'cd $SCRIPT_DIR'"
    exit 1
fi
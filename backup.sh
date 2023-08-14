#!/bin/bash

# Variables and directory check 
source root.sh

echo -e "${ARROW}Backing up .config folder..."
cp -R -p -v ~/.config $BACKUP_DIR

# Backs up vscode settings and extensions
echo -e "${ARROW}Backing up VSCodium profile and extensions..."
cp -v "$VSC_SETTINGS/settings.json" "$BACKUP_DIR"
codium --list-extensions > $BACKUP_DIR/vsc-extensions.txt

# Backs up currently installed brew packages, -f overrides current file
echo -e "${ARROW}Creating Brewfile..."
brew bundle dump -v -f --file $BACKUP_DIR/Brewfile

echo -e "${GREEN}Done!${RESET}"
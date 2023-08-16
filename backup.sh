#!/bin/bash

# Variables and directory check 
source root.sh

echo -e "${ARROW}Backing up dotfiles..."
cp -R -p -v ~/.config $BACKUP_DIR

# Window manager settings
echo -e "${ARROW}Backing up Amethyst settings..."
cp -v "$WM" $BACKUP_DIR

# Backs up vscode settings and extensions
echo -e "${ARROW}Backing up VSCodium profile and extensions..."
mkdir -p backup/vscode
cp -v "$VSC_SETTINGS/settings.json" "$BACKUP_DIR/vscode"
codium --list-extensions > $BACKUP_DIR/vscode/vsc-extensions.txt

# Backs up currently installed brew packages, -f overrides current file
echo -e "${ARROW}Creating Brewfile..."
brew bundle dump -v -f --file $BACKUP_DIR/Brewfile

echo -e "${GREEN}Done!${RESET}"
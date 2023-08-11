#!/bin/bash

# Variables and directory check 
source root.sh

echo -e "${ARROW}Backing up .config folder..."
cp -R -p -v ~/.config $BACKUP_DIR

# Backup current configs
echo -e "${ARROW}Backing up Amethyst settings..."
cp -v "$WM" $BACKUP_DIR

# Backs up currently installed brew packages, -f overrides current file
echo -e "${ARROW}Creating Brewfile..."
brew bundle dump -v -f --file $BACKUP_DIR/Brewfile

echo -e "${GREEN}Done!${RESET}"
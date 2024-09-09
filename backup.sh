#!/bin/bash

# Variables and directory check 
source root.sh

# Removes unused dotfiles
echo -e "${ARROW}Removing previous backup..."
rm -rf backup/.config/*

echo -e "${ARROW}Backing up dotfiles..."
cp -R -p -v ~/.config $BACKUP_DIR
cp -v ~/.zshrc $BACKUP_DIR 

# Backs up currently installed brew packages, -f overrides current file
echo -e "${ARROW}Creating Brewfile..."
brew bundle dump -v -f --file $BACKUP_DIR/Brewfile

echo -e "${GREEN}Done!${RESET}"

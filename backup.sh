#!/bin/bash

# Variables and directory check 
source root.sh

# Add check if the files are already symlinked
# Add warning and confirmation before deleting 

# Removes unused dotfiles
echo "${ARROW}Removing previous backup..."
rm -rf $BACKUP_DIR/* 

echo "${ARROW}Backing up dotfiles..."
mv -v ~/.config $BACKUP_DIR
mv -v ~/.zshrc $BACKUP_DIR

source modules/restore.sh

# Backs up currently installed brew packages, -f overrides current file
echo "${ARROW}Creating Brewfile..."
brew bundle dump -v -f --file Brewfile

echo "${GREEN}Done!${RESET}"

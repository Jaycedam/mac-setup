#!/bin/bash

# Variables and directory check 
source root.sh

echo "${ARROW}Backing up dotfiles..."
if [ -L ~/.config ]; then
    echo "File already exists and is a symlink."
else
    # Create the symlink if it doesn't exist
    mv -v ~/.config $BACKUP_DIR
    ln -svf $BACKUP_DIR/.config $HOME
fi


if [ -L ~/.zshrc ]; then
    echo "File already exists and is a symlink."
else
    # Create the symlink if it doesn't exist
    mv -v ~/.zshrc $BACKUP_DIR
    ln -svf $BACKUP_DIR/.zshrc $HOME 
fi

# Backs up currently installed brew packages, -f overrides current file
echo "${ARROW}Creating Brewfile..."
brew bundle dump -v -f --file Brewfile

echo "${GREEN}Done!${RESET}"

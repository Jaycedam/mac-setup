#!/bin/bash

# RESTORE DOTFILES
echo -e "${ARROW} Creating symlinks to home..."
ln -svf $BACKUP_DIR/.config $HOME

# This is for bat to see the local themes
# Remove it if you don't use bat
bat cache --build

#!/bin/bash

# RESTORE DOTFILES
echo -e "${ARROW}Creating symlinks to home..."
ln -svf $BACKUP_DIR/.config $HOME
ln -svf $BACKUP_DIR/.zshrc $HOME

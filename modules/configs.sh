#!/bin/bash

# RESTORE DOTFILES
echo -e "${ARROW}Restoring dotfiles..."
cp -R -p -v -i ${BACKUP_DIR}/.config $HOME
cp -v -i ${BACKUP_DIR}/.zshrc $HOME

#!/bin/bash

# RESTORE DOTFILES
echo -e "${ARROW}Restoring dotfiles..."
cp -R -p -v -i ${BACKUP_DIR}/.config $HOME
cp -v -i ${BACKUP_DIR}/.zprofile $HOME
cp -v -i ${BACKUP_DIR}/.zshrc $HOME

# Developer folder for projects
echo -e "${ARROW}Creating Developer folder..."
mkdir -p $HOME/Developer
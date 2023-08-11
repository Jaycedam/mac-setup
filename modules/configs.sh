#!/bin/bash

# Restore .config folder backup
echo -e "${ARROW}Restoring .config folder..."
cp -R -v -i ${BACKUP_DIR}/.config $HOME

# WM settings
echo -e "${ARROW}Restoring Amethyst settings..."
cp -v -i ${BACKUP_DIR}/com.amethyst.Amethyst.plist "$PREFERENCES_DIR"

# Developer folder for projects
echo -e "${ARROW}Creating Developer folder..."
mkdir -p $HOME/Developer
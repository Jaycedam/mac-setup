#!/bin/bash

# Restore .config folder backup
echo -e "${YELLOW}Restoring .config folder...${RESET}"
cp -R -p -v ${BACKUP_DIR}/.config $HOME

# WM settings
echo -e "${YELLOW}Restoring Amethyst settings...${RESET}"
cp -v ${BACKUP_DIR}/com.amethyst.Amethyst.plist "$PREFERENCES_DIR"

# Developer folder for projects
echo -e "${YELLOW}Creating Developer folder...${RESET}"
mkdir -p $HOME/Developer
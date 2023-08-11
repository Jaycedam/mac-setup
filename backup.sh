#!/bin/bash

# Variables and directory check 
source root.sh

echo -e "${YELLOW}Backing up .config folder...${RESET}"
cp -R -p -v ~/.config $BACKUP_DIR

# Backup current configs
echo -e "${YELLOW}Backing up Amethyst settings...${RESET}"
cp -v "$WM" $BACKUP_DIR

# Backs up currently installed brew packages, -f overrides current file
echo -e "${YELLOW}Backing up Brew packages...${RESET}"
brew bundle dump -v -f --file $BACKUP_DIR/Brewfile

echo -e "${GREEN}Done!${RESET}"
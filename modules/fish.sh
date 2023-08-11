#!/bin/bash

echo -e "${YELLOW}Setting up fish shell...${RESET}"
# Adds fish shell to known shells
sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
# Sets default shell to fish
chsh -s /opt/homebrew/bin/fish
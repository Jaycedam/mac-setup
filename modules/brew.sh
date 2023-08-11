#!/bin/bash

# Brew install and setup
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Enables brew in current env without saving to zprofile
eval $(/opt/homebrew/bin/brew shellenv)

# Disables brew telemetry
brew analytics off

# Brew Apps installed from Brewfile
echo -e "${YELLOW}Installing apps...${RESET}"
brew bundle install
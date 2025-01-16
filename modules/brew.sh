#!/bin/bash

# Brew install and setup
echo -e "${ARROW}Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Enables brew in current env
eval "$(/opt/homebrew/bin/brew shellenv)"

# Disables brew telemetry
echo -e "${ARROW}Disabling Homebrew telemetry..."
brew analytics off

# Brew Apps installed from Brewfile
echo -e "${ARROW}Installing apps..."
brew bundle install --file Brewfile

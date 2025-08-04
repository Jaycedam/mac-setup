#!/usr/bin/env bash

# Checks if Homebrew is installed
if command -v brew &>/dev/null; then
    echo -e "${YELLOW} Homebrew is already installed. Skipping..."
else
    # Brew install and setup
    echo -e "${ARROW} Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Enables brew in current env
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Disables brew telemetry
echo -e "${ARROW} Disabling Homebrew telemetry..."
brew analytics off

# Brew Apps installed from Brewfile
# TODO: separate darwin and linux brewfiles
echo -e "${ARROW} Installing apps..."
brew bundle install --file $ROOT_DIR/Brewfile

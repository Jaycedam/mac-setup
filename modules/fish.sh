#!/bin/bash

# Check if fish is installed
if command -v fish >/dev/null 2>&1; then
    # Path to fish shell
    fish_path="$(which fish)"

    # Check if fish is already in /etc/shells
    if ! grep -Fxq "$fish_path" /etc/shells; then
        # Add fish to known shells
        echo "$fish_path" | sudo tee -a /etc/shells

        # Change default user shell to fish
        chsh -s "$fish_path"
    else
        echo -e "${YELLOW}Fish shell is already in /etc/shells. Skipping."
    fi
else
    echo -e "${RED}Fish shell is not installed."
fi

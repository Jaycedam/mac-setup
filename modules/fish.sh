#!/usr/bin/env bash

set_fish_as_default_shell() {
    fish_path="$(which fish)"

    if ! grep -Fxq "$fish_path" /etc/shells; then
        echo -e "${ARROW} Adding fish to /etc/shells..."
        echo "$fish_path" | sudo tee -a /etc/shells
    fi
    echo -e "${YELLOW}Fish shell is already in /etc/shells. Skipping."

    echo -e "${ARROW} Changing default shell to fish..."
    chsh -s "$fish_path"
}

# Check if fish is installed
if command -v fish >/dev/null 2>&1; then
    set_fish_as_default_shell
else
    echo -e "${RED}Fish shell is not installed."
    echo -e "${ARROW} Installing fish..."
    brew install fish
    set_fish_as_default_shell
fi

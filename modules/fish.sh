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

# Installs fish if not installed, then sets it as the default shell
brew list fish >/dev/null 2>&1 || brew install fish
set_fish_as_default_shell

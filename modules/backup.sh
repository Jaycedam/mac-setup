#!/bin/bash

echo -e "${ARROW} Backing up dotfiles..."

# Most dotfiles will be here, in the .config folder.
# If you need to manually backup extra files, there's an example bellow for .zshrc
if [ -L ~/.config ]; then
    echo -e "${YELLOW}Directory .config is already a symlink. Skipping."
else
    # Create the symlink if it doesn't exist
    mv -v ~/.config $BACKUP_DIR
    ln -svf $BACKUP_DIR/.config $HOME
fi

# Backs up currently installed brew packages, -f overrides current file
echo -e "${ARROW} Creating Brewfile..."
brew bundle dump -vf --file $ROOT_DIR/Brewfile

echo -e "${GREEN}Done!${RESET}"

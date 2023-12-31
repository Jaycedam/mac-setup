#!/bin/bash

# RESTORE DOTFILES
echo -e "${ARROW}Restoring dotfiles..."
cp -R -p -v -i ${BACKUP_DIR}/.config $HOME
cp -v -i ${HOME}/.zprofile $HOME
cp -v -i ${HOME}/.zshrc $HOME
# END RESTORE DOTFILES

# VSCODIUM SETTINGS AND EXTENSIONS
# Makes sure directory exist, if not, create it
echo -e "${ARROW}Restoring VSCodium settings..."
mkdir -p "$VSC_SETTINGS"
# Copy settings.json
cp "$SCRIPT_DIR/$BACKUP_DIR/vscode/settings.json" "$VSC_SETTINGS"
# Disable gatekeeper for vscodium so it can install extensions without opening the app first
xattr -r -d com.apple.quarantine /Applications/VSCodium.app
# Install Extensions from the backup list vsc-extensions.txt
cat "$SCRIPT_DIR/$BACKUP_DIR/vsc-extensions.txt" | xargs -L 1 codium --install-extension

# Developer folder for projects
echo -e "${ARROW}Creating Developer folder..."
mkdir -p $HOME/Developer
# END VSCODIUM SETTINGS AND EXTENSIONS
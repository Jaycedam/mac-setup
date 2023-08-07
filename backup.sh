#!/bin/bash

# Backup current configs
echo "If you're having issues, make sure your current directory is /macos-setup."
echo "Backing up current config files..."
cp ~/Library/Preferences/com.amethyst.Amethyst.plist ./backup
cp -R ~/.config .
# Backs up currently installed brew packages, -f overrides current file
brew bundle dump -f

echo "Done."
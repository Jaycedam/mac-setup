#!/bin/bash

# Variables and directory check 
source root.sh

# Installs brew and packages from Brewfile
# You can update the Brewfile by creating your own backup (bash backup.sh) or manually
source modules/brew.sh

# Restores config files backed up
source modules/configs.sh

# Changes defaults macOS preferences
source modules/preferences.sh

# Changes default shell to fish shell (fish must be included in Brewfile)
source modules/fish.sh

echo "Next steps: Restart terminal to update shell changes."

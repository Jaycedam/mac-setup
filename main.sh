#!/bin/bash

# Variables and directory check
source root.sh

# Installs brew and packages from Brewfile
# You can update the Brewfile by creating your own backup (bash backup.sh) or manually
source modules/brew.sh

# Restores config files backed up
source modules/restore.sh

# LSP
source modules/lsp.sh

# Change default shell to Fish (fish needs to be in Brewfile)
source modules/fish.sh

# Only run this on macOS
if [ $OS = "Darwin" ]; then
    # Changes macOS defaults
    source modules/darwin/defaults.sh
    source modules/darwin/enviroment.sh
fi

echo -e "${ARROW} Next steps: Log out for all changes to apply."

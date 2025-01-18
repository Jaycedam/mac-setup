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

# Only run this on macOS
if [ $OS = "Darwin" ]; then
    # Changes macOS defaults
    source modules/darwin/defaults.sh
    source modules/darwin/enviroment.sh
# Only run this on Linux
elif [ $OS = "Linux" ]; then
    #
fi

echo -e "${ARROW} Next steps: run ${MAGENTA}source ~/.zshrc'${RESET} to see the shell changes."

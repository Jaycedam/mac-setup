#!/usr/bin/env bash

# LSP installation for Neovim
# Most of the LSPs should be included in the Brewfile, this file is for packages that are not in brew
# List and config defaults https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

# Installs node if not installed
brew list node >/dev/null 2>&1 || brew install node

echo -e "${ARROW} Installing extra language servers..."

# NPM
npm i -g @astrojs/language-server # astro

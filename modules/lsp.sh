#!/usr/bin/env bash

# LSP installation for Neovim
# Most of the LSPs should be included in the Brewfile, this file is for packages that are not in brew
# List and config defaults https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

# deps
brew install node

echo -e "${ARROW} Installing extra language servers..."

# NPM
npm i -g @astrojs/language-server # astro

#!/bin/bash

# LSP installation for Neovim
# Most of the LSPs should be included in the Brewfile, this file is for packages that are not in brew
# List and config defaults https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

echo -e "${ARROW} Installing extra language servers..."

# NPM
bun i -g @astrojs/language-server # astro
bun i -g @mdx-js/language-server  # mdx_analyzer
bun i -g typescript

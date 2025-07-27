#!/usr/bin/env bash

set -euo pipefail

# Paths
DOWNLOAD_DIR="$HOME/Downloads"
INSTALL_DIR="$HOME/.local/nvim-unstable"
BIN_DIR="$HOME/.local/bin"
SYMLINK="$BIN_DIR/nvim-unstable"
TARBALL_NAME="nvim-macos-arm64.tar.gz"
TARBALL_PATH="$DOWNLOAD_DIR/$TARBALL_NAME"
URL="https://github.com/neovim/neovim/releases/download/nightly/$TARBALL_NAME"

# Ensure directories exist
mkdir -p "$DOWNLOAD_DIR" "$BIN_DIR"

echo "Downloading Neovim nightly..."
curl -L -o "$TARBALL_PATH" "$URL"

# Remove previous install
rm -rf "$INSTALL_DIR"

echo "Extracting to $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"
tar -xzf "$TARBALL_PATH" -C "$INSTALL_DIR" --strip-components=1

# Create or update symlink
ln -sf "$INSTALL_DIR/bin/nvim" "$SYMLINK"

echo "nvim-unstable symlinked to $SYMLINK"

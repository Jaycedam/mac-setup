#!/bin/bash

# ------------------------------ Dock ------------------------------
# Position left
defaults write com.apple.dock "orientation" -string "left"
# Autohide
defaults write com.apple.dock "autohide" -bool "true"
# Disable recents
defaults write com.apple.dock "show-recents" -bool "false"

# ------------------------------ Finder ------------------------------
# Show file extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
# Show hidden files
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
# Show path bar
defaults write com.apple.finder "ShowPathbar" -bool "true"
# List view
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
# Keep folders on top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"
# Search scope current folder
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"

# ------------------------------ Spaces ------------------------------
# Disable rearrange Spaces automatically (useful for Amethyst WM)
defaults write com.apple.dock "mru-spaces" -bool "false"
# Groups windows by application on mission control
defaults write com.apple.dock expose-group-apps -bool true

# ----------------------------- Security -----------------------------
# Enable firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on


killall Dock && killall Finder
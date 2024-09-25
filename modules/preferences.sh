#!/bin/bash

echo -e "${ARROW}Changing macOS defaults..."

# Dock
defaults write com.apple.dock "autohide" -bool true # Autohide
defaults write com.apple.dock "autohide-delay" -float "0" # Disable delay on mouse over
defaults write com.apple.dock expose-group-apps -bool true # Groups windows by application on mission control
defaults write com.apple.dock "mru-spaces" -bool false # Disable rearrange Spaces automatically
defaults write com.apple.dock "show-recents" -bool false # Disable recents
defaults write com.apple.dock static-only -bool true # only show open apps on dock

# Finder
defaults write com.apple.finder "AppleShowAllFiles" -bool true # Show hidden files
defaults write com.apple.finder "ShowPathbar" -bool true # Show path bar
defaults write com.apple.finder "ShowStatusBar" -bool true # Show status bar
defaults write com.apple.finder "FXPreferredViewStyle" -string Nlsv # List view
defaults write com.apple.finder "_FXSortFoldersFirst" -bool true # Keep folders on top
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" # Search scope current folder
defaults write com.apple.finder "CreateDesktop" -bool true # Disable desktop icons
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool false # Disable drive icon on desktop

# Security
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on # Enable firewall

# Screencapture 
defaults write com.apple.screencapture "location" -string "~/Pictures"

defaults write NSGlobalDomain "AppleShowAllExtensions" -bool true # Show file extensions

# Privacy
defaults write com.apple.AdLib.plist allowApplePersonalizedAdvertising -bool false
defaults write com.apple.AdLib.plist allowIdentifierForAdvertising -bool false
defaults write com.apple.AdLib.plist personalizedAdsMigrated -bool false

# Set hostname
sudo scutil --set HostName jay-macbook

# NSGlobalDomain
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false # disables "corrects spelling automatically"
defaults write -g KeyRepeat -int 2 # key repeat rate: fast
defaults write -g InitialKeyRepeat -int 15 # delay until repeat: short

killall Dock && killall Finder && killall SystemUIServer # Restart dock and finder to apply changes

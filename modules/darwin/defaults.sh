#!/usr/bin/env bash

echo -e "${ARROW} Changing macOS defaults..."

# Dock
defaults write com.apple.dock autohide -bool true          # Autohide
defaults write com.apple.dock autohide-delay -float 0      # Disable delay on mouse over
defaults write com.apple.dock expose-group-apps -bool true # Groups windows by application on mission control
defaults write com.apple.dock mru-spaces -bool false       # Disable rearrange Spaces automatically
defaults write com.apple.dock show-recents -bool false     # Disable recents

# Menubar
defaults write com.apple.controlcenter BatteryShowPercentage -bool true # Show battery percentage on menubar
defaults write com.apple.menuextra.clock ShowAMPM -bool false           # hide AM/PM

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true                # Show hidden files
defaults write com.apple.finder AppleShowAllExtensions -bool true           # Show all file extensions
defaults write com.apple.finder ShowPathbar -bool true                      # Show path bar
defaults write com.apple.finder ShowStatusBar -bool true                    # Show status bar
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"         # Column view
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"         # Search scope current folder
defaults write com.apple.finder CreateDesktop -bool true                    # Disable desktop icons
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false # Disable drive icon on desktop
defaults write com.apple.finder NewWindowTarget -string "PfHm"              # Finder starts on home directory
defaults write com.apple.finder FXRemoveOldTrashItems -bool true            # Clean trash after 30 days
defaults write com.apple.finder _FXSortFoldersFirst -bool true              # sort folder first
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true     # sort folder first on desktop

# Hide items from Desktop
defaults write com.apple.finder CreateDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Screencapture
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"

# Screensaver
defaults write com.apple.screensaver askForPassword -bool true  # Ask for password on screensaver
defaults write com.apple.screensaver askForPasswordDelay -int 0 # No delay for screensaver password

# Privacy
defaults write com.apple.AdLib.plist allowApplePersonalizedAdvertising -bool false
defaults write com.apple.AdLib.plist allowIdentifierForAdvertising -bool false
defaults write com.apple.AdLib.plist personalizedAdsMigrated -bool false

# Firewall
# enable firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
# Stealth mode: it hides your Mac from network probes like ping, not responding to unsolicited requests.
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# Set hostname
sudo scutil --set HostName jay-macbook

# NSGlobalDomain
defaults write NSGlobalDomain AppleShowAllExtensions -bool true    # Show file extensions
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false # disables "corrects spelling automatically"
defaults write -g KeyRepeat -int 2                                 # key repeat rate: fast
defaults write -g InitialKeyRepeat -int 25                         # delay until repeat key starts

killall Dock && killall Finder && killall SystemUIServer # Restart dock and finder to apply changes

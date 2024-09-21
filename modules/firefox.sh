#!/bin/bash

FIREFOX_DIR="$HOME/Library/Application Support/Firefox"
PROFILE_DIR="$FIREFOX_DIR/Profiles/default"

echo "Creating new profile..."
/Applications/Firefox.app/Contents/MacOS/firefox -CreateProfile "default $PROFILE_DIR"

echo "Downloading Betterfox user.js into new profile..."
curl --output "$PROFILE_DIR/user.js" "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js" 

echo "Changing profiles.ini to prevent the creation of Firefox default profiles..."
# Check if the profiles.ini file exists
if [[ -f "$FIREFOX_DIR/profiles.ini" ]]; then
    # Use sed to replace StartWithLastProfile=1 with StartWithLastProfile=0
    sed -i ".backup" "s/^StartWithLastProfile=1/StartWithLastProfile=0/" "$FIREFOX_DIR/profiles.ini"
    echo "Updated StartWithLastProfile to 0 in profiles.ini."
else
    echo "profiles.ini not found at $FIREFOX_DIR"
fi

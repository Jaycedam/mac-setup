#!/usr/bin/env bash

# Script to add persistent apps to the dock

set -euo pipefail

# System Apps are on /System/Applications
apps=(
    "/Applications/Brave Browser.app"
    "/Applications/Ghostty.app"
    "/Applications/Steam.app"
)

plist="$HOME/Library/Preferences/com.apple.dock.plist"

/usr/libexec/PlistBuddy -c "Delete persistent-apps" "$plist" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add persistent-apps array" "$plist"

index=0
for app_path in "${apps[@]}"; do
    /usr/libexec/PlistBuddy -c "Add persistent-apps:$index dict" "$plist"
    /usr/libexec/PlistBuddy -c "Add persistent-apps:$index:tile-data dict" "$plist"
    /usr/libexec/PlistBuddy -c "Add persistent-apps:$index:tile-data:file-data dict" "$plist"
    /usr/libexec/PlistBuddy -c "Add persistent-apps:$index:tile-data:file-data:_CFURLString string file://${app_path}" "$plist"
    /usr/libexec/PlistBuddy -c "Add persistent-apps:$index:tile-data:file-data:_CFURLStringType integer 15" "$plist"
    /usr/libexec/PlistBuddy -c "Add persistent-apps:$index:tile-type string file-tile" "$plist"
    ((index++))
done

killall Dock

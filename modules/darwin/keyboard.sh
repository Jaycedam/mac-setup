#!/usr/bin/env bash

# setup-kanata-service.sh
# Installs Karabiner DriverKit, Kanata, and sets up LaunchDaemons (no disk logging)

set -euo pipefail

#### CONFIGURATION ####
KANATA_CONFIG="${HOME}/.config/kanata/config.kbd"
KANATA_PORT=10000
PLIST_DIR="/Library/LaunchDaemons"
###################################

# 1. Fetch & install latest Karabiner DriverKit pkg
echo "Fetching latest Karabiner DriverKit pkg URL..."
DRIVERKIT_PKG_URL=$(
    curl -s "https://api.github.com/repos/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice/releases/latest" |
        jq -r '.assets[] | select(.name|endswith(".pkg")) | .browser_download_url'
)
echo "Downloading DriverKit from: $DRIVERKIT_PKG_URL"
curl -L -o /tmp/karabiner-driverkit.pkg "$DRIVERKIT_PKG_URL"
echo "Installing DriverKit..."
sudo installer -pkg /tmp/karabiner-driverkit.pkg -target /
rm -f /tmp/karabiner-driverkit.pkg

# 2. Install Kanata via Homebrew if not present
brew list kanata >/dev/null 2>&1 || brew install kanata

KANATA_BIN=$(command -v kanata)

# 3. Write plist files
sudo tee "${PLIST_DIR}/com.example.kanata.plist" >/dev/null <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
  <key>Label</key><string>com.example.kanata</string>
  <key>ProgramArguments</key><array>
    <string>${KANATA_BIN}</string>
    <string>-c</string><string>${KANATA_CONFIG}</string>
    <string>--port</string><string>${KANATA_PORT}</string>
  </array>
  <key>RunAtLoad</key><true/>
  <key>KeepAlive</key><true/>
</dict></plist>
EOF
sudo chown root:wheel "${PLIST_DIR}/com.example.kanata.plist"
sudo chmod 644 "${PLIST_DIR}/com.example.kanata.plist"

sudo tee "${PLIST_DIR}/com.example.karabiner-vhiddaemon.plist" >/dev/null <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
  <key>Label</key><string>com.example.karabiner-vhiddaemon</string>
  <key>ProgramArguments</key><array>
    <string>/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon</string>
  </array>
  <key>RunAtLoad</key><true/>
  <key>KeepAlive</key><true/>
</dict></plist>
EOF
sudo chown root:wheel "${PLIST_DIR}/com.example.karabiner-vhiddaemon.plist"
sudo chmod 644 "${PLIST_DIR}/com.example.karabiner-vhiddaemon.plist"

sudo tee "${PLIST_DIR}/com.example.karabiner-vhidmanager.plist" >/dev/null <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
  <key>Label</key><string>com.example.karabiner-vhidmanager</string>
  <key>ProgramArguments</key><array>
    <string>/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager</string>
    <string>activate</string>
  </array>
  <key>RunAtLoad</key><true/>
</dict></plist>
EOF
sudo chown root:wheel "${PLIST_DIR}/com.example.karabiner-vhidmanager.plist"
sudo chmod 644 "${PLIST_DIR}/com.example.karabiner-vhidmanager.plist"

# 4. Bootstrap and enable services
sudo launchctl bootstrap system "${PLIST_DIR}/com.example.kanata.plist"
sudo launchctl enable system/com.example.kanata.plist

sudo launchctl bootstrap system "${PLIST_DIR}/com.example.karabiner-vhiddaemon.plist"
sudo launchctl enable system/com.example.karabiner-vhiddaemon.plist

sudo launchctl bootstrap system "${PLIST_DIR}/com.example.karabiner-vhidmanager.plist"
sudo launchctl enable system/com.example.karabiner-vhidmanager.plist

# 5. Prompt for permissions
# Opens System Preferences to see karabiner extension
echo -e "Opening System Preferences, Karabiner will prompt you for permission."
open -b com.apple.systempreferences
read -rp "Allow the extension, then press Enter to continue... "

echo -e "Copy /opt/homebrew/bin"
echo -e "Opening Accesibility permissions, press Shift+Command+G then paste the path..."
open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
read -rp "Add the Kanata binary, then press Enter to continue... "

echo -e "Opening Input Monitoring permissions, press Shift+Command+G then paste the path..."
open "x-apple.systempreferences:com.apple.preference.security?Privacy_ListenEvent"
read -rp "Add the Kanata binary, then press Enter to continue... "

echo "Kanata and Karabiner services are now installed and enabled."

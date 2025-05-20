#!/usr/bin/env bash
# setup-kanata-service.sh
# Fetches & installs latest Karabiner DriverKit, installs Kanata, creates LaunchDaemons, and enables them.

#### CONFIGURATION (edit as needed) ####
KANATA_CONFIG="${HOME}/.config/kanata/config.kbd"
KANATA_PORT=10000
KANATA_DEBUG_FLAG="--debug"          # leave empty for no debug
PLIST_DIR="/Library/LaunchDaemons"
LOG_DIR="/Library/Logs/Kanata"
#########################################

# 1. Fetch & install latest Karabiner DriverKit pkg
echo "Fetching latest Karabiner DriverKit pkg URL..."
DRIVERKIT_PKG_URL=$(
  curl -s "https://api.github.com/repos/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice/releases/latest" \
    | jq -r '.assets[] | select(.name|endswith(".pkg")) | .browser_download_url'
)
echo "Downloading DriverKit from: $DRIVERKIT_PKG_URL"
curl -L -o /tmp/karabiner-driverkit.pkg "$DRIVERKIT_PKG_URL"
echo "Installing DriverKit..."
sudo installer -pkg /tmp/karabiner-driverkit.pkg -target /

# 2. Install Kanata via Homebrew
# ——— Ensure Kanata is installed ———
if which kanata >/dev/null 2>&1; then
  echo "Kanata is already on PATH; skipping install."
else
  echo "Kanata not found; installing via Homebrew..."
  brew install kanata
fi

# 3. Prepare log directory
sudo mkdir -p "${LOG_DIR}"
sudo chown root:wheel "${LOG_DIR}"
sudo chmod 755 "${LOG_DIR}"

# 4. Helper to write plist files
write_plist() {
  local name="$1"; shift
  local content="$1"; shift
  echo "${content}" | sudo tee "${PLIST_DIR}/${name}.plist" >/dev/null
  sudo chown root:wheel "${PLIST_DIR}/${name}.plist"
  sudo chmod 644 "${PLIST_DIR}/${name}.plist"
}

# 5. com.example.kanata.plist
read -r -d '' KANATA_PLIST <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" \
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
  <key>Label</key><string>com.example.kanata</string>
  <key>ProgramArguments</key><array>
    <string>/opt/homebrew/bin/kanata</string>
    <string>-c</string><string>${KANATA_CONFIG}</string>
    <string>--port</string><string>${KANATA_PORT}</string>
    $( [[ -n "${KANATA_DEBUG_FLAG}" ]] && echo "<string>${KANATA_DEBUG_FLAG}</string>" )
  </array>
  <key>RunAtLoad</key><true/>
  <key>KeepAlive</key><true/>
  <key>StandardOutPath</key><string>${LOG_DIR}/kanata.out.log</string>
  <key>StandardErrorPath</key><string>${LOG_DIR}/kanata.err.log</string>
</dict></plist>
EOF
write_plist "com.example.kanata" "${KANATA_PLIST}"

# 6. com.example.karabiner-vhiddaemon.plist
read -r -d '' VHIDDAEMON_PLIST <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" \
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
write_plist "com.example.karabiner-vhiddaemon" "${VHIDDAEMON_PLIST}"

# 7. com.example.karabiner-vhidmanager.plist
read -r -d '' VHIDMANAGER_PLIST <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" \
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
write_plist "com.example.karabiner-vhidmanager" "${VHIDMANAGER_PLIST}"

# 8. Bootstrap & enable each service (no loop)
echo "Bootstrapping & enabling kanata..."
sudo launchctl bootstrap system "${PLIST_DIR}/com.example.kanata.plist"
sudo launchctl enable system/com.example.kanata.plist

echo "Bootstrapping & enabling karabiner-vhiddaemon..."
sudo launchctl bootstrap system "${PLIST_DIR}/com.example.karabiner-vhiddaemon.plist"
sudo launchctl enable system/com.example.karabiner-vhiddaemon.plist

echo "Bootstrapping & enabling karabiner-vhidmanager..."
sudo launchctl bootstrap system "${PLIST_DIR}/com.example.karabiner-vhidmanager.plist"
sudo launchctl enable system/com.example.karabiner-vhidmanager.plist

# Opens settings to enable Kanata
open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
echo "Add /opt/homebrew/bin/kanata to the list of apps."
echo "Add Kanata to Accessibility then press Enter to continue..."
echo "Opening Accessibility settings. Add Kanata then press Enter to continue..."
read -r
echo "Add Kanata to Input Monitoring then press Enter to continue..."
open "x-apple.systempreferences:com.apple.preference.security?Privacy_ListenEvent"
read -r 

echo "Starting services..."
sudo launchctl start com.example.kanata
sudo launchctl start com.example.karabiner-vhiddaemon
sudo launchctl start com.example.karabiner-vhidmanager

echo "Kanata is now enabled."

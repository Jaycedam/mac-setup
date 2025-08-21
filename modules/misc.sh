#!/usr/bin/env bash

echo -e "${ARROW} Setting up Touch ID for sudo using sudo_local (macOS 14+)"
# Check if /etc/pam.d/sudo_local exists
if [ ! -f "/etc/pam.d/sudo_local" ]; then
    # Create sudo_local and add the line for Touch ID
    echo "auth       sufficient     pam_tid.so" | sudo tee /etc/pam.d/sudo_local >/dev/null
    echo -e "${GREEN}Success${RESET}. Touch ID for sudo enabled using sudo_local, this method persist across software updates (macOS 14+)."
else
    echo -e "${RED}File /etc/pam.d/sudo_local already exists.${RESET} File not modified."
fi

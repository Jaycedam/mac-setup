#!/bin/bash

# Restore config files backup
echo "Restoring config files..."
cp -R .config ~
# WM settings
cp ./backup/com.amethyst.Amethyst.plist  ~/Library/Preferences
# Developer folder for projects
mkdir ~/Developer
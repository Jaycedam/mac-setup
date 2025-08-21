#!/usr/bin/env bash

# Start services
echo -e "${ARROW} Starting services"
brew services start borders

echo -e "${ARROW} Starting Aerospace..."
open -a "Aerospace"
read -rp "Allow Aerospace permissions then press any key to continue..."
open -a "Aerospace"

# TODO: add the rest of the apps

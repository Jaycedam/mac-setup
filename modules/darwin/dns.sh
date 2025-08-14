#!/usr/bin/env bash

# Script that installs the latest mullvad dns (with adblock) profile from GitHub

# GitHub repository info
OWNER="mullvad"
REPO="encrypted-dns-profiles"
DIR="blocklists" # Changed PATH to DIR for the directory

# GitHub API URL to list contents of the blocklists directory
API_URL="https://api.github.com/repos/$OWNER/$REPO/contents/$DIR"

# Use curl to get the list of files in the blocklists directory
echo -e "${ARROW} Starting DNS profile setup..."
FILES=$(curl -s "$API_URL" | jq -r '.[] | select(.name | test("https")) | .name')

# Check if we got any files
if [[ -z "$FILES" ]]; then
    echo "No matching files found!"
    exit 1
fi

# Display the list of matching files
echo "The following matching profiles were found:"
echo "$FILES"

# Ask for user confirmation
echo
read -rp "Dowload dns profile? (y/n): " APPROVAL

if [[ "$APPROVAL" != "y" ]]; then
    echo "Download canceled."
    exit 0
fi

# If user approves, proceed to download the first matching file
PROFILE_NAME=$(echo "$FILES" | head -n 1)
PROFILE_URL=$(curl -s "$API_URL" | jq -r ".[] | select(.name == \"$PROFILE_NAME\") | .download_url")

# Set the path where the profile will be downloaded
PROFILE_PATH="/tmp/$PROFILE_NAME"

# Download the mobileconfig file using the URL from the GitHub API
echo "Downloading the profile from GitHub..."
curl -L -o "$PROFILE_PATH" "$PROFILE_URL"

# Check if the file was downloaded successfully
if [[ -f "$PROFILE_PATH" ]]; then
    echo "Profile downloaded successfully."

    open "$PROFILE_PATH"
    echo "The profile has been installed!"
    echo "Please open System Settings > Profiles and approve the dns profile."
    read -rp "Press any key to continue..."
    echo "Cleaning up..."
    rm "$PROFILE_PATH"
else
    echo "Failed to download the profile."
fi

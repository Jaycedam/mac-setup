#!/bin/bash

echo "Setting up fish shell..."
# Adds fish shell to known shells
sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
# Sets default shell to fish
chsh -s /opt/homebrew/bin/fish
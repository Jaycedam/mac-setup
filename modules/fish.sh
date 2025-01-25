#!/bin/bash

# Add fish to known shells
echo "$(which fish)" | sudo tee -a /etc/shells

# Change default user shell
chsh -s "$(which fish)"

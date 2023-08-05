# Brew install and setup
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Restore backups
echo "Restoring config files..."
cp -R .config ~
# WM settings
cp ./configs/com.amethyst.Amethyst.plist  ~/Library/Preferences

eval $(/opt/homebrew/bin/brew shellenv)

# Brew Apps
echo "Installing apps..."
brew bundle install --file Brewfile

echo "Setting up fish shell..."
# Adds fish shell to known shells
sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
# Sets default shell to fish
chsh -s /opt/homebrew/bin/fish
echo "Next steps: Change default font for Fira Code Mono and restart terminal. (Optional) Run fish_config."
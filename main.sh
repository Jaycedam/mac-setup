# Brew install and setup
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Restore backups
echo "Restoring config files..."
cp ./configs/.zshrc .configs/.p10k.zsh ./configs/.zprofile ~
# WM settings
cp ./configs/com.amethyst.Amethyst.plist  ~/Library/Preferences

eval $(/opt/homebrew/bin/brew shellenv)

# Brew Apps
echo "Adding brew taps..."
brew homebrew/cask-fonts
echo "Installing apps..."
brew install visual-studio-code postgres-unofficial iina adguard transmission brave-browser utm gimp insomnia zsh-syntax-highlighting zsh-autosuggestions amethyst lulu node font-fira-code-nerd-font romkatv/powerlevel10k/powerlevel10k
echo "Done." 
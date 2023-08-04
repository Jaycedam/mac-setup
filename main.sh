# Brew install and setup
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Restore backups
echo "Restoring config files..."
cp ./configs/.zshrc ./configs/.zprofile ~
cp ./configs/com.amethyst.Amethyst.plist  ~/Library/Preferences

eval $(/opt/homebrew/bin/brew shellenv)

# ZSH themes
echo "Getting zsh themes..."
mkdir .zsh-themes
cd .zsh-themes
git clone https://github.com/dracula/zsh.git
mv zsh dracula
cd

# Brew Apps
echo "Adding brew taps..."
brew homebrew/cask-fonts
echo "Installing apps..."
brew install visual-studio-code postgres-unofficial iina adguard transmission brave-browser utm gimp insomnia zsh-syntax-highlighting zsh-autosuggestions amethyst neofetch lulu node font-fira-code-nerd-font
echo "Done."
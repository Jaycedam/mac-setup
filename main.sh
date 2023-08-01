# Brew install and setup
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Restore backups
echo "Restoring config files..."
cp ./configs/.zshrc ./configs/.zprofile ~
cp -a ./fonts/. ~/Library/Fonts

eval $(/opt/homebrew/bin/brew shellenv)

# ZSH themes
echo "Getting zsh themes..."
mkdir .zsh-themes
cd .zsh-themes
git clone https://github.com/dracula/zsh.git
cd

# Brew Apps
echo "Installing apps..."
brew install visual-studio-code postgres-unofficial iina adguard transmission brave-browser utm gimp insomnia handbrake zsh-syntax-highlighting zsh-autosuggestions

echo "Done."
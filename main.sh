# Brew install and setup
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Restore config files
echo "Restoring config files..."
cp ./configs/.zshrc ./configs/.zprofile ./configs/.p10k.zsh ~
cp -a ./fonts/. ~/Library/Fonts

eval $(/opt/homebrew/bin/brew shellenv)

# Brew Apps
echo "Installing apps..."
brew install visual-studio-code postgres-unofficial iina adguard transmission brave-browser utm gimp insomnia handbrake romkatv/powerlevel10k/powerlevel10k zsh-syntax-highlighting
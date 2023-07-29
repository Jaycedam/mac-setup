# Backup current configs
echo "Backing up current config files..."
cp ~/.zshrc ~/.zprofile ~/.p10k.zsh ./configs
# Backup user fonts
cp -a ~/Library/Fonts/. ./fonts
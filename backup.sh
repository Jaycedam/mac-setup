# Backup current configs
echo "Backing up current config files..."
cp ~/.zshrc ~/.zprofile ./configs

# Backup user fonts
echo "Backing up user Fonts..."
cp -a ~/Library/Fonts/. ./fonts

echo "Done."
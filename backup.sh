# Backup current configs
echo "If you're having issues, make sure your current directory is /macos-setup."
echo "Backing up current config files..."
cp ~/.zprofile ~/Library/Preferences/com.amethyst.Amethyst.plist ./configs
cp -R ~/.config .

echo "Done."
# Personal macOS scripts for faster setup

The main.sh installs Homebrew, restores config files, fonts, zsh themes then installs apps with brew.

## Instructions

```
git clone https://github.com/Jaycedam/macos-setup.git
cd macos-setup
sh main.sh
```

## Update configs

The `backup.sh` script currently backs up config files (.zshrc, .zprofile, amethyst plist). Run <code>sh backup.sh</code> to update the backup that `main.sh` restores.

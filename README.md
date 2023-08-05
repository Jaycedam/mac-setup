# Personal macOS scripts for faster setup

The main.sh installs Homebrew, restores config files (.zprofile, fish config, amethyst config), installs apps with brew then sets up fish as the default user shell.

## Instructions

```
git clone https://github.com/Jaycedam/macos-setup.git
cd macos-setup
sh main.sh
```

## Update configs

The `backup.sh` script currently backs up config files (.zprofile, amethyst plist, brew packages and fish config). Run `sh backup.sh` to update the backup that `main.sh` restores.

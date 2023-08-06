# MacOS scripts for automated setup

Opinionated automation scripts to set up macOS. This project installs [Homebrew](https://brew.sh), restores the backed up config files (zprofile, amethyst preferences, neofetch and fish shell config). Then installs the Brew packages from the bundle `Brewfile`. It also changes the default shell to the [fish shell](https://fishshell.com).

## Instructions

For the automated setup run in the terminal:

```sh
git clone https://github.com/Jaycedam/macos-setup.git
cd macos-setup
sh main.sh
```

To update the backup to the current config files, run `sh backup.sh`. This will update the files mentioned in the previous section. Since it uses brew bundle to back up the installed packages, you must have installed Homebrew.
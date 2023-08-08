<div align="center">
    <img src="images/continuous.png" height="80" width="auto">
    <h1 style="font-size: larger">MacOS automated setup</h1>
    <p style="font-size: small">Opinionated automation scripts to set up macOS.</p>
    <br>
</div>


This project installs [Homebrew](https://brew.sh), restores the backed up config files (amethyst preferences, neofetch and fish shell config). Then installs the Brew packages from the bundle `Brewfile`. It also changes the default shell to the [fish shell](https://fishshell.com) and changes the default preferences for macOS, check `modules/preferences.sh` to see the changes.

## Instructions

For the automated setup run in the terminal:

```sh
git clone https://github.com/Jaycedam/macos-setup.git
cd macos-setup
bash main.sh
```

To update the backup to your current config files, run `sh backup.sh`. This will update the files mentioned in the previous section. Since it uses brew bundle to back up the installed packages, you must have installed Homebrew.

## Todo
- [ ] Add vscodium profile backup/restore
- [ ] Add NONINTERACTIVE for brew installation
- [ ] Update README with more info and screenshots
- [ ] Add modification instructions to README

## Acknowledgments
- [macOS defaults list](https://macos-defaults.com/)
- [Brew docs](https://docs.brew.sh/Manpage)
- [Project icon](https://www.flaticon.com/free-icon/continuous_8916345)

<div align="center">
    <img src="images/logo.png" height="80" width="auto">
    <h1 style="font-size: larger">MacOS automated setup</h1>
    <p style="font-size: small">Opinionated automation scripts to set up macOS.</p>
    <br>
</div>

This project restores the backed up .config files, installs [Homebrew](https://brew.sh) and the packages included on the bundle [Brewfile](Brewfile). Then changes some default preferences for macOS, check [preferences.sh](modules/preferences.sh) to see the changes.

The default shell is set to the [fish shell](https://fishshell.com) for better OOB experience and autosuggestions, since zsh plugins rely on history.

## Instructions

For the automated setup just run:

```sh
git clone https://github.com/Jaycedam/mac-setup.git && cd mac-setup && bash main.sh
```

## Manual settings

- Lock screen: Set required password after screen is off to **inmediatly** for security reasons.
- Spaces: Create more Spaces and enable keyboard shortcuts, then assign apps to their dedicated space. This will offer a better tiling window manager experience.

![Keyboard shortcuts](images/keyboard-shortcuts.png)
![Assign to desktop](images/spaces.png)

- Safari: Enable hide my ip and disable telemetry in Privacy tab.

## Backup your config

To update the backup to your current config files, run `bash backup.sh`. This will backup the .config folder in your home directory, as well as your Amethyst settings. It also creates a Brew bundle with your installed packages, so you need Homebrew. Then running `main.sh` will restore your config files on a new setup. Since this is my personal config, if you don't install some listed packages you will need to remove its dependencies in the code to avoid issues.

Todo.

## Todo

- [ ] Add vscodium profile backup/restore
- [x] Update terminal profile within script (Migrated to kitty)
- [ ] Update README with more info and screenshots
- [ ] Add modification instructions to README
- [ ] Automate manual settings post script
- [ ] Check if Brew is already installed
- [ ] Add macOS preferences changes in README

## Acknowledgments

- [macOS defaults list](https://macos-defaults.com/)
- [Brew docs](https://docs.brew.sh/Manpage)
- [Project icon](https://www.flaticon.com/free-icon/continuous_8916345)

```

```

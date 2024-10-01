<div align="center">
    <img src="images/logo.png" height="80" width="auto">
    <h1 style="font-size: larger">MacOS automated setup</h1>
    <br>
</div>

Opinionated automation shell scripts to set up macOS.

- Installs [Homebrew](https://brew.sh).
- Restores current backup:
  - Symlinks dotfiles from the repo to the home folder (.config folder, .zshrc).
  - Installs packages listed in a [Brewfile](Brewfile) using Homebrew.
- Changes some macOS default preferences; see full list [here](modules/preferences.sh).
- Creates a blank Firefox profile with [Betterfox's](https://github.com/yokoffing/BetterFox) user.js.

## Screenshots
> [!NOTE]  
> I don't update these often, so they may be out of date.

### Wezterm and Neovim
![Wezterm and Neovim](images/wezterm.webp)

## Instructions

To make this work for you, fork the project, follow the instructions to update the backup then sync your changes.
Make sure to replace the URL from the Automatic Setup section.

> [!CAUTION]
> This is just an example, do not run this unless you want all my dotfiles and preferences. Make sure to backup your current dotfiles first.

Check dependencies:
```sh
git -v
```

Automatic setup:
```sh
mkdir ~/Developer
git clone https://github.com/Jaycedam/mac-setup.git ~/Developer/mac-setup
cd ~/Developer/mac-setup && sh main.sh
```

## Update the backup:
After you fork the project and have the project locally, run these commands from the project directory.
The default path is ~/Developer/mac-setup, unless you modify it.

Delete previous backup:
```sh
rm -rf dotfiles/*
```
Create new backup:
```sh
sh backup.sh
```

This will move your dotfiles (.zshrc and .config folder) to the project directory and create symlinks to $HOME. It will also back up all the brew packages into a Brewfile (homebrew must already be installed). Now you'll manage all your dotfiles from the project directory. 

*You only need to run backup.sh again when you want to back up your new brew packages, or if you modify the script.*

## Manual settings

Some settings must be changed manually due to API limitation or lack of Apple documentation. Check [this issue](https://github.com/Jaycedam/mac-setup/issues/13) for more details.

## Credit

- [macOS defaults list](https://macos-defaults.com/)
- [Brew docs](https://docs.brew.sh/Manpage)
- [Project icon](https://www.flaticon.com/free-icon/continuous_8916345)

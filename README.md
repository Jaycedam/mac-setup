# MacOS Automated Setup
Opinionated automation shell scripts to set up macOS.

- Installs [Homebrew](https://brew.sh).
- Restores the current backup:
  - Symlinks dotfiles from the repo to the home folder (.config/ and .zshrc).
  - Installs packages listed in a [Brewfile](Brewfile) using [brew](https://brew.sh) and [mas](https://github.com/mas-cli/mas) (for App Store apps).
- Changes some macOS default preferences; see the full list [here](modules/preferences.sh).
- Creates a blank Firefox profile with [Betterfox's](https://github.com/yokoffing/BetterFox) user.js.

## Screenshots

I try to keep all my configs very minimal while maintaining all the features I need.

> [!NOTE]  
> I don't update these often, so they may be out of date.

### Wezterm and Neovim
![Wezterm and Neovim](images/wezterm.webp)

## Automated setup
> [!CAUTION]
> This will ovewrite your dotfiles. Ff you want to use this project with your own backup [read this first](#how-to-use).

Check dependencies:
```sh
git -v
```

Start:
```sh
mkdir ~/Developer
git clone https://github.com/Jaycedam/mac-setup.git ~/Developer/mac-setup
cd ~/Developer/mac-setup && sh main.sh
```

## Manual settings
Some settings must be changed manually due to API limitation or lack of documentation. Check [this issue](https://github.com/Jaycedam/mac-setup/issues/13) for more details.

---

## How to use
If you want to use this project with your own dotfiles and configs, just follow these instructions:

> [!NOTE]
> The path **~/Developer/mac-setup** is expected by the script; it's used to generate symlinks and relative path operations.

1. Fork the project then git clone (Replace **USERNAME** with yours):
```sh
git clone https://github.com/USERNAME/mac-setup.git ~/Developer/mac-setup
```

2. Delete my backup:
```sh
cd ~/Developer/mac-setup && rm -rf dotfiles/*
```

3. Back up your dotfiles and Brew packages (you need to have Brew installed, or you can manually modify the Brewfile).
```sh
cd ~/Developer/mac-setup && sh backup.sh
```

This will move your current dotfiles (.config/ and .zshrc) into the project directory, then create symlinks to $HOME. It will also back up all the brew packages into a Brewfile (Brew must already be installed, or you can manually edit the Brewfile). Now you'll manage all your dotfiles from the project directory. 

*You only need to run backup.sh again when you want to back up your new brew packages or if you modify the dotfiles list.*

---

## Credit
- [macOS defaults list](https://macos-defaults.com/)

# MacOS Automated Setup

Automation scripts to set up macOS for software development, privacy and general use.

## The main script:

When running the main script, you can select the automated setup or to update the backup. Here's a description for each option:

- **Automated Setup**
    - Installs [Homebrew](https://brew.sh).
    - Restores backup:
        - Symlinks [dotfiles](./dotfiles/) from the repo to the home folder.
        - Installs packages from a [Brewfile](Brewfile) using [brew](https://brew.sh), [mas](https://github.com/mas-cli/mas) and some [Language Servers](./modules/lsp.sh) missing from Brew, using npm.
    - Changes macOS [default preferences](modules/darwin/defaults.sh) and specific [Darwin tweaks](./modules/darwin/enviroment.sh) (eg: TouchID for sudo).
    - Installs Colemak-dh layout.
    - [Advanced keyboard remaps](dotfiles/.config/kanata/config.kbd) with home row mods and layers, using Kanata.
- **Update Backup**
    - Moves dotfiles (.config/ and .zshrc) to the project directory then creates symlinks back to $HOME.
    - Updates Brewfile from brew packages installed.

> [!CAUTION]
> Choosing Automated Setup will overwrite your dotfiles. If you want to use this project with your own backup [read the wiki.](https://github.com/Jaycedam/mac-setup/wiki).

Check dependencies:

```sh
git -v
```

Start:

```sh
git clone https://github.com/Jaycedam/mac-setup.git ~/Developer/mac-setup
bash ~/Developer/mac-setup/main.sh
```

Then select the option for the automatic setup.

## Manual settings

Some settings must be changed manually due to API limitation or lack of documentation. Check [this issue](https://github.com/Jaycedam/mac-setup/issues/13) for more details.

---

## Credit

- [macOS defaults list](https://macos-defaults.com/)

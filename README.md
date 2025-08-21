# MacOS Automated Setup

Automation scripts to set up macOS for software development, privacy and general use.

## Features

When running the main script, you can select between **automated setup** or **update backup**.
Here's what each option does:

1. **Automated Setup**
    - Install [homebrew](https://brew.sh) and packages listed in [Brewfile](Brewfile).
    - Symlink [dotfiles](dotfiles) to the home directory.
    - Install [fish shell](https://fishshell.com) and use it as the default shell.
    - Install [additional LSP servers](modules/lsp.sh) missing from brew packages using npm.
    - Change [macOS defaults](modules/defaults.sh) for finder, dock, etc.
    - Modify [persistent dock apps](modules/dock_apps.sh).
    - [Misc macOS settings](modules/enviroment.sh) like touchid for sudo, etc.
    - Set up [Kanata](https://github.com/jtroo/kanata) and Karabiner driver as launchd services for keyboard customization and layers.
    - Set up DNS over HTTPS with blocking ads and trackers using [Mullvad dns](https://mullvad.net/en/help/dns-over-https-and-dns-over-tls).

2. **Update Backup**
    - Moves dotfiles (.config/ and .zshrc) to the project directory then creates symlinks back to $HOME.
    - Updates Brewfile from brew packages installed.

> [!CAUTION]
> Choosing Automated Setup will overwrite your dotfiles. If you want to use this project with your own backup [read the wiki.](https://github.com/Jaycedam/mac-setup/wiki).

Install dependencies:

```sh
xcode-select --install
```

Start:

```sh
git clone https://github.com/Jaycedam/mac-setup.git ~/dev/mac-setup
bash ~/dev/mac-setup/main.sh
```

Then select the option you want to run.

## Manual settings

Some settings must be changed manually due to API limitation or lack of documentation. Check [this issue](https://github.com/Jaycedam/mac-setup/issues/13) for more details.

---

## Credit

- [macOS defaults list](https://macos-defaults.com/)

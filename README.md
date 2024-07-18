<div align="center">
    <img src="images/logo.png" height="80" width="auto">
    <h1 style="font-size: larger">MacOS automated setup</h1>
    <!-- <p style="font-size: small">Opinionated automation scripts to set up macOS.</p> -->
    <br>
</div>

Opinionated automation shell scripts to set up macOS. The script does the following:

- Installs [Homebrew](https://brew.sh).
- Restores current backup:
  - dotfiles (.config folder, .zprofile, .zshrc)
  - Installed packages by Homebrew on a [Brewfile](backup/Brewfile).
- Changes some macOS default preferences:
  - Dock: Autohide, Recents disabled
  - Finder: Show file extensions, show hidden files, show path bar, list view default, keep folders on top, search scope to current folder.
  - Spaces: Disable rearrange Spaces automatically, group by app in mission control.
  - Security: Enables firewall.

## Instructions

Example: For the automated setup, clone the repo and run the script.

**DO NOT RUN THIS UNLESS YOU WANT MY BACKUP TO REWRITE YOUR FILES, THIS IS AN EXAMPLE OF HOW TO RUN THE SCRIPT AFTER YOU UPDATE THE BACKUP TO YOUR OWN AND WANT TO RESTORE. JUST REPLACE THE URL FOR YOUR OWN REPO.**

```sh
git clone https://github.com/Jaycedam/mac-setup.git && cd mac-setup && bash main.sh
```

It will prompt you to install Xcode Command Line Tools if you don't have git.

:white_check_mark: Apple Sillicon on Ventura  
:white_check_mark: Apple Sillicon on Sonoma

## Manual settings

Some settings must be changed manually due to API limitation or lack of Apple documentation.

- Lock screen: Set required password after screen is off to **inmediatly** for security reasons.
- Safari: Enable hide my ip and disable telemetry in Privacy tab.
- Change Keyboard Shortcut **Move focus to next window** to ⌘| to enable changing instances of the same app (necessary on Latam Keyboard), available on **Keyboard - Keyboard Shortcuts - Keyboard**.

## Update the backup:

Just run `bash backup.sh` to update the backup files. It will create a backup of everything listed in the previous section. If you're going to modify the list of packages to install, make sure to remove its dependencies on the different script modules. You will need Homebrew to backup your current packages, or you can edit the Brewfile directly.

## Credit

- [macOS defaults list](https://macos-defaults.com/)
- [Brew docs](https://docs.brew.sh/Manpage)
- [Project icon](https://www.flaticon.com/free-icon/continuous_8916345)

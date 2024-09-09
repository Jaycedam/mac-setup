<div align="center">
    <img src="images/logo.png" height="80" width="auto">
    <h1 style="font-size: larger">MacOS automated setup</h1>
    <br>
</div>

Opinionated automation shell scripts to set up macOS. The script does the following:

- Installs [Homebrew](https://brew.sh).
- Restores current backup:
  - dotfiles (.config folder, .zshrc)
  - Installed packages by Homebrew on a [Brewfile](backup/Brewfile).
- Changes some macOS default preferences, see full list [here](modules/preferences.sh).

## Instructions

Clone the project, update the backup and sync your changes with your repo. Then just replace the URL for your own for the automated setup. 

**THIS IS JUST AN EXAMPLE, DO NOT RUN THIS. MAKE SURE TO UPDATE THE BACKUP AND THE URL FIRST.**

```sh
mkdir ~/Developer
git clone https://github.com/Jaycedam/mac-setup.git ~/Developer 
cd ~/Developer/mac-setup && sh main.sh
```

It will prompt you to install Xcode Command Line Tools if you don't have git.

:white_check_mark: Apple Sillicon on Ventura  
:white_check_mark: Apple Sillicon on Sonoma

## Update the backup:

Just run `bash backup.sh` to update the backup files. It will create a backup of everything listed in the previous section. If you're going to modify the list of packages to install, make sure to remove its dependencies on the different script modules. You will need Homebrew to backup your current packages, or you can edit the Brewfile directly.

## Manual settings

Some settings must be changed manually due to API limitation or lack of Apple documentation.

- Lock screen: Set required password after screen is off to **inmediatly** for security reasons.
- Safari: Enable hide my ip and disable telemetry in Privacy tab.
- Change Keyboard Shortcut **Move focus to next window** to ⌘| to enable changing instances of the same app (necessary on Latam Keyboard), available on **Keyboard - Keyboard Shortcuts - Keyboard**.

## Credit

- [macOS defaults list](https://macos-defaults.com/)
- [Brew docs](https://docs.brew.sh/Manpage)
- [Project icon](https://www.flaticon.com/free-icon/continuous_8916345)

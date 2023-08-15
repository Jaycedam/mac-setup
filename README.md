<div align="center">
    <img src="images/logo.png" height="80" width="auto">
    <h1 style="font-size: larger">MacOS automated setup</h1>
    <!-- <p style="font-size: small">Opinionated automation scripts to set up macOS.</p> -->
    <br>
</div>

Opinionated automation shell scripts to set up macOS. The script does the following:

- Restores current backup.
- Installs [Homebrew](https://brew.sh).
- Changes some macOS default preferences.

**Check the [wiki](https://github.com/Jaycedam/mac-setup/wiki) for more information.**

## Instructions

For the automated setup, run:

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
- Import theme.terminal from the backup folder into the default terminal.

## Todo

- [x] Add vscodium profile/extensions backup/restore
- [ ] Automate manual settings post script
- [ ] Check if Brew is already installed
- [x] Add macOS preferences changes in README

## Acknowledgments

- [macOS defaults list](https://macos-defaults.com/)
- [Brew docs](https://docs.brew.sh/Manpage)
- [Project icon](https://www.flaticon.com/free-icon/continuous_8916345)

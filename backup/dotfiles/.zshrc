# Enable change directory without cd
setopt auto_cd

# Alias
alias install="brew install"
alias uninstall="brew uninstall --zap"
alias search="brew search"
alias outdated="brew outdated"
alias code="codium"

source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"

setopt autocd
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"

alias install="brew install"
alias uninstall="brew uninstall --zap"
alias code="codium"
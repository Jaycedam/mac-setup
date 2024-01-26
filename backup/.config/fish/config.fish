if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -g fish_greeting

# Alias
alias install="brew install"
alias autoremove="brew autoremove"
alias uninstall="brew uninstall --zap"
alias search="brew search"
alias outdated="brew outdated"
alias code="codium"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/Caskroom/miniconda/base/bin" $PATH
    end
end
# <<< conda initialize <<<


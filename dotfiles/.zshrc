export EDITOR=nvim

# History
setopt hist_ignore_all_dups             # ignore duplicate entries
setopt hist_save_no_dups                # don't save duplicates
setopt hist_ignore_space                # ignore commands that start with space
setopt share_history                    # share command history data between parallel sessions
setopt hist_verify

# Path
export PATH="/opt/homebrew/bin:$PATH"

# Key Bindings
bindkey -v                              # enable VIM mode
KEYTIMEOUT=1                            # lower delay of ESC for vim mode
bindkey "ç" fzf-cd-widget               # OPTION-C [fzf shortcut to change directory]
bindkey '^[[A' history-search-backward  # UP ARROW [search history]
bindkey '^[[B' history-search-forward   # DOWN ARROW [search history]

# Shell Completion
if type brew &>/dev/null
then
    # loads completions for brew and its packages
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi

# FZF Customization 
# Globals:
export FZF_DEFAULT_OPTS="
--height 90% 
--layout reverse-list
--no-scrollbar
"
# OPTION-C shortcut to change directory: exclude folders
export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash"
# CTRL-T shortcut to search files: exclude folders, preview with bat
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash
--preview 'bat -n --color=always {}'"
# CTRL-R shortcut to search command history: CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
--color header:bold
--header 'Press CTRL-Y to copy command into clipboard'"

# Aliases
alias ls="ls -l --color"
alias lsa="ls -A -l --color"
alias code="codium"
alias search="brew search"
alias install="brew install"
alias upgrade="brew upgrade"
alias uninstall="brew uninstall --zap"  # uninstall with zap to remove app leftovers
alias outdated="brew outdated"
alias autoremove="brew autoremove"
alias vim="nvim"
alias v="nvim"
alias so="source ~/.zshrc" # source zshrc to update changes

# Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

# Prompt
eval "$(starship init zsh)"

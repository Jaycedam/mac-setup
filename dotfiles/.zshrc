export EDITOR=nvim
KEYTIMEOUT=1 # lower delay of ESC to enter normal mode (vim mode)

# History
setopt hist_ignore_all_dups # ignore duplicate entries
setopt hist_save_no_dups    # don't save duplicates
setopt share_history        # share command history data between parallel sessions
setopt hist_verify

# Path
export PATH="/opt/homebrew/bin:$PATH"

# Key Bindings
bindkey -v                           # enable VIM mode
bindkey "^Z" fzf-cd-widget           # CTRL-Z [fzf shortcut to change directory]
bindkey '^P' history-search-forward  # CTRL-P [search history as vim keybind]
bindkey '^N' history-search-backward # CTRL-N [search history as vim keybind]
bindkey '^Y' autosuggest-accept      # CTRL-Y [accept suggestion as vim keybind]

# Completion
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}" # load brew completions
    autoload -Uz compinit
    compinit
fi

# FZF Customization
export FZF_DEFAULT_OPTS="
--bind 'ctrl-y:accept'
--preview-window 'border-none'
--highlight-line
--height 90% --tmux 80%
--info=inline-right
--layout=reverse-list
"

# OPTION-C shortcut to change directory: exclude folders
export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash
--border-label=' FZF Change Directory '
"

# CTRL-T shortcut to search files: exclude folders, preview with bat
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash
--preview 'bat -n --color=always {}'
--border-label=' FZF Files '
"

# CTRL-R shortcut to search command history: CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
--color header:bold
--header 'Press CTRL-Y to copy command into clipboard'
--border-label=' FZF Commands '
"

# Aliases
alias ls="ls -lhF --color"
alias lsa="ls -lhAF --color"
alias code="codium"
alias search="brew search"
alias install="brew install"
alias upgrade="brew upgrade"
alias uninstall="brew uninstall --zap" # uninstall with zap to remove app leftovers
alias outdated="brew outdated"
alias autoremove="brew autoremove"
alias vim="nvim"
alias v="nvim"
alias so="source ~/.zshrc" # source zshrc to update changes

# Prompt https://github.com/sindresorhus/pure
fpath+=("$(brew --prefix)/share/zsh/site-functions") # use system zsh
autoload -U promptinit
promptinit                       # Initialize the prompt system
zstyle :prompt:pure:path color 6 # changes path color to cyan
prompt pure                      # load pure

# Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

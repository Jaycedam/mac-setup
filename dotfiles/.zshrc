# ==============================================================================
# General
# ==============================================================================
export EDITOR=nvim
export EDITOR=nvim
KEYTIMEOUT=1 # lower delay of ESC to enter normal mode (vim mode)

# start on tmux
if [[ -z "$TMUX" ]]; then
    tmux new-session -A -s main
fi

# History
setopt hist_ignore_all_dups # ignore duplicate entries
setopt hist_save_no_dups    # don't save duplicates
setopt share_history        # share command history data between parallel sessions
setopt hist_verify

# Path
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Key Bindings
bindkey -v                 # enable VIM mode
bindkey "^Z" fzf-cd-widget # CTRL-Z [fzf shortcut to change directory]

# Completion
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}" # load brew completions
    autoload -Uz compinit
    compinit
fi

# ==============================================================================
# Aliases
# ==============================================================================
alias ls="ls -lhF --color"
alias lsa="ls -lhAF --color"
alias search="brew search"
alias install="brew install"
alias upgrade="brew upgrade"
alias uninstall="brew uninstall --zap" # uninstall with zap to remove app leftovers
alias outdated="brew outdated"
alias autoremove="brew autoremove"
alias v="nvim"
alias n="nvim-unstable"
alias h="hx"
alias so="source ~/.zshrc" # source zshrc to update changes
alias t="tmux new-session -A -s main"

# ==============================================================================
# Prompt
# ==============================================================================
fpath+=("$(brew --prefix)/share/zsh/site-functions") # use system zsh
autoload -U promptinit
promptinit                       # Initialize the prompt system
zstyle :prompt:pure:path color 6 # changes path color to cyan
prompt pure                      # load pure

# ==============================================================================
# FZF
# ==============================================================================
# OPTION-C shortcut to change directory: exclude folders
export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash
"

# CTRL-T shortcut to search files: exclude folders, preview with bat
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash
--preview 'bat -n --color=always {}'
"

# CTRL-R shortcut to search command history: CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
--color header:bold
--header 'Press CTRL-Y to copy command into clipboard'
"

# FZF theme
source "$HOME/.config/fzf/theme"

# load key bindings
source <(fzf --zsh)

# ==============================================================================
# ZSH Plugins
# ==============================================================================
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

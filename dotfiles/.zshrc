export EDITOR=nvim

# History
setopt hist_ignore_all_dups             # ignore duplicate entries
setopt hist_save_no_dups                # don't save duplicates
setopt hist_ignore_space                # ignore commands that start with space
setopt share_history                    # share command history data between parallel sessions
setopt hist_verify

# Path
export PATH="/opt/homebrew/bin:$PATH"

# Key Bindings ("+" is used to describe a key combination, not the key itself)
bindkey -v                              # enable VIM keybindings
bindkey "ç" fzf-cd-widget               # ⌥ + C [fzf shortcut option-c on macOS change directory]
bindkey '^[[A' history-search-backward  # ⬆︎ [search history]
bindkey '^[[A' history-search-backward  # ⬆︎ [search history]
bindkey '^[[1;3D' backward-word         # ⌥ + ⬅︎ [skip word backward]
bindkey '^[[1;3C' forward-word          # ⌥ + ➡️ [skip word forward]

# Shell Completion
if type brew &>/dev/null
then
	# loads completions for brew and its packages
	FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
	autoload -Uz compinit
	compinit
fi

# FZF Customization
# ⌥ + C shortcut to change directory options: exclude folders
export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash"
# ⌥ + T shortcut to search files options: exclude folders, preview with bat
# ⌃ + / to show or hide preview
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"

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
alias so="source ~/.zshrc" # source zshrc to update changes

# Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

# Prompt
eval "$(starship init zsh)"

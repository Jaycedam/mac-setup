export EDITOR=nvim
KEYTIMEOUT=1                            # lower delay of ESC to enter normal mode (vim mode)

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
bindkey "ç" fzf-cd-widget               # OPTION-C [fzf shortcut to change directory]
bindkey '^P' history-search-forward     # CTRL-P [search history as vim keybind]
bindkey '^N' history-search-backward    # CTRL-N [search history as vim keybind]
bindkey '^Y' autosuggest-accept         # CTRL-Y [accept suggestion as vim keybind]

# Completion
if type brew &>/dev/null
then 
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}" # load brew completions
    autoload -Uz compinit
    compinit
fi

# FZF Customization 
export FZF_DEFAULT_OPTS="
  --highlight-line
  --height 90%
  --info=inline-right
  --layout=reverse-list
  --border=none
  --color=bg+:#2d3f76
  --color=border:#589ed7
  --color=fg:#c8d3f5
  --color=gutter:#1e2030
  --color=header:#ff966c
  --color=hl+:#65bcff
  --color=hl:#65bcff
  --color=info:#545c7e
  --color=marker:#ff007c
  --color=pointer:#ff007c
  --color=prompt:#65bcff
  --color=query:#c8d3f5:regular
  --color=scrollbar:#589ed7
  --color=separator:#ff966c
  --color=spinner:#ff007c
"

export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash
" # OPTION-C shortcut to change directory: exclude folders

export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash
--preview 'bat -n --color=always {}'
" # CTRL-T shortcut to search files: exclude folders, preview with bat

export FZF_CTRL_R_OPTS="
--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
--color header:bold
--header 'Press CTRL-Y to copy command into clipboard'
" # CTRL-R shortcut to search command history: CTRL-Y to copy the command into clipboard using pbcopy

# Aliases
alias ls="ls -lhF --color"
alias lsa="ls -lhAF --color"
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

# Prompt https://github.com/sindresorhus/pure
fpath+=("$(brew --prefix)/share/zsh/site-functions") # use system zsh
autoload -U promptinit; promptinit # Initialize the prompt system
zstyle :prompt:pure:path color 6 # changes path color to cyan
prompt pure # load pure

# Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

export PATH=$PATH:/Users/jay/.spicetify

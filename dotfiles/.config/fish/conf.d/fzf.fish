# Globals:
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --height 90% \
  --info=inline-right \
  --layout=reverse-list \
  --border=none
  --color=bg+:#2d3f76 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
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

bind -M insert "ç" fzf-cd-widget # fixes OPTION-C shortcut on MacOS, only on insert mode

# Load plugin and its keybinds
fzf --fish | source

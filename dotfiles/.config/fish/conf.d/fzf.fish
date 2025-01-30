# FZF Customization

# General
export FZF_DEFAULT_OPTS="
--bind 'ctrl-y:accept'
--highlight-line
--height 80% --tmux 80%
--info=inline-right
--layout=reverse-list

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

# Change directory widget, exclude folders
export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash
--border-label=' Change Directory '
--preview-window border-left
--preview 'eza --tree --color=always --icons=always {} | head -200'
"

# Fzf files widget, exclude folders and preview with bat
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash
--preview 'bat -n --color=always {}'
--preview-window border-left
--border-label=' FZF Files '
"

# Fzf command history, bind ctrl-y to copy
export FZF_CTRL_R_OPTS="
--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
--color header:bold
--header 'Press CTRL-Y to copy command into clipboard'
--border-label=' Command History '
"

# Remap fzf shortcut to change directory to CTRL-Z
bind \cZ fzf-cd-widget
bind --mode insert \cZ fzf-cd-widget

# Set up fzf key bindings
fzf --fish | source

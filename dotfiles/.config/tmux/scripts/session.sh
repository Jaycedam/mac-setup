#!/bin/bash

paths="$HOME/Developer"

selection=$(fd . -t d "$paths" --max-depth 1 | fzf --border-label ' Session Manager ' --input-label ' Search Project ')

# If no directory is selected, exit
if [ -z "$selection" ]; then
    exit 1
fi

name=$(basename "$selection" | tr . _) # Gets only the dir name, replace . with -

tmux has-session -t "$name" 2>/dev/null

# If there's no session by the selected name, create it
if [ $? != 0 ]; then
    tmux new-session -d -s "$name" -c "$selection" "nvim"
    tmux new-window -t "$name" -d
fi

# If not inside tmux, attach
if [[ -z $TMUX ]]; then
    tmux attach -t "$name"
# inside tmux switch to session
else
    tmux switch-client -t "$name"
fi

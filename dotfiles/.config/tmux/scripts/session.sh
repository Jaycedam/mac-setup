#!/bin/bash

# TODO improve initial load time
# TODO add manual path input

paths="$HOME/Developer"

selection=$(fd . -t d "$paths" --max-depth 1 | fzf --tmux 80% --border-label '  Session Manager ' --input-label ' Search Project ')

# If no directory is selected, exit
if [ -z "$selection" ]; then
    exit 1
fi

name=$(basename "$selection" | tr . _) # Gets only the dir name, replace . with -

tmux has-session -t "$name" 2>/dev/null

# If there's no session by the selected name, create it
if [ $? != 0 ]; then
    tmux new-session -d -s "$name" -c "$selection" "hx" # cd to selected dir and open nvim
    tmux new-window -t "$name" -d -c "$selection"         # open new window detached and cd to selected dir
fi

# If not inside tmux, attach
if [[ -z $TMUX ]]; then
    tmux attach -t "$name"
# inside tmux switch to session
else
    tmux switch-client -t "$name"
fi

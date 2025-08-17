#!/usr/bin/env bash

# load fzf theme
source "$HOME/.local/share/colorshift/current/fzf.sh"

paths="$HOME/dev"

selection=$(fd -t d . "$paths" --max-depth 1 | fzf --border-label '  Session Manager ' --input-label ' Search Project ')

if [ -z "$selection" ]; then
    exit 0
fi

session_name=$(basename "$selection" | tr . _)

if ! tmux has-session -t "$session_name" 2>/dev/null; then
    tmux new-session -d -s "$session_name" -c "$selection" -n "" "nvim"
    tmux new-window -d -t "$session_name" -c "$selection"
fi

if [ -z "$TMUX" ]; then
    tmux attach -t "$session_name"
else
    tmux switch-client -t "$session_name"
fi

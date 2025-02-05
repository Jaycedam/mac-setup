if status is-interactive
    # If not on tmux, attach or create main session
    #and not set -q TMUX
    #exec tmux new-session -A -s main
end

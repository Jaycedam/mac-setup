# only run in interactive shells, and when not already inside tmux
if status --is-interactive; and test -z "$TMUX"
    #     # -A = attach if exists, else create; -s names the session “main”
    tmux new-session -A -s main
end

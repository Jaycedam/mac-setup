# ----------------------- VIM binds for fish -----------------------
# Sets the vi key bindings for fish shell.
fish_vi_key_bindings

# \c = CTRL
bind --mode insert \cY accept-autosuggestion
bind --mode insert \cN history-search-backward
bind --mode insert \cP history-search-forward
bind --mode insert \cP history-prefix-search-forward
bind --mode insert \cN history-prefix-search-backward

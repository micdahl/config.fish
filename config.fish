if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.cargo/bin 
set -g theme_nerd_fonts yes
alias vim nvim
set -gx EDITOR (type -p nvim)
source ~/.asdf/asdf.fish

if test -n "$VIRTUAL_ENV"
    fish_add_path -m -g $VIRTUAL_ENV/bin
end

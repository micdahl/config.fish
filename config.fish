if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path $HOME/.local/bin
set -g theme_nerd_fonts yes
set -Ux fish_user_paths $HOME/.cargo/bin $fish_user_paths
alias vim nvim
set -gx EDITOR (type -p nvim)
source ~/.asdf/asdf.fish

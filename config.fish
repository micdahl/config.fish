if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path $HOME/.local/bin
set -g theme_nerd_fonts yes
set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths
status --is-interactive; and rbenv init - fish | source
alias vim nvim

function __check_pyenv --description 'Auto source venv'
  status --is-command-substitution; and return
  if status is-interactive
      if test -e $PWD/.venv/bin/activate.fish
          if test -z "$VIRTUAL_ENV" 
              source $PWD/.venv/bin/activate.fish
              set_color black
              set_color -b green
              echo " activated venv "
              set_color normal
          else if test "$VIRTUAL_ENV" != "$PWD/.venv"
              deactivate
              source $PWD/.venv/bin/activate.fish
              set_color black
              set_color -b yellow
              echo " changed venv "
              set_color normal
          end 
      end
  end
end

function __auto_check_pyenv --on-variable PWD --description 'Auto source venv'
  __check_nvm
end

function __check_nvm --description 'Auto source nvm'
  status --is-command-substitution; and return
  if status is-interactive
      if test -e $PWD/.nvmrc
          if test "$(nvm current)" = "none"
              nvm use
          end 
      end
  end
end

function __auto_check_nvm --on-variable PWD --description 'Auto source venv'
  __check_nvm
end

__check_nvm
__check_pyenv


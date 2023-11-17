function __auto_venv --on-variable PWD --description "Automatically activate python venv"

  if test -d $PWD/.venv
    source $PWD/.venv/bin/activate.fish
  end
end

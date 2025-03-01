cdev() {
  if [ "X$(echo $TERM | grep tmux)" == "X" ]; then
    if [[ "X$1" == "X" ]]; then
      screen -t "sources" sh -c 'cd ~/sources/; exec /usr/local/bin/bash -l'
    else
      shortened=$(echo "$1" | sed 's:^pipeline-::g')
      screen -t "${shortened}" sh -c 'cd ~/sources/'$1'/; exec /usr/local/bin/bash -l'
    fi
  else
    if [[ -z "$1" ]]; then
      tmux new-window -n sources -c ~/sources
    else
      shortened=$(echo "$1" | sed 's:^pipeline-::g')
      tmux new-window -n "$shortened" -c ~/sources/"$1"

    fi
  fi
}

_cdev_complete() {
  if [[ ${COMP_CWORD} -gt 1 ]]; then
    COMPREPLY=()
    return 0
    exit
  fi
  cur="${COMP_WORDS[COMP_CWORD]}"
  opts=$(ls ~/sources)
  COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
  return 0
}

function title {
  echo -en "\033k$*\033\\"
}

function titled {
  title "$(basename "$(pwd)")"
}

complete -F _cdev_complete "cdev"

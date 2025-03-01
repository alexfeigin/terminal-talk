export BAT_THEME='Visual Studio Dark+'
export FZF_CTRL_T_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=numbers,grid --line-range :300 {}'"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%'"


_fzf_compgen_path() {
  fd --exclude ".git" --follow --hidden . "$1"
}

_fzf_compgen_dir() {
  fd --exclude ".git" --follow --hidden --type d . "$1"
}

export FZF_ALT_C_COMMAND="fd --type d --exclude .git --follow --hidden"
export FZF_DEFAULT_COMMAND="fd --type f --exclude .git --follow --hidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source <( fzf --bash )
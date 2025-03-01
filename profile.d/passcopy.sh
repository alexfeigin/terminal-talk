# shellcheck disable=SC2120
passcopy(){
	if [[ "X$1" == "X" ]]; then
		find ~/.password-store/ -name '*.gpg' | sed 's:.*\.password-store/::g; s:\.gpg::g'
	else
		printf "%s" "$(pass show $1)" | pbcopy
	fi
}

otpcopy(){
  local pname=$1
	if [[ "X${pname}" == "X" ]]; then
		find ~/.password-store/ -name '*.gpg' | sed 's:.*\.password-store/::g; s:\.gpg::g' | grep otp | sed 's:my/::g; s:\.otp::g'
	else
		printf "%s" "$(totp $(pass show "my/${pname}.otp"))" | pbcopy
	fi
}

_passcopy_complete()
{
	if [[ ${COMP_CWORD} -gt 1 ]]; then COMPREPLY=(); return 0; exit; fi
	cur="${COMP_WORDS[COMP_CWORD]}"
	opts=$(passcopy)
	COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
	return 0
}

_otpcopy_complete()
{
	if [[ ${COMP_CWORD} -gt 1 ]]; then COMPREPLY=(); return 0; exit; fi
	cur="${COMP_WORDS[COMP_CWORD]}"
	opts=$(otpcopy)
	COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
	return 0
}

complete -F _passcopy_complete "passcopy"
complete -F _otpcopy_complete "otpcopy"

export -f passcopy
export -f otpcopy

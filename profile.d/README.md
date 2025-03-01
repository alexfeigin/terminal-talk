# Example Scripts for /usr/local/etc/profile.d

These are example scripts that can be copied to `/usr/local/etc/profile.d` and sourced via the `~/.bash_profile`.



Example `~/.bash_profile`:
```bash
#!/usr/bin/env bash

export LC_ALL=en_US.UTF-8

# enable bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# source all scripts in /usr/local/etc/profile.d
for sh in /usr/local/etc/profile.d/*.sh; do
  [ -r "$sh" ] && . "$sh"
done

# some nice default aliases
alias ll="ls -ltr --color=auto"
alias la="ls -ltra --color=auto"
alias grep='grep --color=auto'
alias basecopy='basename $(readlink -f .) | tr -d '"'\n'"' | pbcopy'
alias dircopy='readlink -f . | tr -d '"'\n'"' | pbcopy'
alias edit='idea -e'
```
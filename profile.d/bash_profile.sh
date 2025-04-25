#!/usr/bin/env bash

export LC_ALL=en_US.UTF-8

# enable bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# source all scripts in /usr/local/etc/profile.d
for sh in /usr/local/etc/profile.d/*.sh; do
  [ -r "$sh" ] && . "$sh"
done
unset sh

# export PATH variable that will contain all goodies installed from brew ready to fire
calcpath

# some nice default aliases
alias ll="ls -ltr --color=auto"
alias la="ls -ltra --color=auto"
alias grep='grep --color=auto'
alias basecopy='basename $(readlink -f .) | tr -d '"'\n'"' | pbcopy'
alias dircopy='readlink -f . | tr -d '"'\n'"' | pbcopy'
alias edit='idea -e'

# pretty prompt
export PS1='[\A][\u@\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:\w]\$ '

# lesspipe lets you see content of some supported files/directories like if you less on a .tar.gz file, you will see the entry list
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

# use jdk util to make sure java21 is exported to JAVA_HOME
jdk 21 &> /dev/null
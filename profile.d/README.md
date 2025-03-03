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

 # lesspipe lets you see content of some supported files/directories (like if you less on a .tar.gz file, you will see the entry list)
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

# use jdk util to make sure java21 is exported to JAVA_HOME
jdk 21 &> /dev/null
```

## source.sh

the scripts in `source.sh` assume there's a ~/sources directory that holds all clones of all repositories you use.
it provides the util `cdev` it works inside a terminal multiplexer, supports `tmux` and `screen`.
it will open a new window in the multiplexer and `cd` to the directory of the repository you want to work on.

## passcopy.sh

the scripts in `passcopy.sh` are examples that use the `pass` cli password manager.
it's a cli native pass manager, works by pgp encrypting files in a git tree.
it could be made to use mac keychain to store the master password. so you can use fingerprint reader on the mac to decrypt the passwords.

but I personally use 1password cli, which is a licensed-paid product.

there are other options, a good one that has mac support and cli support is `bitwarden`. 
as of the writing of this, it's still free for personal use.  
`pass` is a GPL tool so it's open source and free for personal use.

## git aliases

if you want to set up my git aliases you may use  
keep in mind that if you already have configuration in your `/usr/local/etc/gitconfig`  
the following command overwrites it. **so don't use it**, merge the 2 files manually.

```bash
curl -fsSL https://raw.githubusercontent.com/alexfeigin/devel/refs/heads/feature/mac/gitconfig > /usr/local/etc/gitconfig
```

this downloads my own default [gitconfig](https://github.com/alexfeigin/devel/blob/feature/mac/gitconfig) from here 
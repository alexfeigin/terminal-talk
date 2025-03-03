# Terminal talk

| section                                               | time | start time |
|-------------------------------------------------------|------|------------|
| CLI productivity and me (Alex)                        | 2    | 0          |
| CLI productivity and you (the why, the how, the what) | 2    | 2          |
| Modern terminal emulators (iTerm2)                    | 2    | 4          |
| Package manager (brew)                                | 2    | 6          |
| The shell (my case for investing in bash)             | 2    | 8          |
| Productivity tools (tmux, fzf, bat, fd, btop)         | 5    | 10         |
| Customizing your experience (dotfiles)                | 2    | 15         |
| All developers want the same thing (git aliases)      | 3    | 17         |
| Scripting a case for bash                             | 5    | 20         |
| Live Coding (Automate a Task)                         | 5    | 25         |
| Thanks                                                | 0    | 30         |

## CLI productivity and me (Alex)
I've been deploying software to linux servers since i was 18...
I used to work as a POC engineer and change code live on remote servers. so I had to become good at this.

## CLI productivity and you (the why, the how, the what)
It's a power tool that is strongly integrated with the operating system
For Mac and linux users, it's already there.  
For windows users, there are options like WSL, or working in a VM.  

If you are starting now, you have the privilege of living in a world with co-pilot and youtube tech influencers having a cli renaissance.

## Modern terminal emulators (iTerm2)
In Mac, you get the terminal.app, and in other systems you'll get some default.
there are modern terminal emulators that have many customization options. They might even be graphics card accelerated.  
If you are on Mac, the no-brainer option is iTerm2.

## Package manager (brew)
You get many tools out of the box, there are lean distros of linux where some of the tools might not be available.
But all of them have a package manager, and you can get the tools you need, and keep them updated with security patches.

```bash
brew install jq fzf bat fd btop tmux git tlrc bash-completion # install cli tools
brew --cask install iterm2 # install Mac packages (/Applications)
brew --cask install intellij-idea
brew tap homebrew/bundle # backup and restore your installed packages
brew bundle dump # creates a Brewfile (a backup list of installed packages)
brew bundle install # looks for a Brewfile in current directory (restores packages)
brew upgrade # upgrade all packages
```
If you have a new employee, a quick way to set them up is to have a reference Brewfile.  
You can create a reference Brewfile by backing up another employee's Brewfile and cleaning up any packages that are not needed.

## The shell (my case for investing in bash)
you'll get a default shell, in some lean distors it will be `sh` on Mac it's `zsh`
I recommend investing in bash, from the more capable shells, it's the most common, and you'll find it almost everywhere.
becoming a wiz in zsh and then finding yourself on bash in a pod exec -it, won't be fun.
but bash is just compatible with `sh` so you won't be lost in a `sh` shell.

## Customizing your experience (dotfiles)
.bashrc + .bash_profile (aliases, functions, environment variables) [Documentation with an example of .bash_profile](profile.d/README.md)

.gitconfig (git aliases, git settings) [example gitconfig](https://github.com/alexfeigin/devel/blob/feature/mac/gitconfig)

.tmux.conf [example .tmux.conf](https://www.google.com/search?q=.tmux.conf)

## All developers want the same thing (git aliases)

Configured from the above .gitconfig,

Here are some I use everyday
- git openurl
  - open the git remote with the default browser
  - tested with github and bitbucket (might work for others)
  - works if repo was cloned with ssh `git@` or `https://` remotes.
- git track
  - infer the name of `localbranch` from HEAD
  - alias for `git branch --set-upstream-to=origin/$localbranch $localbranch;`
  - if you created a local branch and pushed it, this is useful to set the upstream
- git rh
  - this will ask before executing, because it's destructive (deletes all local changes)
  - it will display `Press Enter to continue [Ctrl-C to cancel]` and give you a chance to cancel.
  - fetches remote `origin` and hard resets the local branch to `origin/master`
- git whoami
  - display the current Author string. 
  - alias for `echo "Author: $(git config --get user.name) <$(git config --get user.email)>"`
- git co
  - git checkout
- git ci
  - git commit
- git stat
  - git `status -s -b` (short status summery with branch name)
- git cleanf
  - alias for `git clean -xdf`
  - removes all untracked files and directories (good for having a clean env if builds fail in a funny way)

Instructions on how to get my aliases for gitconfig [are in this README.md](profile.d/README.md) 

## Productivity tools (tmux, fzf, bat, fd, btop)
* tldr
  * Installed through the brew package `brew install tlrc`
  * Gives a quick help for a command
  * Human-readable short with examples
  * A better man page
* tmux
  * Is a terminal multiplexer, keep your work if your terminal emulator gets closed.
  * You can have many windows open and move through
  * You can have long-running tasks and check on them later
* fzf
  * Fuzzy finder, you can search for files, or lines in files
  * Can be used to fuzzy search on files or stdout 
    * `cat a.txt | fzf` find a line in a file interactively using fuzzy search
    * `ps -ef | fzf --height=40% --layout=reverse --border | awk '{print $2}'` find a process id interactively by fuzzy searching for the executable name
  * If sourced with `source <(fzf --bash)` it will add hotkeys and special completion
    * Ctrl + r replaces the default reverse search for commands
    * Ctrl + t lets you complete a file path from fuzzy searching current directory
    * `**` uses bash completion to understand the context and give nice searches
      * Iin cd `**` will search for directories
      * In kill -9 `**` will search for processes
* bat
  * it's like cat but with syntax highlighting
  * it's more like less, but with syntax highlighting
* fd
  * it's an alternative to `find`
  * it is git aware, it will ignore .git dir, and respect .gitignore in the search result.
  * it uses regex `fd '\.sh$' --type f` find all files ending in `.sh`

there are so many, and do you own research, if there's something you do every day as an engineer, there's probably a cli tool for it.

## Scripting a case for bash
bash has many concepts of scripting that become useful
because of the shell's integration with the operating system and the many tools that are available.

here's a bad school question example, it's not interesting in itself, but as an example it will show my point.
make a program that will read through `a.txt` count occurrences of the all words, and print the top 3 most common words.

nice programming prompt, let's solve it with the god-mode programming language, java with spring boot.

you can imagine it's going to be a multi file project. 

ok you say, clearly it's a job for a scripting language. let's go for python:

```python
form collections import Counter
import re
print('\n'.join([f'{count} {word}' for word, count in Counter(re.findall(r'\w+', open('a.txt').read())).most_common(3)]))
```

ok but you'd have to install python. it's not crazy, it's very flexible you could do anything in python.
but you already have bash, and it looks like this:

```bash
cat a.txt | grep -oE '\w+' | sort | uniq -c | sort -nr | head -3
```

## Live Coding (Automate a Task)
You have a remote api you don't have good documentation for, the json response is nested 5 objects deep and has multiple arrays.  
How do you deal with this?

Let's make a new tool with bash, that you'd be able to use daily.

You can see the result of the live coding in [json_helpers](profile.d/json_helpers.sh) script in this repo 

The test url we used during the talk is
```bash
curl -s 'https://dummyjson.com/users?limit=20' | jq
```
special thanks to [dummyjson.com](https://dummyjson.com/) for hosting this cool api.

## Thanks

more fun documentation in this [profile.d/README.md](profile.d/README.md) 
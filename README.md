# terminal-talk

| Section                        | Time  |
|--------------------------------|-------|
| Foundations (Terminal & Shell) | 5 min |
| Motivation (Why CLI?)          | 2 min |
| CLI Basics (Zero to Hero)      | 5 min |
| Vim (Quick Intro)              | 3 min |
| Productivity Tools             | 5 min |
| Bash Scripting (Flyover)       | 5 min |
| Live Coding (Automate a Task)  | 5 min |

## **Foundations (Terminal & Shell)**

This is a huge simplification and crunch down of actual history, and I'm making it sound like it's a linear progression, which it's not.  
But in the beginning, computers had no interface. Anything the computer did was done by an operator. It had switches, toggles, and lights.

Some time after that, we had computers that read punch cards and were connected to printers.  
Some time after that, we got the old-timey monochrome screens with barely any pixels and a keyboard. That was connected to a sometimes very big and out-of-the-way computer system in a different room.

So that gave us the word **terminal**. Other words like **console** have a similar source.  
The terminal was a physical device that was connected to the computer. It was replaced when we got networking, turning it into a **remote terminal**, and we got the **SSH protocol**.

When we got PCs in the late '80s, it was replaced by a **terminal emulator**.  
But the point was the same: it is a **text-based interface to the computer**.

### **So what is a shell?**

You can know a shell by its function. It's an executable. When you run it in interactive mode, it's a **command-line interpreter**—a **REPL (Read-Eval-Print Loop)**.  
Its purpose is to expose the services of an operating system. A shell comes with built-in commands that let you interact with **files, processes, and the system itself**.

Because the early people interacting with computer systems were more or less all expected to be able to solve their own problems by programming their own computers, it makes sense that the shell comes with programming ability.  
It has built-in programming capabilities like **variables, loops, conditionals, functions, etc.**

But what makes it the **Swiss Army knife** that it is, is the amount of **open-source software** available to support it.  
In Java, you'd add a **Maven dependency**.  
In the shell, you'd use a **package manager** like **brew** to install a CLI tool like **jq** or **fzf** (*he said, foreshadowing the rest of this talk*).

## **Motivation (Why CLI?)**

Why am I bothering you with this talk today?  
Let's break this sentence down.

**Why today?** Well, I'm here and you're here. So that's a good start.  
**Why me?** and **Why this talk** I've been hovering around software development for like 30 years.

When I first heard about the concept of a **power user**, I knew it was for me.  
I knew my way around an **operating system**, around **hardware**, and many different **programming languages** by the time I got to my programming course in the army.

Nothing they taught in that course was new to me.  
But during a simple interview with one of the instructors, they were on a keyboard in front of a computer, just scribbling away, taking notes.

Then, in like **10 seconds**, they moved around in **four different windows**, executing this and that shortcut and command... and I was like...

**What was that?**  
*"What was what?"*  
*"That thing you just did."*  
*"Oh, that? Yeah, when you spend your entire day on a computer, you learn to become a power user."*

I was entranced. I wanted to know all the shortcuts. I never wanted to do a **long cut** ever again.

So when I got to use **Linux-like systems** and was forced to develop on **remote systems** using **Bash and Vim**, I was a power user.  
I had to make this system my home.

A lot of times, we find ourselves in a situation where the **right tool for the job** is already a **CLI tool**.  
Even today, even still.

## **CLI Basics (Zero to Hero)**

Let's start with the basics.

Select a **good terminal emulator**. There are many options, some even use the graphics card to render blazingly fast.  
But for **Mac**, you can't go wrong with **iTerm2**.

You've opened your terminal. You get your **default shell** in your **home directory**.
- If you're on **Mac**, your default shell is **zsh**.
- If you're on **Linux** or **WSL**, it's probably **bash**.

I recommend **switching to Bash**. It's more common.
- If you **learn Bash**, you can use it when you **SSH into a remote system** (e.g., `kubectl exec` into a pod).
- If you **learn Bash scripting**, you can **reuse your scripts everywhere** there's Bash—which is **everywhere**.
- Not the same with **zsh**.

So if you **invest**, invest in **Bash**.

### **You are in. You are in Bash.**

| **Command**     | **Description**                         |
|-----------------|-----------------------------------------|
| `cd`           | Change directory                        |
| `pwd`          | Print working directory                 |
| `ls`           | List files in the current directory     |
| `find`         | Find files                              |
| `cat`          | Print file contents                     |
| `less`         | Page through a file                     |
| `head`         | Print first lines of a file             |
| `tail`         | Print last lines of a file              |
| `grep`         | Search inside files                     |
| `type`         | Show what a command is                  |
| `rm`           | Remove files or directories             |
| `cp`           | Copy files or directories               |
| `touch`        | Create an empty file                    |
| `mkdir`        | Create a new directory                  |
| `chmod`        | Change file permissions                 |
| `echo`         | Print text to the terminal              |
| `tar`          | Archive files                           |
| `su`           | Switch user                             |
| `sudo`         | Run a command as superuser              |
| `sed`          | Stream editor for modifying text        |
| `awk`          | Text processing tool                    |
| `curl`         | Download files from the web             |
| `wget`         | Download files from the web             |
| `ssh-keygen`   | Generate SSH keys                       |
| `vim`          | Text editor                             |


## **Vim (Quick Intro)**

`:q<enter>`  
That's how you **quit Vim**.

No, but seriously—Vim is a **text editor**.  
It's **modal**. It has **modes**, **commands**, and **keybindings**.

### **Modes of Vim:**

#### **Normal Mode**
- You can **navigate** the file.
- You need to learn **Vim motions**:
  - `hjkl` → Move left, down, up, right
  - `w` → Jump to next word
  - `b` → Jump to previous word
  - `e` → Jump to end of word
  - `gg` → Go to start of file
  - `G` → Go to end of file

#### **Insert Mode**
- You can **insert text**.
- To **enter insert mode**, press **`i`**.
- To **exit insert mode**, press **`Esc`**.

#### **Visual Mode**
- You can **select text**.
- To **enter visual mode**, press **`v`**.
- To **exit visual mode**, press **`Esc`**.
- To **copy text**, press **`y`**.
- To **cut text**, press **`d`**.
- To **paste text**, press **`p`**.

#### **Command Mode**
- You can **run commands**.
- To **enter command mode**, press **`:`**.
- To **exit command mode**, press **`Esc`**.
- To **save a file**, press **`:w`**.
- To **save and quit**, press **`:wq`** or **`:x`**.
- To **quit without saving**, press **`:q!`**.
- To **search**, press **`/`** and type your search term as a **regex**.
- To **replace**, type **`:%s/search as regex/replace exact/g`**.

### **Why Use Vim?**
Vim is useful **because it's always there**.  
For me, I've spent **a lot of time** in Vim—I'm **super comfortable** with it.

That said, I use **IntelliJ** for most of my text editing, **especially when I'm not on a remote system**.  
And it has **GitHub Copilot**.

So yeah… **I'm not holier than thou.** 

## **Productivity Tools**

Okay, so you've got a **terminal**, and you know the **basics**.  
But is it **useful**? Is it **productive**? Are you **done**?

Am I?

**Strap in, we're going for a ride.** 

### **Essential CLI Tools:**

| **Tool**           | **Description**                               |
|--------------------|-----------------------------------------------|
| **brew**           | Package manager                               |
| **tldr**           | Like a `man` page, but **summarized**          |
| **jq**             | JSON processor                                |
| **fzf**            | Fuzzy finder                                  |
| **bat**            | `cat`, but **better** (syntax highlighting & paging) |
| **ripgrep**        | `grep` **on steroids**                        |
| **fd**             | `find` **on steroids**                        |
| **exa**            | `ls` **on steroids**                          |
| **git aliases**    | `git` **on steroids**                         |
| **tmux**           | Terminal multiplexer                          |
| **kubectl**        | Kubernetes CLI                                |
| **aws**            | AWS CLI                                       |
| **pass**           | Password manager                              |
| **thefuck**        | Correct your previous command                 |
| **watch**          | Run a command **every 2 seconds**             |
| **bash-completion**| Tab completion for Bash                       |
| **lesspipe**       | View **compressed files**                     |
| **btop**           | `top` **on steroids**                         |
| **cloc**           | Count lines of code                           |

## Bash Scripting (Flyover)
you might have heard about scripting in bash.
it looks like this
```bash
#!/usr/bin/env bash
# this line above is called a shebang. it tells the system to use bash to run this script.
# always the first line of the file.
# this is obviously a comment. comments are lines that start with a #

variable="world"
# this is how to set a variable. no spaces around the = sign.
# no spaces around the variable name. no spaces around the value.
echo "hello ${variable}"
# this is how to print a variable. the $ sign is used to reference a variable.
# no spaces around the $ sign. no spaces around the variable name.


# this is how to run a command and store the output in a variable
output=$(ls)
echo "${output}"

# already very useful. but we can do more.
# we can use conditionals
if [ -f "file.txt" ]; then
  echo "file exists"
else
  echo "file does not exist"
fi

# we can use loops
for file in $(ls); do
  echo "${file}"
done

# we can use functions
function say_hello() {
  echo "hello"
}

# to call a function, use it like it was a built in command, or an executable on the PATH
say_hello

# we can use arguments
# we can also rewrite existing functions. and hide existing commands with functions.
function say_hello() {
  echo  "hello $1"
}

# to call a function with an argument, pass the argument after the function name
say_hello "world"

# so if we wanted a nice logging function that supported formatting so we could
# feel like we are in a real programming language
log() {
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    local format="[$timestamp]: $1\n"
    shift
    printf "$format" $@
}

log "hello %s" "world"

# there are 2 output streams, stdout and stderr.
# we can redirect to a file or to each other.
# stdout is 1, stderr is 2. > redirects stdout, 2> redirects stderr
# 2>&1 redirects stderr to stdout.
cat no_such_file.txt 2> /dev/null

# a builtin command an executable or a function can return a value. called the exit code.
# 0 means success. anything else means failure.
# we can try to read a file and if it doesn't exist the command fails
# so we can print a message
cat no_such_file.txt 2>/dev/null || log "file not found"

# if a command wants a file as an input
# we can give it a temporary file as the output of another command
cat <(ls)

# readlink -f gives the real file for a file or a symbolic link for a file
# so let's see what this prints:
readlink -f <(ls -a)
#/dev/fd/63
# this is a file descriptor. it's a file that represents the output of the ls -a command.
# it's a way to pass the output of a command as a file.

# we can use the output of a command as an argument to another command
echo $(ls -l)
# you can see that $() changes the output of the command, it removes the newlines.

# bash scripts are interpreted line by line.
# so functions from the beginning of the file are in the 'sourced'
# in the environment and can be run. but you can't call a function before it's defined.
this_will_fail
function this_will_fail() {
  echo "this will fail"
}
# output: -bash: this_will_fail: command not found

# you can store functions in a file, and source them
source my_functions.sh
# sourcing a file is like running the file in the current shell.
# so all functions and variables are available in the current shell.

# you can also run a script as a command. but you need to make it executable first.
chmod +x my_script.sh
./my_script.sh
# this will run the script in a new shell.
# so all functions and variables are available in the new shell.
# but not in the current shell.
```

## **Live Coding (Automate a Task)**

Here's something I find myself doing from time to time.  
I `curl` into some endpoint that I don't know and get a JSON response.  
Sometimes it's just a minimal and readable JSON with a single field:

```json
{ "auth_key": "skmQ5Mu30jav3rtT9kUIz1nzY6wWQDo1YBEkOVY3CXW1kSvYsQu5KdTa88t0CLxTTDrBzHaNeZ0x8hQYTDrMRUnKcgPqtuRVSG4zSzB" }
```

Life is good. You move on.

Sometimes, though, it's multiple arrays of objects, nested 5-6 levels deep. You don't have the schema, and you just want a single field from that.  
Needle in a haystack, right?

You can run it through `jq` to pretty-print.  
You can pipe it to `bat -l json` to get a pageable view with syntax highlighting.  
You could `grep` it, but that won't help you learn the structure.  
You could open it in a JSON viewer, but that's a lot of clicks. And this talk is about the terminal.

Let's see if we can live-code a solution to this problem in a way that we can reuse it later.  

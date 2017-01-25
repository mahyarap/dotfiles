# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
# alias la='ls -A'
alias la='ls -lA'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#--------------------------------------------------------------------
# USER DEFINED

err() {
	echo "$1" 1>&2
}

mkdircd() {
	if [[ $# -lt 1 ]]; then
		err "mkdircd: missing operand"
		return 1
	elif [[ $# -gt 1 ]]; then
		err "mkdircd: cannot make more than one directory"
		return 1
	fi

	mkdir "$1" && cd "$1"
}

grepless() {
	result=$(grep --color=always "$@")
	if [[ $? -eq 0 ]]; then
		echo -e "$result" | less -R
	fi
}

mvall() {
    if [[ $# -lt 1 ]]; then
        err "mvall: missing operand"
        return 1
    elif [[ $# -gt 1 ]]; then
        err "mvall: cannot mv to more than one destination"
        return 1
    fi

    if [[ ! -e "$1" ]]; then
        err "mvall: target does not exist"
        return 1
    elif [[ ! -d "$1" ]]; then
        err "mvall: target is not a directory"
        return 1
    fi

    for i in *; do
        if [[ "$i" != "$1" ]]; then
            mv "$i" "$1"
        fi
    done
}

ppath="/home/mahyar/Projects"
CDPATH=".:$ppath/programming:$ppath/repos"
export PROMPT_DIRTRIM=2
alias startk='sudo /etc/init.d/kerio-kvc start'
alias stopk='sudo /etc/init.d/kerio-kvc stop'
alias confk='sudo dpkg-reconfigure kerio-control-vpnclient'

alias tmux='tmux -2'
alias emacs='emacs -nw'
alias xclip='xclip -selection clipboard'
alias gopen='gnome-open'

# virtualenv stuff
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/.virtualenvs
source "/usr/local/bin/virtualenvwrapper.sh"

# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source "$HOME/bin/git-prompt.sh"
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 " (%s)")\$ '

alias vimm='vim $(git status --short --porcelain | grep "^ M" | cut -d" " -f3)'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export GUILE_AUTO_COMPILE=0

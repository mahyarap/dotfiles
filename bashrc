#!/bin/bash

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

#!/bin/bash

## To go to the previous working directory, use
# cd -

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'
#else
  #export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'
  #export PS1="\e[0;34m\e[47m\u@\w> \e[m"  # user>$PATH
fi

## To show only '>'
alias npath='export PS1=">"'
alias ppath='export PS1="\w$"'

#alias mkcd='mkdir "$1"; cd "$1"'
## mkcd direc will make a directory and cd into it in one go
function mkcd {
	mkdir $1; cd $1
}

## alias for gvim
alias g='gvim'
alias gdiff='gvimdiff'

## to prevent vim from crashing when ctrl+s is pressed
stty -ixon

## To download entire website
alias mirror='wget -m -p -E -k -K -np $@'

# alias for g++
alias g++11='g++ -std=gnu++11 -O2 '

#open any document with just v <file>
alias v='xdg-open $@'

# use fzf for last argument of any command
alias f='$@ $(fzf)'

# run the topcoder arena
alias topcoder='javaws ~/prog/topcoder/ContestAppletProd.jnlp > /dev/null'

# run matlab
alias matlab='/home/saurav/Matlab/matlab'

# install python applications using the conda pip
# see command whereis pip for all pip locations
alias cpip='/home/saurav/anaconda3/bin/pip'

function cgrep {
  if ag --version >/dev/null 2>&1; then
    ag --color-line-number 31 --color-match 43 --color-path 35 --ignore-case "$@"
  else
    grep -nir "$@"
  fi
}

# /etc/default/keyboard has been altered to swap caps and escape
# suspend on lid down has been disabled. It is now only lock on lid close.

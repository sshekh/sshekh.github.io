#!/bin/bash

## To go to the previous working directory, use
# cd -

#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37
RED='\033[0;31m'
PURPLE='\033[01;35m'
GREEN='\033[01;32m'
HGREEN='\033[01;42m'
WHITE='\033[01;37m'
HPURPLE='\033[01;45m'
HBLUE='\033[1;44m'
HYELLOW='\033[01;43m'
BLUE='\033[01;34m'
CYAN='\033[01;36m'
DRED='\033[1;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color


if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\['${PURPLE}'\]\u@\h\['${NC}'\]:\['${BLUE}'\]\w\['${NC}'\]\$'
#else
  #export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'
  #export PS1="\e[0;34m\e[47m\u@\w> \e[m"  # user>$PATH
fi

## To show only '>'
alias npath='export PS1="${HPURPLE}>$NC"'
# Only current dir
alias ppath='export PS1="${HBLUE}~ ""${WHITE}""\W"${HPURPLE}"$""${NC}"'

echo_and_run() { 
  echo -e "${YELLOW}\$ $@${NC}" ; 
  "$@" ; 
}

#alias mkcd='mkdir "$1"; cd "$1"'
## mkcd direc will make a directory and cd into it in one go
function mkcd {
	mkdir $1; cd $1
}


## alias for gvim
alias g='gvim'
alias gdiff='gvimdiff'
# use fzf to find file for vim
alias fvim='vim $(fzf)'

## to prevent vim from crashing when ctrl+s is pressed
stty -ixon

## To download entire website
alias mirror='wget -m -p -E -k -K -np $@'

# alias for g++
alias g++11='g++ -std=gnu++11 -O2 '

#open any document with just v <file>
alias v='xdg-open $@'
alias fv='xdg-open $(fzf)'

# run the topcoder arena
alias topcoder='javaws ~/prog/topcoder/ContestAppletProd.jnlp > /dev/null'

# run matlab
alias matlab='/home/saurav/Matlab/matlab'

# install python applications using the conda pip
# see command whereis pip for all pip locations
alias cpip='/home/saurav/anaconda3/bin/pip'

# code grep, ripgrep > ag > grep
function cgrep {
  if rg --version >/dev/null 2>&1; then
    rg --colors line:fg:red \
       --colors match:bg:yellow \
       --colors match:style:nobold \
       --colors match:fg:black \
       -ni "$@"
  elif ag --version >/dev/null 2>&1; then
    ag --color-line-number 31 --color-match 43 --color-path 35 --ignore-case "$@"
  else
    grep -nir "$@"
  fi
}

# grep within pdf, pdfgrep <pattern> <file>
alias pdfgrep='pdfgrep -nir'
# only search within pdfs
function rpdfgrep {
  find "${2}" -iname '*.pdf' -exec pdfgrep "${1}" {} +
}

# show monitors
alias show_monitors='xrandr | grep " connected " | awk "{ print$1 }"'
alias dual='xrandr --output DP-2 --scale 2x2'

# /etc/default/keyboard has been altered to swap caps and escape
# suspend on lid down has been disabled using /etc/systemd/logind.conf

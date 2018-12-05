#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Implement command not found completion
source /usr/share/doc/pkgfile/command-not-found.bash

# Set alias for cd 
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Make FZF use Ripgrep by default
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

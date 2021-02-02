#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Command prompt
PS1='[\u@\h \W]\$ '

# Set alias for cd 
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Allow piping into xclip
alias c='xclip -i -selection clipboard'
alias v='xclip -o'

# Setup pywal
(cat ~/.cache/wal/sequences &)

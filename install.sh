#!/bin/bash

FOLDER=$(pwd)

sudo dnf install vim tmux;

if [ -d "$FOLDER/.git" ]
then
    rm -f ~/.bashrc
    ln -s $FOLDER/bashrc ~/.bashrc    
    rm -f ~/.vimrc
    ln -s $FOLDER/vimrc ~/.vimrc
    rm -f ~/.tmux.conf
    ln -s $FOLDER/tmux.conf ~/.tmux.conf
fi

source ~/.bashrc;

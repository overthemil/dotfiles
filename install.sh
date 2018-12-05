#!/bin/bash

FOLDER=$(pwd)

if [ -d "$FOLDER/.git" ]
then
    rm ~/.bashrc
    ln -s $FOLDER/.bashrc ~/.bashrc    
    rm ~/.vimrc
	ln -s $FOLDER/.vimrc ~/.vimrc
	rm ~/.tmux.conf
	ln -s $FOLDER/.tmux.conf ~/.tmux.conf
fi


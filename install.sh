#!/bin/bash

FOLDER=$(pwd)

if [ -d "$FOLDER/.git" ]
then
	rm ~/.vimrc
	ln -s $FOLDER/.vimrc ~/.vimrc
	rm ~/.tmux.conf
	ln -s $FOLDER/.tmux.conf ~/.tmux.conf
fi


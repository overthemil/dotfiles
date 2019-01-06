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
    rm ~/.Xresources 
    ln -s $FOLDER/.Xresources ~/.Xresources 
    rm ~/.wallpaper 
    ln -s $FOLDER/.wallpaper ~/.wallpaper 
    rm -r ~/.config/i3
    ln -s $FOLDER/config/i3 ~/.config/i3 
    rm -r ~/.config/i3blocks 
    ln -s $FOLDER/config/i3blocks ~/.config/i3blocks
fi

python ~/.vim/plugged/YouCompleteMe/install.py;

sudo pacman -S git;

git clone https://aur.archlinux.org/trizen.git;
cd trizen;
makepkg -si;
cd ..;
rm -r trizen;

sudo pacman -S tmux;
sudo pacman -S imagemagick;
sudo pacman -S scrot;
trizen -S ttf-font-awesome-4;

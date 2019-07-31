#!/bin/bash

FOLDER=$(pwd)

sudo pacman -S xorg-server xorg-xinit xorg-utils xorg-server-utils xorg-xrdb;
sudo pacman -S vim tmux rxvt-unicode xclip fzf cmake; 
sudo pacman -S i3-gaps i3blocks i3status ttf-dejavu rofi ranger feh; 
sudo pacman -S i3lock imagemagick scrot; 

mkdir -p ~/.config/i3
mkdir -p ~/.config/i3blocks

if [ -d "$FOLDER/.git" ]
then
    rm -f ~/.bashrc
    ln -s $FOLDER/.bashrc ~/.bashrc    
    rm -f ~/.vimrc
    ln -s $FOLDER/.vimrc ~/.vimrc
    rm -f ~/.tmux.conf
    ln -s $FOLDER/.tmux.conf ~/.tmux.conf
    rm -f ~/.Xresources 
    ln -s $FOLDER/.Xresources ~/.Xresources 
    rm -f ~/.wallpaper 
    ln -s $FOLDER/.wallpaper ~/.wallpaper 
    rm -f -r ~/.config/i3
    ln -s $FOLDER/config/i3 ~/.config/i3 
    rm -f -r ~/.config/i3blocks 
    ln -s $FOLDER/config/i3blocks ~/.config/i3blocks
    rm -f ~/.xinitrc 
    ln -s $FOLDER/.xinitrc ~/.xinitrc 
fi

git clone https://aur.archlinux.org/trizen.git;
cd trizen
makepkg -si;
cd ..
trizen -S ttf-font-awesome-4;

source ~/.bashrc;

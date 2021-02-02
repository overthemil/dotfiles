#!/bin/bash

FOLDER=$(pwd)

# Ensure git, base and base-devel are already installed
pacman -S xorg-server xorg-xinit i3-gaps i3status i3-wm dunst i3lock i3blocks python-pywal
pacman -S compton feh rxvt-unicode xclip rofi xsettingsd lxappearance scrot viewnior imagemagick ttf-dejavu ranger
pacman -S vim neovim tmux

# Install the AUR Helper, yay, before continuing
# git clone https://aur.archlinux.org/yay.git
# cd yay 
# makepkg -si
# cd $FOLDER
# yay -S ttf-font-awesome-4
# TODO: have the block above be executed without sudo priv 

mkdir -p ~/.config/i3
mkdir -p ~/.config/i3blocks

if [ -d "$FOLDER/.git" ]
then
    rm -f ~/.bashrc
    ln -s $FOLDER/bashrc ~/.bashrc    
    rm -f ~/.vimrc
    ln -s $FOLDER/vimrc ~/.vimrc
    rm -f ~/.tmux.conf
    ln -s $FOLDER/tmux.conf ~/.tmux.conf
    rm -f ~/.xinitrc
    ln -s $FOLDER/xinitrc ~/.xinitrc
    rm -f ~/.Xresources
    ln -s $FOLDER/Xresources ~/.Xresources
    rm -f ~/.wallpaper
    ln -s $FOLDER/wallpaper.png ~/.wallpaper
    rm -f -r ~/.config/i3
    ln -s $FOLDER/config/i3 ~/.config/i3
    rm -f -r ~/.config/i3blocks
    ln -s $FOLDER/config/i3blocks ~/.config/i3blocks
fi

wal -i ~/.wallpaper
source ~/.bashrc;

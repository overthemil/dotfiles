#!/bin/bash

## VARIABLES
FOLDER=$(pwd)
user=$(whoami)

# For some reason, ~/ copies to wrong dir sometimes
HOME=/home/$user

# Get tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Get Oh-My-Bash
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it

## COPY CONFIGS
echo ""
echo "----------------------------"
echo "Copying config files to home"
echo "----------------------------"
echo ""

mkdir -p $HOME/.local/share/konsole

cp -v $FOLDER/bashrc $HOME/.bashrc    
cp -v $FOLDER/vimrc $HOME/.vimrc
cp -v $FOLDER/tmux.conf $HOME/.tmux.conf
cp -v $FOLDER/wallpaper.png $HOME/.wallpaper

gsettings set org.gnome.desktop.background picture-uri file://$HOME/.wallpaper

echo "                            "
echo " Remember to run:           "
echo "      source ~/.bashrc      "
echo "                            "
echo "----------------------------"
echo "            DONE            "
echo "----------------------------"
echo "                            "

#!/bin/bash

## VARIABLES
FOLDER=$(pwd)
user=$(whoami)

# For some reason, ~/ copies to wrong dir sometimes
HOME=/home/$user

# Get tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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
cp -v $FOLDER/xinitrc $HOME/.xinitrc
cp -v $FOLDER/Xresources $HOME/.Xresources
cp -v $FOLDER/wallpaper.jpg $HOME/.wallpaper
cp -v $FOLDER/nord.colorscheme $HOME/.local/share/konsole/nord.colorscheme

echo "                            "
echo " Remember to run:           "
echo " 		source ~/.bashrc      "
echo "                            "
echo "----------------------------"
echo "            DONE            "
echo "----------------------------"
echo "                            "
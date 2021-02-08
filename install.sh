#!/bin/bash

## VARIABLES
FOLDER=$(pwd)
user=$(whoami)

# For some reason, ~/ copies to wrong dir sometimes
HOME=/home/$user

## COPY CONFIGS
echo ""
echo "----------------------------"
echo "Copying config files to home"
echo "----------------------------"
echo ""

cp -v $FOLDER/bashrc $HOME/.bashrc    
cp -v $FOLDER/vimrc $HOME/.vimrc
cp -v $FOLDER/tmux.conf $HOME/.tmux.conf
cp -v $FOLDER/xinitrc $HOME/.xinitrc
cp -v $FOLDER/Xresources $HOME/.Xresources
cp -v $FOLDER/wallpaper.jpg $HOME/.wallpaper

echo "                            "
echo " Remember to run:           "
echo " 		source ~/.bashrc      "
echo "                            "
echo "----------------------------"
echo "            DONE            "
echo "----------------------------"
echo "                            "
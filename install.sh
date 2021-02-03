#!/bin/bash

# Script must be run as root (with sudo)
# ref: https://askubuntu.com/a/30157/8698
if ! [ $(id -u) = 0 ]; then
   echo "The script needs to be run as root." >&2
   exit 1
fi

## VARIABLES
FOLDER=$(pwd)

# Used to run some commands as the original user instead
# of sudo (use case: sudo -u $real_user <command>)
if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi

# For some reason, ~/ copies to wrong dir sometimes
HOME=/home/$real_user
RUN_AS_USER="sudo -u $real_user"

## PACKAGES
# Basic requirements
pacman --needed -S git base-devel nano vim xorg xorg-xinit xterm ttf-font rxvt-unicode
# i3
pacman --needed -S i3-gaps i3status i3-wm i3lock i3blocks 
# WM additions
pacman --needed -S dunst python-pywal compton feh rxvt-unicode xclip rofi xsettingsd 
pacman --needed -S lxappearance scrot viewnior imagemagick ttf-dejavu ranger
# Apps
pacman --neded -S tmux firefox

# Install the AUR Helper, yay.
[ ! -d 'yay' ] && $RUN_AS_USER  git clone https://aur.archlinux.org/yay.git
(cd yay && $RUN_AS_USER  makepkg -si)
$RUN_AS_USER  yay --needed -S ttf-font-awesome-4

## COPY CONFIGS
echo ""
echo "----------------------------"
echo "Copying config files to home"
echo "----------------------------"
echo ""
$RUN_AS_USER mkdir -p -v $HOME/.config/i3
$RUN_AS_USER mkdir -p -v $HOME/.config/i3blocks
$RUN_AS_USER cp -v $FOLDER/bashrc $HOME/.bashrc    
$RUN_AS_USER cp -v $FOLDER/vimrc $HOME/.vimrc
$RUN_AS_USER cp -v $FOLDER/tmux.conf $HOME/.tmux.conf
$RUN_AS_USER cp -v $FOLDER/xinitrc $HOME/.xinitrc
$RUN_AS_USER cp -v $FOLDER/Xresources $HOME/.Xresources
$RUN_AS_USER cp -v $FOLDER/wallpaper.jpg $HOME/.wallpaper
$RUN_AS_USER cp -v $FOLDER/config/i3/config $HOME/.config/i3/config
$RUN_AS_USER cp -v $FOLDER/config/i3blocks/config $HOME/.config/i3blocks/config

$RUN_AS_USER wal -i $HOME/.wallpaper

echo "                            "
echo " Remember to run:           "
echo " 		source ~/.bashrc      "
echo "                            "
echo "----------------------------"
echo "            DONE            "
echo "----------------------------"
echo "                            "
#!/bin/bash

## VARIABLES
FOLDER=$(pwd)
user=$(whoami)

HOME=/home/$user

echo "Detecting distro"
DISTRO_ID=$(cat /etc/*-release | awk -F= '$1=="ID"{print$2}')
if [ $DISTRO_ID == 'fedora' ]
then
	echo "Fedora detected"
	chmod +x 'fedora_packages.sh'
	sudo $FOLDER'/fedora_packages.sh'
fi

# Get tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Get ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
mkdir ~/.zsh/
cp -v zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Rust 
echo "------ Installing Rust ------"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## COPY CONFIGS
echo ""
echo "----------------------------"
echo "Copying config files to home"
echo "----------------------------"
echo ""

cp -v $FOLDER/zshrc $HOME/.zshrc
cp -v $FOLDER/tmux.conf $HOME/.tmux.conf
cp -v $FOLDER/wallpaper.png $HOME/.wallpaper
cp -v $FOLDER/gdbinit $HOME/.gdbinit
cp -v $FOLDER/kitty $HOME/.config/kitty/kitty.conf

if [ $XDG_CURRENT_DESKTOP == 'GNOME' ]
then
	gsettings set org.gnome.desktop.background picture-uri file://$HOME/.wallpaper
else
	echo "[!] Set wallpaper manually"
fi

# Download fonts
echo "Downloading Nerd Font"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip "*.ttf" -d $HOME/.fonts 
fc-cache -f -v

$(chsh -s $(which zsh))

kitty +kitten themes --reload-in=all Catppuccin-Mocha

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
cp -r $FOLDER/nvim $HOME/.config/nvim/lua/custom/

rustup component add rust-analyzer

echo "                            "
echo "----------------------------"
echo "            DONE            "
echo "----------------------------"
echo "                            "

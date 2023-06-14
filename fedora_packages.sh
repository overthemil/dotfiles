#!/bin/bash

echo ""
echo "----------------------------"
echo "Installing Fedora packages  "
echo "----------------------------"
echo ""

dnf install neovim kitty zsh util-linux 
dnf -y groupinstall "Development Tools"

echo "More theming options for Fedora: "
echo "    Mutter Rounded"


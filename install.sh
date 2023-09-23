#!/bin/bash

echo "Detecting distro"
DISTRO_ID=$(cat /etc/*-release | awk -F= '$1=="ID"{print$2}')
if [ $DISTRO_ID == 'fedora' ]
then
	echo "Fedora detected"
	chmod +x 'fedora_packages.sh'
	sudo $FOLDER'/fedora_packages.sh'
fi

echo "                            "
echo "----------------------------"
echo "            DONE            "
echo "----------------------------"
echo "                            "

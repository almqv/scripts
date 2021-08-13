#!/bin/sh

BG_PATH=$1

if test -f "$BG_PATH"; then
	echo -e "\e[1mUpdating background.\e[0m"
	nitrogen --set-zoom-fill $BG_PATH
	echo -e "\e[1mIf you have multiple screens then you might have to set the background yourself as nitrogen thinks that your array of screen is itself only one screen.\e[0m"

	echo -e "\e[1mUpdating lockscreen.\e[0m"
	betterlockscreen -u $BG_PATH 

	echo -e "\e[1mUpdating background image.\e[0m"
	cp $BG_PATH $HOME/.wallpaper.jpg
	exit
else
	echo -e "\e[1m[Error]: No such file\e[0m"
	exit
fi

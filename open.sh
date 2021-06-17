#!/usr/bin/sh

file=$1
filename=$(basename -- "$file")
extension="${filename##*.}"
filename="${filename%.*}"

case $extension in
	
	# Video media
	
	# Picture media

	# Webpages / URL

	# File
	*)
		$EDITOR $file
		;;

esac

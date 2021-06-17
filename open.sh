#!/usr/bin/sh

file=$1
filename=$(basename -- "$file")
extension="${filename##*.}"
filename="${filename%.*}"

case $extension in
	
	# Video media
	webm | mkv | mpg | mp2 | mpeg | mpe | mpv | ogg | mp4 | m4p | m4v | avi | wmv | mov | qt | flv | swf | avchd )
		$VIDPLAY $file
		;;
	
	# Picture media
	jpeg | jpg | png | gif | tiff | psd | raw )
		$IMGVIEW $file
		;;

	# Webpages / URL
	html | html5 )
		$BROWSER $file
		;;

	# File
	*)
		$EDITOR $file
		;;

esac

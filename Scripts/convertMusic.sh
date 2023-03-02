#!/bin/bash


files=$(find $1 -type f )

echo "Creating parent folder tree"
find $1 -type d | while read -r dir
do
	# echo $dir
	subdir=$(echo $dir | sed "s/$1//")
	# echo $subdir
	echo "Making $2$subdir"
	mkdir -p "$2$subdir"
done

find $1 -type f | while read -r file
do
	ext=$(echo $file | sed "s/\(.*\)\.//")
	# echo $ext
	if [ $ext = "opus" ] || [ $ext = "m4a" ] || [ $ext = "mp3" ] || [ $ext = "m4a" ] || [ $ext = "flac" ] || [ $ext = "ogg" ]
	then
		echo "$file"
		strip=$(echo $file | sed -e "s/\(.*\)\..*/\1/" -e "s/$1//")

		#echo $strip
		newname="$2$strip.opus"
		echo $newname
		ffmpeg -nostdin -loglevel error -stats -hide_banner -y -i "$file" -c:a libopus -b:a $3 "$newname"
	else
		# echo "$file"
		newname="$2$(echo $file | sed -e "s/$1//")"
		# echo $newname
		cp -v "$file" "$newname"
	fi	
done


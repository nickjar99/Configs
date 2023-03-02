#!/bin/bash


# files=$(find $1 -type f )

find $1 -type f | while read -r file
do
    ext=$(echo $file | sed "s/\(.*\)\.//")
    # echo $ext
	if [ $ext = "opus" ] || [ $ext = "m4a" ] || [ $ext = "mp3" ] || [ $ext = "m4a" ] || [ $ext = "flac" ] || [ $ext = "ogg" ]
    # if [ $ext = "flac" ]
    then
        # echo $file
        # mediainfo "$file"
        bitrate=$(mediainfo -F "$file" | grep bit | grep -v mode | grep "kb/s" | sed -e "s/.*\: //" -e "s/ kb\/s//" -e "s/ //g")
        echo "$bitrate $file"
    fi
done
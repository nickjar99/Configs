#!/bin/bash


for folder in ".anaconda3" ".miniconda3" "anaconda3" "miniconda3"; do
	echo $folder	
	if [[ -d "$HOME/$folder" ]]; then
		echo conda
	fi

done

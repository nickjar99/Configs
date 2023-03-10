#!/bin/bash

bash git.sh
bash zsh-setup.sh $2

platform=$1
echo "Platform: $platform"


if [ "$platform" == "wsl" ]
then
	echo "Matched platform wsl"
	bash setup-wsl.sh
fi

if [ "$platform" == "termux" ]
then
	echo "Matched platform termux"
	bash setup-termux.sh
fi


#!/bin/bash

bash git.sh
bash zsh-setup.sh

platform=$1
echo "Platform: $platform"


if [ "$platform" == "wsl" ]
then
	echo "Matched platform wsl"
	./setup-wsl.sh
fi

if [ "$platform" == "termux" ]
then
	echo "Matched platform termux"
	./setup-termux.sh
fi


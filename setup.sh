#!/bin/bash

#bash git.sh
#bash zsh-setup.sh "$@"

# checking if on termux
name=$(uname -r)
if [[ "$name" == *"android"* ]]; then
	echo "Using termux"
fi

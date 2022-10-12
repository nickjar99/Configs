#!/bin/bash

bash git.sh
bash zsh-setup.sh "$@"

# checking if on termux
name=$(uname -r)
if [[ "$name" == *"android"* ]]; then
	echo "Using termux"
	mkdir -p ~/.termux/boot
	touch ~/.termux/boot/start-sshd
	echo "termux-wake-lock" >> ~/.termux/boot/start-sshd
	echo "sshd" >> ~/.termux/boot/start-sshd
fi

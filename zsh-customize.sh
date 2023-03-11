#!/bin/bash

echo "Customizing oh-my-zsh install..."
agnoster="$HOME/.oh-my-zsh/themes/agnoster.zsh-theme"

echo "$1"
# Prompt color
if [ ! -z $1 ]
then
	sed "218s/blue/$1/" -i $agnoster
fi

sed "11s/robbyrussell/agnoster/" -i ~/.zshrc
sed "s/  prompt_git/#  prompt_git/g" -i $agnoster 

# removing unnecessary username but keeping the tail
sed "91s/ \".*||//" -i $agnoster 
sed "93s/fi/else; prompt_segment black default; fi/" -i $agnoster 

# removing X after failed command
sed "235s/.*/#/" -i $agnoster


# aliases
echo "alias nf='neofetch'" >> ~/.zshrc
echo "alias n='time ncdu'" >> ~/.zshrc

echo "alias f='find . -type f -iname'" >> ~/.zshrc
echo "alias gcl='git clone'" >> ~/.zshrc


echo "export PATH=\$PATH:$HOME/.local/bin" >> ~/.zshrc
echo "export PATH=\$PATH:$HOME/.cargo/bin" >> ~/.zshrc




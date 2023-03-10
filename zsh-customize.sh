#!/bin/bash

echo "Customizing oh-my-zsh install..."

echo "$1"
# Prompt color
if [ ! -z $1 ]
then
	sed "218s/blue/$1/" -i ~/.oh-my-zsh/themes/agnoster.zsh-theme
fi

sed "11s/robbyrussell/agnoster/" -i ~/.zshrc
sed "s/  prompt_git/#  prompt_git/g" -i ~/.oh-my-zsh/themes/agnoster.zsh-theme

# removing unnecessary username
sed "91s/ \".*||//" -i ~/.oh-my-zsh/themes/agnoster.zsh-theme

# removing X after failed command
sed "235s/.*/#/" -i ~/.oh-my-zsh/themes/agnoster.zsh-theme

# aliases
echo "alias nf='neofetch'" >> ~/.zshrc
echo "alias n='time ncdu'" >> ~/.zshrc

echo "alias f='find . -type f -iname'" >> ~/.zshrc
echo "alias gcl='git clone'" >> ~/.zshrc


echo "export PATH=\$PATH:$HOME/.local/bin" >> ~/.zshrc
echo "export PATH=\$PATH:$HOME/.cargo/bin" >> ~/.zshrc




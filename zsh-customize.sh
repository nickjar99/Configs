#!/bin/bash

echo "Customizing oh-my-zsh install..."


sed "11s/robbyrussell/agnoster/" -i ~/.zshrc
sed "s/  prompt_git/#  prompt_git/g" -i ~/.oh-my-zsh/themes/agnoster.zsh-theme

# aliases
echo "alias gcl=\"git clone\"" >> ~/.zshrc
echo "alias nf=\"neofetch\"" >> ~/.zshrc

echo "function gcl () { git clone $@ }" >> ~/.zshrc
echo "function gpl () { git pull }" >> ~/.zshrc
echo "function gph () { git push }" >> ~/.zshrc
echo "function f () { find . -iname \"$@\" }" >> ~/.zshrc

echo "alias n=ncdu" >> ~/.zshrc

echo "export PATH=\$PATH:/home/$USER/.local/bin" >> ~/.zshrc





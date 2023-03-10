#!/bin/bash

echo "Customizing oh-my-zsh install..."

sed "11s/robbyrussell/agnoster/" -i ~/.zshrc
sed "s/  prompt_git/#  prompt_git/g" -i ~/.oh-my-zsh/themes/agnoster.zsh-theme

# aliases
echo "alias nf=\"neofetch\"" >> ~/.zshrc
echo "alias n='time ncdu'" >> ~/.zshrc

echo "alias f='find . -type f -iname'" >> ~/.zshrc
echo "alias gcl='git clone'" >> ~/.zshrc


echo "export PATH=\$PATH:$HOME/.local/bin" >> ~/.zshrc
echo "export PATH=\$PATH:$HOME/.cargo/bin" >> ~/.zshrc




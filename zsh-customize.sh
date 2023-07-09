#!/bin/bash

echo "Customizing install..."
agnoster="$HOME/.oh-my-zsh/themes/agnoster.zsh-theme"

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
echo "" >> ~/.zshrc
echo "alias nf='neofetch'" >> ~/.zshrc
echo "alias n='time ncdu'" >> ~/.zshrc

echo "alias f='find . -type f -iname'" >> ~/.zshrc
echo "unalias gr" >> ~/.zshrc
echo "alias gr='grep'" >> ~/.zshrc

echo "export PATH=\$PATH:$HOME/.local/bin" >> ~/.zshrc
echo "export PATH=\$PATH:$HOME/.cargo/bin" >> ~/.zshrc
echo "" >> ~/.zshrc

# apt alias if apt is installed 
if [[ "$(which apt 2>/dev/null)" == "" ]]; then
        echo "No apt"
else
        echo "apt"
fi

# conda alias if conda is installed
for folder in ".anaconda3" ".miniconda3" "anaconda3" "miniconda3"; do
        if [[ -d "$HOME/$folder" ]]; then
                echo "Found conda install: ~/$folder, adding to PATH"
        	echo "export PATH=\$PATH:$HOME/$folder/bin" >> ~/.zshrc
	fi
done

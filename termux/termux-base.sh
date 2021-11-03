#!/bin/bash

#termux-setup-storage

pkg up -y

pkg in -y game-repo science-repo x11-repo root-repo

pkg in -y git curl wget zsh openssh python neofetch htop man termux-api zsh tigervnc nano vim zip ncdu ffmpeg tsu build-essential bsdtar proot rsync 

bash git.sh

# Setting up ssh keys if they aren't already
if [[ ! -d ~/.ssh ]]; then
    ssh-keygen -N "" -f ~/.ssh/id_rsa
else
    echo "SSH keys already exist"
fi
sshd

mkdit -p ~/.termux/boot
echo "#!/data/data/com.termux/files/usr/bin/sh\n    termux-wake-lock\n    sshd" > ~/.termux/boot/start-sshd  


# youtube-dl
python3 -m pip install --upgrade pip youtube-dl youtube-dlc


# oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then rm -rf ~/.oh-my-zsh ~/.zshrc; fi
curl -o install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh --unattended
echo "Customizing oh-my-zsh install..."
sed "11s/robbyrussell/agnoster/" -i ~/.zshrc
# sed "219d; 91,94d; 90s/{/{}/" -i ~/.oh-my-zsh/themes/agnoster.zsh-theme
# aliases
echo "alias ytdl=youtube-dl\n" >> ~/.zshrc
echo "alias gcl=\"git clone\"\n" >> ~/.zshrc
echo "alias nf=\"neofetch\"\n" >> ~/.zshrc

echo "alias home=\"cd ~/storage/shared\"" >> ~/.zshrc
chsh -s zsh

rm install.sh

# vnc (partial)
# if  [ ! -f ~/.vnc/passwd ]; then vncpasswd; fi

# its-pointless repo
curl -LO https://its-pointless.github.io/setup-pointless-repo.sh
bash setup-pointless-repo.sh


echo "Finished script!"



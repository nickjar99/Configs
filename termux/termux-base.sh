termux-setup-storage

pkg up

pkg in -y game-repo science-repo unstable-repo x11-repo root-repo

pkg in -y git wget curl openssh nano neofetch htop man termux-api

# Setting up ssh keys if they aren't already
if [ ! -d ~/.ssh ]; then
    ssh-keygen -N "" -f ~/.ssh/id_rsa
else
    echo "SSH keys already exist"
fi

if [! -f ~/.termux/boot/start-sshd]; then
    echo "#!/data/data/com.termux/files/usr/bin/sh\n    termux-wake-lock\n    sshd"
fi

# youtube-dl
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /data/data/com.termux/files/usr/bin/youtube-dl
chmod a+rx /data/data/com.termux/files/usr/bin/youtube-dl

# oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then rm -rf ~/.oh-my-zsh ~/.zshrc; fi
curl -o install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh --unattended

echo "Customizing oh-my-zsh install..."
sed "11s/robbyrussell/agnoster/" -i ~/.zshrc
sed "219d; 91,94d; 90s/{/{}/" -i ~/.oh-my-zsh/themes/agnoster.zsh-theme
# aliases
echo "alias ytdl=youtube-dl\n" >> ~/.zshrc
echo "alias gcl=\"git clone\"\n" >> ~/.zshrc
echo "alias nf=\"neofetch\"\n" >> ~/.zshrc
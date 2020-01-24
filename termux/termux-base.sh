termux-setup-storage

pkg up

pkg in -y game-repo science-repo unstable-repo x11-repo root-repo termux-apt-repo

pkg in -y git wget curl openssh nano neofetch htop man 

# Setting up ssh keys if they aren't already
if [ ! -d ~/.ssh ]; then
    ssh-keygen -N "" -f ~/.ssh/id_rsa
else
    echo "SSH keys already exist"
fi

# youtube-dl
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /data/data/com.termux/files/usr/bin/youtube-dl
chmod a+rx /data/data/com.termux/files/usr/bin/youtube-dl

# oh-my-zsh
sh ../oh-my-zsh-full.sh

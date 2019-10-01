termux-setup-storage

pkg up

pkg in game-repo science-repo unstable-repo x11-repo termux-apt-repo

pkg in git wget curl openssh nano neofetch glances htop python-pip man 

# oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


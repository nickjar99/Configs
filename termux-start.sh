termux-setup-storage

pkg up

pkg in game-repo science-repo unstable-repo x11-repo termux-apt-repo

pkg in git wget curl openssh 

#its-pointless
$PREFIX/bin/wget https://its-pointless.github.io/setup-pointless-repo.sh
bash setup-pointless-repo.sh
rm setup-pointless-repo.sh



#Oh-my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussel/oh-my-zsh/master/tools/install.sh)"

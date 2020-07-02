# directory stuff
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
chdir $DIR

sudo apt update
sudo apt upgrade -y
sudo apt install -y wget curl git vim nano neofetch htop ncdu unzip rar zsh openssh-server powerline \\
 hdparm python3-pip glances ffmpeg

sh ../git.sh
sh ../zsh-full.sh

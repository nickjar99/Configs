echo "Enabling networkmanager"
sudo systemctl enable NetworkManager.service

echo "Setting up yay"

sudo pacman -S base-devel

mkdir -p projects/aur
cd projects/aur
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

rm -rf projects

cd ~
yay -Syuu - < pacman-aur.txt
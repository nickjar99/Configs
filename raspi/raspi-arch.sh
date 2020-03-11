# Run as sudo
pacman-key --init
pacman-key --populate archlinuxarm

ip link set eth0 up
dhcpcd

pacman -Syuu

pacman -S - < archRpiPackages.txt

userdel -r alarm
echo "%wheel ALL=(ALL) NOPASSWD: ALL"
useradd -m -G wheel nick

echo "Set root password:"
passwd
echo "Setting password for nick:"
passwd nick


echo "arch-pi" > /etc/hostname
sed 's/# en_US.UTF-8 UTF-8/en_US.UTF-8'
echo "LANG=en.US.UTF-8" > /etc/locale.conf
locale-gen

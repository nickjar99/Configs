# Run as sudo
pacman-key --init
pacman-key --populate archlinuxarm

ip link set eth0 up
dhcpcd

pacman -Syuu

pacman -S 
timedatectl set-ntp true
echo "# Mines LUG Mirror" > /etc/pacman.d/mirrorlist.conf
echo "#Server = https://lug.mines.edu/mirrors/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrorlist.conf
echo "Added mines mirror to mirrorlist"
echo "Now partition the disks. Run the second script once you've mounted the partitions."
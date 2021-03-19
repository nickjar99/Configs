timedatectl set-ntp true
#echo "# Mines LUG Mirror" >> /etc/pacman.d/mirrorlist
#echo "#Server = https://lug.mines.edu/mirrors/archlinux/$repo/os/$arch" >> /etc/pacman.d/mirrorlist
sed '10 a # Server = https://lug.mines.edu/mirrors/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
echo "Added Mines mirror to mirrorlist"
echo "Now partition the disks. Run the second script once you've mounted the partitions."

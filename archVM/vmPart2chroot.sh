echo "Nice, you made it to part 2!"
sleep 0.25s

ln -sf /usr/share/zoneinfo/America/Denver/etc/localtime
hwclock --systohc

# Locales
sed -i "14ien_US.UTF-8 UTF-8" /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# Hostname
echo "Choose a hostname:"
read hostname
echo "$hostname" >> /etc/hostname
echo "127.0.0.1\tlocalhost\n::1\tlocalhost\n127.0.1.1\t$hostname.localdomain $hostname"

# add nick user and passwords
sed -i "82i%wheel ALL=(ALL) ALL" /etc/sudoers
useradd -G wheel -m -s /usr/bin/zsh nick
read -sp "Enter a password for both accounts: " password
#echo "temp\ntemp" | passd
#echo "temp\ntemp" | passwd nick
echo "root:$password" | chpasswd
echo "nick:$password" | chpasswd

# makepkg
sed -i "40iCFLAGS=\"-march=native -02 -pipe -fno-plt"\" /etc/makepkg.conf
sed -i "41iCXXFLAGS=\"${CFLAGS}\"" /etc/makepkg.conf
sed -i "44iMAKEFLAGS=\"-j$(nproc)" / etc/makepkg.conf
sed -i "130iCOMPRESSGZ=(pigz -c -f -n)" /etc/makepkg.conf
sed -i "132iCOMPRESSXZ=(xz -c -z - --threads=0)" /etc/makepkg.conf
sed -i "131iCOMPRESSBZ2=(pbzip2 -c -f)" /etc/makepkg.conf
sed -i "133iCOMPRESSZST=(zstd -c -z -q - --threads=0)" /etc/makepkg.conf

# more packages
pacman -S zstd gcc-libs glances base-devel neofetch ncdu make pigz pbzip2 unzip xz

# Bootloader
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

exit
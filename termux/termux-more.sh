#!/bin/bash

# More packages
pkg in -y golang rust unzip zip dos2unix unrar tty-clock imagemagick tigervnc shared-mime-info screenfetch screen ruby ripgrep readline-static pkg-config p7zip ffmpeg opusfile-static opus-tools ninja ncdu imagemagick help2man graphicsmagick golang-doc gdb fdupes feh fakeroot emacs dialog cowsay clang cmake ccache bsdtar bash-completion autoconf automake termux-services termux-apt-repo ccache automake autoconf autossh


# Python stuff
pip install --upgrade pip
pip install --user pylint

# other stuff
pkg in -y  hwinfo hwprobe openvpn

# epic hax
pkg in -y aircrack-ng wavemon iw ipset ipset-static

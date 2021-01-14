#!/usr/bin/env bash
# Copyright 2017-2020 by SDRausty. All rights reserved, see LICENSE 🌎 🌍 🌏
# Hosting sdrausty.github.io/TermuxArch courtesy https://pages.github.com.
# https://sdrausty.github.io/TermuxArch/README has info about this project.
# https://sdrausty.github.io/TermuxArch/CONTRIBUTORS Thank you for your help.
##############################################################################
# IFS=$'\n\t'
set -Eeuo pipefail
shopt -s nullglob globstar
unset LD_PRELOAD
VERSIONID=2.0.593
 
_TRPERR_() {  # run on script error
	local RV="$?"
	printf "\\e[?25h\\n\\e[1;48;5;138m %s\\e[0m\\n\\n" "TermuxArch WARNING:  Generated script signal ${RV:-unknown} near or at line number ${1:-unknown} by `${2:-command}`!"
	exit 201
}
 
_TRPET_() {  # run on exit
	local RV="$?" 
  	printf "" 
	 
	if [[ "$RV" = 0 ]]
	then
		printf "\\e[0;32m%s\\e[1;34m: \\e[1;32m%s\\e[0m\\n\\e[0m" "${0##*/} $@ 2.0.593" "DONE 🏁 "
		printf "\\e]2; %s: %s \007" "${0##*/} $@" "DONE 🏁 "
	else 
		printf "\\e[0;32m%s \\e[0m%s\\e[1;34m: \\e[1;32m%s\\e[0m\\n\\e[0m" "${0##*/} $@ 2.0.593" "[Exit Signal $RV]" "DONE  🏁 "
		printf "\033]2; %s: %s %s \007" "${0##*/} $@" "[Exit Signal $RV]" "DONE 🏁 "
	fi
	printf "\e[?25h\e[0m"
	set +Eeuo pipefail
	exit
}
 
_TRPSIG_() {  # run on signal
	printf "\\e[?25h\\e[1;7;38;5;0mTermuxArch WARNING:  Signal $? received!\\e[0m\\n"
 	exit 211
}
 
_TRPQ_() {  # run on quit
	printf "\\e[?25h\\e[1;7;38;5;0mTermuxArch WARNING:  Quit signal $? received!\\e[0m\\n"
 	exit 221
}
 
trap '_TRPERR_ $LINENO $BASH_COMMAND $?' ERR
trap _TRPET_ EXIT
trap _TRPSIG_ HUP INT TERM
trap _TRPQ_ QUIT
 
set +Eeuo pipefail
umask 0022
exec proot --kernel-release=4.9.210-gdee0d123b122-ab6570413-generic --kill-on-exit --link2symlink -0 -r /data/data/com.termux/files/home/arch -b /apex:/apex -b /dev/ashmem:/dev/ashmem -b /storage/:/storage/ -b /data/data/com.termux/files/home:/data/data/com.termux/files/home -b /dev/urandom:/dev/random -b /sdcard:/sdcard -b /data/data/com.termux/files/usr:/data/data/com.termux/files/usr -b /proc/:/proc/ -b /vendor/:/vendor/ -b /proc/self/fd:/dev/fd -b /system/:/system/ -b /data/data/com.termux/files/home/arch/var/binds/fbindprocuptime:/proc/uptime -b /data/data/com.termux/files/home/arch/tmp:/dev/shm -b /data/data/com.termux/files/home/arch/var/binds/fbindprocstat:/proc/stat -b /sys/:/sys/ -b /dev/:/dev/ -w /root /usr/bin/env -i HOME=/root TERM="xterm-256color" TMPDIR=/tmp ANDROID_DATA=/data  /root/bin/finishsetup.bash ||:
set -Eeuo pipefail

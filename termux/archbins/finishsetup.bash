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
 
_PMFSESTRING_() {
printf "\e[1;31m%s\e[1;37m%s\e[1;32m%s\e[1;37m%s\n\n" "Signal generated in '$1' : Cannot complete task : " "Continuing...   To correct the error run " "setupTermuxArch refresh" " to attempt to finish the autoconfiguration."
printf "\e[1;34m%s\e[0;34m%s\e[1;34m%s\e[0;34m%s\e[1;34m%s\n\n" "  If you find better resolves for " "setupTermuxArch" " and " "$0" ", please open an issue and accompanying pull request."
}
printf "\e[0;32m%s\e[1;32m%s\e[0;32m%s\e[1;32m%s\e[0;32m%s\e[1;32m%s\e[0;32m%s\e[1;32m%s\e[0;32m%s\n" "To generate locales in a preferred language use " "Settings > Language & Keyboard > Language " "in Android; Then run " "setupTermuxArch.sh refresh" " for a full system refresh including locale generation; For a quick refresh you can use " "setupTermuxArch.sh r" ".  For a refresh with user directories " "setupTermuxArch.sh re" " can be used."
printf "\n\e[1;34m:: \e[1;32m%s\n" "Processing system for Android arm64-v8a 10 arm64-v8a, and removing redundant packages for Termux PRoot installation if necessary..."
pacman -Syy || pacman -Syy || _PMFSESTRING_ "pacman -Syy finishsetup.bash setupTermuxArch.sh"
/root/bin/keys
pacman -Rc linux-aarch64 linux-firmware --noconfirm --color=always || _PMFSESTRING_ "pacman -Rc linux-aarch64 linux-firmware finishsetup.bash setupTermuxArch.sh"
pacman -Syu patch sudo unzip --noconfirm --color=always || pacman -Syu patch sudo unzip --noconfirm --color=always || _PMFSESTRING_ "pacman -Syu patch sudo unzip finishsetup.bash setupTermuxArch.sh"
/root/bin/addauser user || _PMFSESTRING_ "addauser user finishsetup.bash setupTermuxArch.sh"
   	printf "\e[1;32m%s\e[0;32m"  "==> " 
	if locale-gen 
	then
		:
	else
		_DOKEYS_
		pacman -Sy grep gzip sed sudo --noconfirm --color=always 
		locale-gen 
	fi
printf "\n\e[1;34m%s  \e[0m" "🕛 > 🕤 Arch Linux in Termux is installed and configured 📲  "
printf "\e]2;%s\007" " 🕛 > 🕤 Arch Linux in Termux is installed and configured 📲"

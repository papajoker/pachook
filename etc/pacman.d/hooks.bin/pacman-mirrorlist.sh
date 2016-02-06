#!/bin/sh
# add --country XXXXX 
reflector --verbose -l 4 -p http --sort rate --save /etc/pacman.d/mirrorlist 1>/dev/null
if (($?==0)); then
    echo "[$(date +'%F %H:%I')] [HOOK] pacman-mirrorlist" >>/var/log/pacman.log
	if [ -f "/etc/pacman.d/mirrorlist.pacnew" ]; then
		rm -v /etc/pacman.d/mirrorlist.pacnew
	else
		echo "no .pacnew to remove ?"
	fi
fi


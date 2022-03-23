#!/bin/sh

# load .Xresources file
xrdb -merge ~/.Xresources # SOLARIZED_DARK
#xrdb -DSOLARIZED_LIGHT -merge ~/.Xresources

# kill X with C-A-BS
setxkbmap -option terminate:ctrl_alt_bksp

# disable bell
xset -b

# dual monitor
xrandr --output DVI-1 --primary --left-of HDMI-0

# fix DBus.Error.TimedOut (telegram freezes)
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# add my fonts to the font path
#xset +fp ~/.fonts/
#xset fp rehash

# start pulseaudio in the background
if hash pulseaudio 2> /dev/null; then
	pulseaudio --start &
fi
# register pulseaudio
if hash /usr/bin/start-pulseaudio-x11 2> /dev/null; then
	start-pulseaudio-x11 &
fi

# notification daemon
# https://github.com/dunst-project/dunst
dunst &

# enable numlock
numlockx on &

# fix java bug
# https://tools.suckless.org/x/wmname/
wmname LG3D &

# set background
#sh ~/.fehbg &
xsetroot -solid '#0D3642'

# default cursor
xsetroot -cursor_name left_ptr

# grabbing keys
#xbindkeys &

# X compositing manager
#xcompmgr -cCfF &
#xcompmgr -CcfF -I-.03 -O-.06 -D2 -t-2 -l-5 -r4.2 -o.55 &

# open terminal
uxterm &
#uxterm -class="xterm-float" -geometry 80x20+200+600@1 &

# hello msg
on-online-runner && say-greatwords --notify &

# my-tray
#~/git/my-tray/my-tray.py &

# tray-screenshot-tools
~/git/tray-screenshot-tools/tray-screenshot-tools &

# conky
startconky &

# startx          # dwm by default
# s=xmonad startx # start $s
s=${s:-dwm}

case $s in
	# start dwm + dzenbar with logging (see dwm.log, default at $HOME)
	dwm)
		dzenbar &
		#DWM_LOG_PATH="$HOME/dwm.log" startdwm
		startdwm
		;;
	# start xmonad + xmobar + trayer
	xmonad)
		trayer --edge top --align right --height 18 --padding 0 --widthtype request --tint 0x002b36 --distancefrom right --distance 1 --expand true &
		xmonad
		;;
esac

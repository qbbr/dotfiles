#!/bin/sh

# default is dark, uncomment to set light
#export THEME_MODE_LIGHT=1

# enable HiDPI
#export HIDPI_ENABLED=1

# HTPC (my TV)
#export HTPC_ENABLED=1

# load .Xresources file
XRDB_ARGS=""

if [ -n "${HIDPI_ENABLED}" ]; then
	XRDB_ARGS="${XRDB_ARGS} -DHIDPI_ENABLED"
elif [ -n "${THEME_MODE_LIGHT}" ]; then
	XRDB_ARGS="${XRDB_ARGS} -DTHEME_MODE_LIGHT"
elif [ -n "${HTPC_ENABLED}" ]; then
	XRDB_ARGS="${XRDB_ARGS} -DHTPC_ENABLED"
fi

xrdb ${XRDB_ARGS} -merge ~/.Xresources

# kill X with C-A-BS
setxkbmap -option terminate:ctrl_alt_bksp

# disable bell
xset -b

# dual monitor
#xrandr --output DVI-1 --auto --primary --left-of HDMI-0 \
#    --output HDMI-0 --auto
# triple monitor
#xrandr --output DVI-D-1 --auto --primary \
#    --output DP-1 --auto --right-of DVI-D-1 \
#    --output DP-3 --auto --right-of DP-1 \
#    --output HDMI-1
# four monitors
xrandr --output HDMI-1 --auto --primary \
	--output DP-1 --auto --right-of HDMI-1 \
	--output DVI-D-1 --auto --above HDMI-1 \
	--output DP-2 --auto --above DP-1
# +5ive TV (DP-3)
#xrandr --output DP-3 --auto --left-of DVI-D-1

# fix DBus.Error.TimedOut (telegram freezes)
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# add my fonts to the font path
#xset +fp ~/.fonts/
#xset fp rehash

# start pulseaudio in the background
if hash pulseaudio 2> /dev/null && ! pgrep -x pulseaudio > /dev/null; then
	pulseaudio --start &
fi
# register pulseaudio
if hash /usr/bin/start-pulseaudio-x11 2> /dev/null && ! pgrep -x pulseaudio > /dev/null; then
	start-pulseaudio-x11 &
fi

# notification daemon
# https://github.com/dunst-project/dunst
dunst &

# enable numlock
numlockx on &

# fix java bug
# https://tools.suckless.org/x/wmname/
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
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

# open terminal apps
xterm -class 'xterm-monitor-1' -e "echo -e '\n\n\n'; cowsay -f 'unipony' 'Приветствую тебя, О ВЕЛИКИЙ QBBR.'; echo -e '\n\n\n'; bash" &
#xterm -class="xterm-float" -geometry 80x20+200+600@1 &
xterm -class 'htop' -e 'bpytop' &
xterm -class 'dmesg' -geometry 239x60 -e 'dmesg -Tw' &

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

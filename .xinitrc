#!/bin/sh

# load .Xresources file
xrdb -merge ~/.Xresources

# kill X with C-A-BS
setxkbmap -option terminate:ctrl_alt_bksp

# disable bell
xset -b

# dual monitor
xrandr --output DVI-1 --primary --left-of HDMI-0

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
xsetroot -cursor_name left_ptr &

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

# conky
startconky &

# start dwm + dzenbar with logging (see dwm.log, default at $HOME)
dzenbar &
#DWM_LOG_PATH="$HOME/dwm.log" startdwm
startdwm

# xmonad + xmobar + trayer
#trayer --edge top --align right --height 18 --padding 0 --widthtype request --tint 0x002b36 --distancefrom right --distance 1 --expand true &
#xmonad

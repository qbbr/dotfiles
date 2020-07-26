#!/bin/sh

# load .Xresources file
xrdb -merge ~/.Xresources

# kill X with C-A-BS
setxkbmap -option terminate:ctrl_alt_bksp

# disable bell
xset -b

# add my fonts to the font path
#xset +fp ~/.fonts/
#xset fp rehash

# pulseaudio
#pulseaudio --start &

# notification daemon
# https://github.com/dunst-project/dunst
#dunst &

# enable numlock
#numlockx on &

# fix java bug
# https://tools.suckless.org/x/wmname/
#wmname LG3D &

# set background
#sh ~/.fehbg &
xsetroot -solid '#0D3642'

# grabbing keys
#xbindkeys &

# open terminal
#uxterm &

# hello msg
#on-online-runner && say-greatwords --notify &

# start dwm + conky + dzenbar with logging (see dwm.log, default at $HOME)
dzenbar &
startconky &
#DWM_LOG_PATH="$HOME/dwm.log" startdwm
startdwm

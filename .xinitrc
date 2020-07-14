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

# notification daemon
dunst &

# enable numlock
numlockx on &

# fix java bug
wmname LG3D &

# set background image
sh ~/.fehbg &

# grabbing keys
xbindkeys &

# open terminal
uxterm &

# hello msg
greatwords-notify-send &

# start dwm + conky + dzenbar with logging (see dwm.log)
dzenbar &
startconky &
startdwm

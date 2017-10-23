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

# enable numlock
numlockx on &

# fix java bug
wmname LG3D &

# set background image
sh ~/.fehbg &

# open terminal
uxterm &

# start dwm + dzenbar
~/git/dzenbar/dzenbar &
~/git/dwm/bin/startdwm

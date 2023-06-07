#!/system/bin/sh

# for android only

# adb shell
# sh /sdcard/termux.sh

su $(stat -c %u /data/data/com.termux) -c /data/data/com.termux/files/home/bin/termux-shell.sh

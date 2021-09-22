#!/usr/bin/env bash

# ./rofi-fb-screenshots.sh
# ls and open selected file
# author: @qbbr

OPEN_CMD="feh -F --draw-exif --draw-filename --draw-tinted --no-menu --start-at "
SCREENSHOTS_DIR=~/git/tray-screenshot-tools/screenshots

if [[ -n "$@" ]]; then
	SCREENSHOT="${SCREENSHOTS_DIR}/$@"
	if [[ -f "${SCREENSHOT}" ]]; then
		coproc ( ${OPEN_CMD} "${SCREENSHOT}" & > /dev/null 2>&1 )
		exit 0
	fi
fi

ls --group-directories-first --indicator-style=slash --color=never --reverse ${SCREENSHOTS_DIR}

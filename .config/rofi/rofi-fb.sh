#!/usr/bin/env bash

# ./rofi-fb.sh
# simple file browser \w state last dir
# author: @qbbr

OPEN_CMD=xdg-open
CUR_DIR=$PWD
STATE_LAST_DIR_FILE=/tmp/.rofi-fb-state-file.cache

if [[ -f "${STATE_LAST_DIR_FILE}" ]]; then
	CUR_DIR=$(cat "${STATE_LAST_DIR_FILE}")
fi

if [[ -n "$@" ]]; then
	CUR_DIR="${CUR_DIR}/$@"
	if [[ -d "${CUR_DIR}" ]]; then
		echo "${CUR_DIR}" > "${STATE_LAST_DIR_FILE}"
	elif [[ -f "${CUR_DIR}" ]]; then
		coproc ( ${OPEN_CMD} "${CUR_DIR}" &> /dev/null 2>&1 )
		exit 0
	fi
fi

pushd "${CUR_DIR}" > /dev/null
echo ".."
ls --group-directories-first --indicator-style=slash --color=never

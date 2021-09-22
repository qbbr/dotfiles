#!/usr/bin/env bash

# ./rofi-tmux-manager.sh
# simple tmux session manager
# author: @qbbr

if [[ x"$@" = x"[kill all]" ]]; then
	coproc ( tmux kill-server )
	exit 0
fi

if [[ ! -z "$@" ]]; then
	coproc ( rofi-sensible-terminal -e "tmux new-session -A -s '$@'" )
	exit 0
fi

tmux list-session -F '#S'

echo "[kill all]"

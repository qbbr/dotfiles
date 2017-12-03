#!/usr/bin/env bash

# sudo apt install xttitle
update_xttitle() {
	if [ "$TERM" == "xterm" ] || [ "$TERM" == "xterm-256color" ]; then
		command -v xttitle > /dev/null 2>&1 && xttitle "$$ [${USER}@${HOSTNAME}] $PWD"
	fi
}

# hello msg
echo -e "${_c_bold}PID:${_c_reset}  ${_c_yellow}$$${_c_reset}"
echo -e "${_c_bold}DATE:${_c_reset} ${_c_cyan}$(date)${_c_reset}"
echo -e "${_c_bold}HOME:${_c_reset} ${_c_green}${HOME}${_c_reset}"
echo -e "${_c_bold}SYS:${_c_reset}  ${_c_blue}$(uname -norm)${_c_reset}"
IPs=$(hostname --all-ip-addresses)
if [ -n "$IPS" ]; then
	IPs=$(echo -e ${IPS} | sed "s/ /$(echo -e ${_c_reset}), $(echo -e ${_c_light_red})/g") # separator color fix
	echo -e "${_c_bold}IPs:${_c_reset}  ${_c_light_red}${IPS}${_c_reset}"
fi
echo

update_xttitle

# BUG: cd to dirname with "$$"
cd() {
	builtin cd $*
	update_xttitle
}

f() {
	setsid uxterm &> /dev/null
}

start() {
	sudo /etc/init.d/$1 start
}

stop() {
	sudo /etc/init.d/$1 stop
}

restart() {
	sudo /etc/init.d/$1 restart
}

status() {
	sudo /etc/init.d/$1 status
}

extract() {
	if [ -z $1 ]; then
		# if no parameters given display usage
		echo "Usage: extract <filename>.<tar.bz2|tar.gz|tar.xz|lzma|bz2|rar|gz|tar|tbz2|tgz|zip|Z|7z|xz>"
	else
		if [ -f "$1" ]; then
			case $1 in
				*.tar.bz2) tar xvjf $1   ;;
				*.tar.gz)  tar xvzf $1   ;;
				*.tar.xz)  tar xvJf $1   ;;
				*.lzma)    unlzma $1     ;;
				*.bz2)     bunzip2 $1    ;;
				*.rar)     unrar x $1    ;;
				*.gz)      gunzip $1     ;;
				*.tar)     tar xvf $1    ;;
				*.tbz2)    tar xvjf $1   ;;
				*.tgz)     tar xvzf $1   ;;
				*.zip)     unzip $1      ;;
				*.Z)       uncompress $1 ;;
				*.7z)      7z x $1       ;;
				*.xz)      unxz $1       ;;
				*)         echo "[E] File extension is not supported!" ;;
			esac
		else
			echo "[E] File \"$1\" not found!"
		fi
	fi
}

# simple notes
# sudo apt install tree pandoc
NOTES_DIR="${NOTES_DIR:-$HOME/.notes/}"

n() {
	if [ -n "$*" ]; then
		FILE_NAME="$*"
	else
		FILE_NAME="default"
	fi
	$EDITOR "$NOTES_DIR$FILE_NAME.markdown"
}

nrm() {
	rm -i "$NOTES_DIR$1.markdown"
}

nls() {
	tree -CR --noreport $NOTES_DIR | awk '{ if ((NR > 1) gsub(/.markdown/,"")); if (NF==1) print $1; else if (NF==2) print $2; else if (NF==3) printf "  %s\n", $3 }'
}

nprint() {
	if [ -n "$*" ]; then
		FILE_NAME="$*"
		${NOTES_PRINT_CMD:-cat} "$NOTES_DIR$FILE_NAME.markdown"
	else
		echo "[E] filename is not determined!"
	fi
}

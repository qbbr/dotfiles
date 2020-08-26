#!/usr/bin/env bash

hello_msg() {
	# depends: debianutils
	echo -e "$(tput bold)PID:$(tput sgr0)  $(tput setaf 3)$$$(tput sgr0)"
	echo -e "$(tput bold)DATE:$(tput sgr0) $(tput setaf 6)$(date)$(tput sgr0)"
	echo -e "$(tput bold)HOME:$(tput sgr0) $(tput setaf 2)${HOME}$(tput sgr0)"
	echo -e "$(tput bold)SYS:$(tput sgr0)  $(tput setaf 4)$(uname -norm)$(tput sgr0)"
	local ips=$(hostname --all-ip-addresses)

	if [[ -n "${ips}" ]]; then
		ips=$(echo -e ${ips} | sed "s/ /$(echo -e $(tput sgr0)), $(echo -e $(tput setaf 9))/g") # separator color fix
		echo -e "$(tput bold)IPs:$(tput sgr0)  $(tput setaf 9)${ips}$(tput sgr0)"
	fi

	if [[ -n "${SSH_CLIENT}" ]]; then
		echo -e "${_c_bold}SSH:${_c_reset}  ${_c_bold_light_green}${SSH_CLIENT}${_c_reset}"
	fi
}

if [[ -n "${SHOW_HELLO_MSG}" ]]; then
	hello_msg
fi

# depsnds: xttitle
update_xttitle() {
	xttitle "$$ [${USER}@${HOSTNAME}] ${PWD}" 2> /dev/null
}

if [[ "${TERM}" == "xterm" || "${TERM}" == "xterm-256color" ]] && command -v xttitle > /dev/null; then
	update_xttitle

	cd() {
		builtin cd "$@"
		update_xttitle
	}
fi

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

apt-history() {
	case "$1" in
		install)
			cat /var/log/dpkg.log | grep 'install '
			;;
		upgrade|remove)
			cat /var/log/dpkg.log | grep $1
			;;
		rollback)
			cat /var/log/dpkg.log | grep upgrade | \
				grep "$2" -A10000000 | \
				grep "$3" -B10000000 | \
				awk '{print $4"="$5}'
			;;
		*)
			cat /var/log/dpkg.log
			;;
	esac
}

extract() {
	if [[ -z $1 ]]; then
		# if no parameters given display usage
		echo "Usage: extract <filename>.<tar.bz2|tar.gz|tar.xz|lzma|bz2|rar|gz|tar|tbz2|tgz|zip|Z|7z|xz>"
	else
		if [[ -f "$1" ]]; then
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

# swap 2 files
swap() {
	local tmp_file="tmp_file.$$"
	mv "$1" "${tmp_file}"
	mv "$2" "$1"
	mv "${tmp_file}" "$2"
}

# simple notes
# depends: tree
NOTES_DIR="${NOTES_DIR:-$HOME/.notes/}"

ngetfilepath() {
	local file_name="default"

	if [[ -n "$*" ]]; then
		file_name="$*"
	fi

	echo "${NOTES_DIR}${file_name}.markdown"
}

n() {
	$EDITOR $(ngetfilepath $*)
}

nrm() {
	rm -i $(ngetfilepath $*)
}

nls() {
	tree -CR --noreport ${NOTES_DIR} | awk '{ if ((NR > 1) gsub(/.markdown/,"")); if (NF==1) print $1; else if (NF==2) print $2; else if (NF==3) printf "  %s\n", $3 }'
}

nprint() {
	${NOTES_PRINT_CMD:-pandoc -t plain} $(ngetfilepath $*)
}

alias np='nprint'

ncat() {
	cat $(ngetfilepath $*)
}

tailf-monolog() {
	if [[ -z "$1" ]]; then
		echo "Please specify a monolog file for monitoring"
		return
	fi

	tail -f $1 | awk '
		{matched=0}
		/INFO:/    {matched=1; print "\033[0;37m" $0 "\033[0m"} # white
		/NOTICE:/  {matched=1; print "\033[0;36m" $0 "\033[0m"} # cyan
		/WARNING:/ {matched=1; print "\033[0;34m" $0 "\033[0m"} # blue
		/ERROR:/   {matched=1; print "\033[0;31m" $0 "\033[0m"} # red
		/ALERT:/   {matched=1; print "\033[0;35m" $0 "\033[0m"} # purple
		matched==0            {print "\033[0;33m" $0 "\033[0m"} # yellow
	'
}

function getcertnames() {
	if [[ -z "${1}" ]]; then
		echo "ERROR: No domain specified.";
		return 1;
	fi;

	local domain="${1}";
	echo "Testing ${domain}...";
	echo "";

	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" | openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
		local certText=$(echo "${tmp}" | openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, no_serial, no_sigdump, no_signame, no_validity, no_version");
		echo "Common Name:";
		echo "";
		echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
		echo "";
		echo "Subject Alternative Name(s):";
		echo "";
		echo "${certText}" | grep -A 1 "Subject Alternative Name:" | sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
		return 0;
	else
		echo "ERROR: Certificate not found.";
		return 1;
	fi;
}

function lesstree() {
	tree -aC -I '.git|node_modules|bower_components|vendor|.idea' --dirsfirst "$@" | less -FRNX;
}

function dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

function decode-url() {
	echo $1 | python3 -c "import sys, urllib.parse as p; print(''); print(p.unquote(sys.stdin.read()));"
}

function decode-base64 {
	#echo $1 | python3 -c "import sys, base64; print(base64.b64decode(sys.stdin.read()));";
	echo $1 | base64 -d $1
}

function decode-imap-folder-name {
	# for i in *; do echo -n "$i == "; decode-imap-folder-name $i; done
	echo $1 | tr '&' '+' | tr ',' '/' | iconv -f UTF-7 -t UTF-8
}

function youtube-dl-sst() {
	# depends: youtube-dl, ffmpeg
	# args:
	# * 1 - url
	# * 2 - start time [hh:mm:ss]
	# * 3 - duration (not end time!) [hh:mm:ss]
	# * 4 - format (default: best. mb buggy, then use manual youtube-dl -F <url>)
	local format=${4:-best}
	local url=$(youtube-dl --get-url --format $format "$1")
	local filename=$(youtube-dl --get-filename --format $format "$1")
	echo $format
	ffmpeg -ss $2 -i "$url" -t $3 -c copy "$filename" && echo "[Done]. File: $PWD/$filename"
}

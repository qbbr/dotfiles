#!/bin/bash

start() {
	sudo /etc/init.d/$1 start
}

stop() {
	sudo /etc/init.d/$1 stop
}

restart() {
	sudo /etc/init.d/$1 restart
}

extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) tar xvjf $1   ;;
			*.tar.gz)  tar xvzf $1   ;;
			*.bz2)     bunzip2 $1    ;;
			*.rar)     unrar x $1    ;;
			*.gz)      gunzip $1     ;;
			*.tar)     tar xvf $1    ;;
			*.tbz2)    tar xvjf $1   ;;
			*.tgz)     tar xvzf $1   ;;
			*.zip)     unzip $1      ;;
			*.Z)       uncompress $1 ;;
			*.7z)      7z x $1       ;;
			*)         echo "'$1' cannot be extracted via >extract<" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# simple notes
# sudo aptitude install tree
NOTES_DIR="$HOME/Dropbox/.notes/"

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

nls () {
	tree -CR --noreport $NOTES_DIR | awk '{ if ((NR > 1) gsub(/.markdown/,"")); if (NF==1) print $1; else if (NF==2) print $2; else if (NF==3) printf "  %s\n", $3 }'
}

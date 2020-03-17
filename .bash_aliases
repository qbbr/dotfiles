#!/usr/bin/env bash

alias q="exit"
alias qq="exit"
alias c="clear"
alias cc="clear"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias putclip="xclip"
alias getclip="xclip -o"

if [ -x /usr/bin/dircolors ]; then
	alias l="ls -lAF --color --group-directories-first | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
	alias ll="l"
	alias ls="ls --color=auto"
	alias dir="dir --color=auto"
	alias vdir="vdir --color=auto"

	export GREP_COLOR="1;33"
	alias grep="grep --color=auto"
	alias fgrep="fgrep --color=auto"
	alias egrep="egrep --color=auto"
	alias diff="diff --color=auto"
fi

alias rm="rm -i"
alias crontab="crontab -i"
alias pong="ping -c 3 www.google.com"

alias tree="tree -Csuh"
alias df="df -Th"
alias feh="feh --title '%P [%u / %l] [%wx%h] %n (%s bytes)'"
alias scrot-me="scrot '%d.%m.%Y_%H%M%S__$wx$h.png' -e 'mv $f /media/strg1/screenshots/'"

alias python="python3"
alias pip="pip3"

# apt install source-highlight
#export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
# apt install highlight
export LESSOPEN="| $(which highlight) %s --out-format xterm256 --line-numbers --quiet --style solarized-dark"
export LESS=" -R "
alias less="less -m -N -g -i -J --line-numbers --underline-special"
alias more="less"
alias hilite="highlight $1 --out-format xterm256 --line-numbers --quiet --force --style solarized-dark"

alias web-server-dir-php="xdg-open http://127.0.0.1:8666/; php -S 127.0.0.1:8666"
alias web-server-dir-python="xdg-open http://127.0.0.1:8666/; python -m http.server 8666"
alias web-server-dir-python2="xdg-open http://127.0.0.1:8666/; python2 -m SimpleHTTPServer 8666"
#alias web-server-dir-ruby="xdg-open http://127.0.0.1:8666/; ruby -r webrick -e 'WEBrick::HTTPServer.new(:Port => 8666, :DocumentRoot => Dir.pwd).start'"
alias web-server-dir-ruby="xdg-open http://127.0.0.1:8666/; ruby -run -e httpd . -p 8666" # ruby 1.9+:
alias web-server-dir-busybox="xdg-open http://127.0.0.1:8666/; busybox httpd -f -p 8666"
alias web-server-dir="web-server-dir-php" # default web-server

alias docker-compose='TMPDIR=/var/tmp/ docker-compose'
alias docker-compose-renew='docker-compose up --force-recreate --renew-anon-volumes'
alias start-docker='sudo systemctl start docker.socket; sudo systemctl start docker.service'
alias stop-docker='sudo systemctl stop docker.service; sudo systemctl stop docker.socket'

alias mpv-youtube-1080p="mpv --ytdl-format='bestvideo[height<=1080]+bestaudio/best[height<=1080]'"
alias mpv-youtube-720p="mpv --ytdl-format='bestvideo[height<=?720][fps<=?30][vcodec!=?vp9]+bestaudio/best'"
alias mpv-youtube-480p="mpv --ytdl-format='bestvideo[height<=480]+bestaudio/best[height<=480]'"

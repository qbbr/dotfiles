#!/usr/bin/env bash

# for !vimshell
shopt -s expand_aliases

alias q="exit"
alias qq="exit"
alias :q="exit"
alias c="clear"
alias cc="clear"
alias cfc="clear-fucking-cache"
alias h="history"
alias hh="history"

alias bb="sudo shutdown -h now"
alias reboot="sudo reboot"

alias fdisk="sudo fdisk"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias e="editor"

alias putclip="xclip"
alias getclip="xclip -o"

# replaced by l() fn
#alias l="ls -lAF --color=always --group-directories-first | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
alias ls="ls --color=auto --group-directories-first"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

alias grep="grep --color=auto"
alias g="grep -i"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias diff="diff --color=auto"

alias ip="ip --color=auto"

alias crontab="crontab -i"

test -f /proc/net/if_inet6 || alias ping="ping -4"
alias pong="ping -c 3 www.google.com"

alias dmesg="dmesg -Tw"
alias m="more"

alias psg="ps aux | grep -v grep | grep -i -e RSS -e"
alias iostat="iostat -m -h 1 2" # -y

alias tree="tree -Csuh"
alias t="tree"
# replaced by _df() fn
#alias df="df -Th --total"

alias feh="feh --title '%P [%u / %l] [%wx%h] %n (%s bytes)' --draw-exif --draw-tinted"
alias scrot-me="scrot '%d.%m.%Y_%H%M%S__\$wx\$h.png' -e 'mv \$f /media/strg1/screenshots/'"

# save pwd on exit (F10 only)
#alias mc=". /usr/share/mc/bin/mc-wrapper.sh"

alias ssh="ssh -o VisualHostKey=yes"

alias mutt="neomutt"
alias lynx="lynx -accept_all_cookies"

#alias python="python3"
#alias pip="pip3"
alias ptp="ptpython"

#alias phantomjs="OPENSSL_CONF=/etc/ssl/ phantomjs"

# apt install source-highlight
#export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
# apt install highlight
#export LESSOPEN="| $(which highlight) %s --out-format xterm256 --line-numbers --quiet --style solarized-dark"
export LESS=" -R "
#alias less="less -m -N -g -i -J --line-numbers --underline-special"
alias more="less"
#alias hilite="highlight $1 --out-format xterm256 --line-numbers --quiet --force --style solarized-dark"

# static web servers
alias web-server-dir-php="php -S 127.0.0.1:8666"
alias web-server-dir-python2="python2 -m SimpleHTTPServer 8666"
alias web-server-dir-python="python3 -m http.server 8666"
alias web-server-dir-ruby="ruby -run -e httpd . -p 8666" # ruby 1.9+:
alias web-server-dir-ruby-webrick="ruby -r webrick -e 'WEBrick::HTTPServer.new(:Port => 8666, :DocumentRoot => Dir.pwd).start'"
alias web-server-dir-busybox="busybox -v httpd -f -p 8666"
alias web-server-dir-webfs="webfsd -d -F -p 8666 -f index.html"
alias web-server-dir-perl-mojolicious="perl -MMojolicious::Lite -MCwd -e 'app->static->paths->[0]=getcwd; app->start' daemon -l http://127.0.0.1:8666"
alias web-server-dir="web-server-dir-php" # default web-server
alias web-server-open-browser="x-www-browser http://127.0.0.1:8666/"

# sudo curl -L https://raw.githubusercontent.com/docker/compose/1.29.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
#alias docker-compose='TMPDIR=/var/tmp/ docker-compose'
alias docker-compose-renew='docker-compose up --force-recreate --renew-anon-volumes'
alias start-docker='sudo systemctl start docker.socket docker.service'
alias stop-docker='sudo systemctl stop docker.service docker.socket containerd.service'

alias start-libvirt='sudo systemctl start libvirtd.service'
alias stop-libvirt='sudo systemctl stop libvirtd.service libvirtd-ro.socket libvirtd-admin.socket libvirtd.socket'

alias mpvm="mpv --mute=yes"
alias mpv-youtube-1080p="mpv --ytdl-format='bestvideo[height<=1080]+bestaudio/best[height<=1080]'"
alias mpv-youtube-720p="mpv --ytdl-format='bestvideo[height<=?720][fps<=?30][vcodec!=?vp9]+bestaudio/best'"
alias mpv-youtube-480p="mpv --ytdl-format='bestvideo[height<=480]+bestaudio/best[height<=480]'"
alias youtube-dl-mp3="youtube-dl --extract-audio --audio-format mp3"

# php
alias set-php-version="sudo update-alternatives --config php"
alias php-cs-fixer-diff="PHP_CS_FIXER_FUTURE_MODE=1 php-cs-fixer fix -v --rules=@Symfony --using-cache=no --diff --dry-run"
alias php-cs-fixer-fix="PHP_CS_FIXER_FUTURE_MODE=1 php-cs-fixer fix -v --rules=@Symfony --using-cache=no --diff"

# cygwin aliases
#if [[ "$(uname -s)" == "CYGWIN"* ]]; then
#	alias composer="composer.bat"
#	alias ncu-win="ncu --loglevel verbose --packageFile package.json"
#fi

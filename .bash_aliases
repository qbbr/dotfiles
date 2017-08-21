#!/bin/bash

alias q="exit"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias putclip="xclip"
alias getclip="xclip -o"

if [ -x /usr/bin/dircolors ]; then
	alias l="ls -lAF --color --group-directories-first | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
	alias ls="ls --color=auto"
	alias dir="dir --color=auto"
	alias vdir="vdir --color=auto"

	export GREP_COLOR="1;33"
	alias grep="grep --color=auto"
	alias fgrep="fgrep --color=auto"
	alias egrep="egrep --color=auto"
fi

alias rm="rm -i"
alias crontab="crontab -i"
alias pong="ping -c 3 www.google.com"

alias tree="tree -Csuh"
alias df="df -Th"
alias feh="feh --title '%P [%u / %l] [%wx%h] %n (%s bytes)'"

alias mc="mc --skin=$HOME/.config/mc/default.ini"

alias python="python3"

# apt install source-highlight
#export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
# apt install highlight
export LESSOPEN="| $(which highlight) %s --out-format xterm256 --line-numbers --quiet --style solarized-dark"
export LESS=" -R "
alias less="less -m -N -g -i -J --line-numbers --underline-special"
alias more="less"

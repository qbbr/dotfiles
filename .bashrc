# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# bash options
shopt -s checkwinsize   # update the value of LINES and COLUMNS after each command if altered

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# set history variables
HISTSIZE=1000
HISTFILESIZE=1000
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoredups
# share history across all terminals
PROMPT_COMMAND="history -a"
# append to the history file, don't overwrite it
shopt -s histappend

# set vim as default editor
export EDITOR=vim

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "$TERM" = "linux" ]; then
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
else
	if [ "$USER" == "root" ]; then
		user_color="31m"
	else
		user_color="36m"
	fi

	PS1="┌─[\[\e[44m\]\h\e[0m\]:\e[${user_color}\]\u\[\e[0m\]]\e[34m\](\t)\e[0m\][\[\e[32m\]\w\[\e[0m\]]\n└─~ "
	unset user_color

	# colour coreutils
	eval $(dircolors -b $HOME/.dircolors)
fi

export DROPBOX_DIR=/media/strg1/Dropbox

# ~/.bash_functions
if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

# ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

#export JAVA_HOME=/usr/java/jre1.7.0_25
#export PATH=${PATH}:${JAVA_HOME}/bin

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
	PS1='${debian_chroot:+($debian_chroot)}\u@\H:\w\$ '
else
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true

	__get_ps1_user () {
		local user_color

		if [ "$USER" == "root" ]; then
			user_color="\e[31m"
		else
			user_color="\e[36m"
		fi

		echo -e "$user_color$USER\e[0m"
	}

	PS1='┌─[$(__get_ps1_user)\[\e[32m\]@\[\e[0m\[\e[33m\]\H\[\e[0m\]]\[\e[34m\](\t)\[\e[0m\][\[\e[33m\]\w\[\e[0m\]]$(declare -F __git_ps1 &>/dev/null && __git_ps1 " \[\e[35m\]{%s}\[\e[0m\]")\n└─~ '
	unset user_color

	# colour coreutils
	eval $(dircolors -b $HOME/.dircolors)
fi

# ~/.bash_variables
if [ -f ~/.bash_variables ]; then
	. ~/.bash_variables
fi

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

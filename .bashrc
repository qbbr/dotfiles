# ~/.bashrc: executed by bash(1) for non-login shells.

# if not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# if set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar
# disable completion when the input buffer is empty.  i.e. hitting tab
# and waiting a long time for bash to expand all of $PATH.
shopt -s no_empty_cmd_completion
# append to the history file, don't overwrite it
shopt -s histappend

# ~/.bash_variables
if [[ -f ~/.bash_variables ]]; then
	. ~/.bash_variables
fi

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [[ -z "${debian_chroot:-}" ]] && [[ -r /etc/debian_chroot ]]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

if [[ -z "${FORCE_COLOR_PS1}" ]] && [[ "${TERM}" == "linux" ]]; then
	PS1='${debian_chroot:+($debian_chroot)}\u@\H:\w\$ '
else
	set_prompt() {
		local last_command=$?
		local reset='\[\e[0m\]'
		#local black='\[\e[0;30m\]'
		local red='\[\e[0;31m\]'
		local green='\[\e[0;32m\]'
		local yellow='\[\e[0;33m\]'
		local blue='\[\e[0;34m\]'
		local magenta='\[\e[0;35m\]'
		local cyan='\[\e[0;36m\]'
		local white='\[\e[0;37m\]'
		#local bblack='\[\e[1;30m\]'
		#local bred='\[\e[1;31m\]'
		#local bgreen='\[\e[1;32m\]'
		#local byellow='\[\e[1;33m\]'
		local bblue='\[\e[1;34m\]'
		#local bmagenta='\[\e[1;35m\]'
		#local bcyan='\[\e[1;36m\]'
		#local bwhite='\[\e[1;37m\]'
		#local crossIcon='\342\234\227'
		#local checkmarkIcon='\342\234\223'

		# line one
		PS1="\n┌─["
		# user@host
		if [[ $EUID == 0 ]]; then
			PS1+="${red}\\u${green}@${blue}\\h${reset}"
		else
			PS1+="${yellow}\\u${green}@${blue}\\h${reset}"
		fi
		# datetime
		PS1+="](${cyan}\\t${reset})"
		# work dir
		PS1+="[${bblue}\\w${reset}] "
		# git
		if [[ -n "$(command -v __git_ps1)" ]]; then
			local fstype="$(df --output=fstype . | tail -n +2)"
			if [[ "${fstype}" != *"fuse.sshfs"* ]]; then
				GIT_PS1_SHOWDIRTYSTATE=true
				GIT_PS1_SHOWUNTRACKEDFILES=true
				PS1+=$(__git_ps1 "${magenta}{%s}${reset}")
			fi
		fi
		# line two
		PS1+="\n└─"
		# exit code
		if [[ $last_command != 0 ]]; then
			PS1+="[${red}\$?${reset}]─"
		fi
		# ssh
		if [[ -n "${SSH_CLIENT}" ]]; then
			PS1+="(${green}SSH${reset})-"
		fi
		# chroot
		if [[ -n "${debian_chroot}" ]]; then
			PS1+="(${white}${debian_chroot}${reset})-"
		fi
		# venv
		if [[ -n "$VIRTUAL_ENV" ]]; then
			PS1+="(${white}${VIRTUAL_ENV##*/}${reset})─"
			VIRTUAL_ENV_DISABLE_PROMPT=1
		fi
		# $ for user, # for root
		PS1+="${white}\\\$${reset} "
	}

	if [[ -n "${PROMPT_COMMAND}" ]]; then
		PROMPT_COMMAND="set_prompt; ${PROMPT_COMMAND}"
	else
		PROMPT_COMMAND="set_prompt"
	fi

	# colour coreutils
	eval $(dircolors -b $HOME/.dircolors)
fi

# ~/.bash_functions
if [[ -f ~/.bash_functions ]]; then
	. ~/.bash_functions
fi

# ~/.bash_aliases
if [[ -f ~/.bash_aliases ]]; then
	. ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
	if [[ -f /usr/share/bash-completion/bash_completion ]]; then
		. /usr/share/bash-completion/bash_completion
	elif [[ -f /etc/bash_completion ]]; then
		. /etc/bash_completion
	fi
fi

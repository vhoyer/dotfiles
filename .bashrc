# Automatically generated {{{
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac
#TERM=xterm-256color

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
# }}}
####################################
# My changes
#

# Adds a custom folder for my scripts to run anywhere
PATH+=:~/.bin

# Here are some android stuff {{{

# This are some PATHS, bcuz, y not right?
export ANDROID_HOME=/home/vhoyer/Android/sdk
export ANDROIDNDK=/home/vhoyer/Android/ndk
export ANDROIDAPI="14"  # Minimum API version your application require

PATH+=:/home/vhoyer/Android/sdk/platform-tools:/home/vhoyer/Android/sdk/tools

stty -ixon
export ANDROIDNDKVER="r10e"  # Version of the NDK you installed

#}}}

# Visual interface customization {{{
#######################
# colors
#
export cmdCOLOR="\[\e[0;38;5;208m\]"

export VHTHEME="dark"
definevhTheme() {
if [[ $VHTHEME == "dark" ]]; then
	# Dark theme {{{
	export bgcolor="\[\e[48;2;38;38;38m\]" #hex:262626
	export fgcolor="\[\e[38;1;255;215;175m\]" #hex:ffd7af normal (to make it bold :s/;1;/;2;/)
	export termcolor="$fgcolor"
	#}}}
elif [[ $VHTHEME == "light" ]]; then
	# Light theme {{{
	export bgcolor="\[\e[48;2;255;255;175m\]" #hex:ffffaf
	export fgcolor="\[\e[38;2;38;38;38m\]" #hex:262626
	export termcolor="$fgcolor"
	#}}}
fi
}
definevhTheme
# current working directory (\w) .................... - hex:87AF87
# current branch on git [if any] $(__git_ps1 "%s") .. - hex:87AFAF

######################
#Git ps1
#
git_ps () {
	if [[ "$(__git_ps1 '[%s]')" == *"*"* ]]; #if there is modification
	then
		echo -e $(__git_ps1 '[%s]');
	elif  [[ "$(__git_ps1 '[%s]')" == *"+"* ]]; #if there is an addition
	then
		echo -e $(__git_ps1 '[%s]');
	elif [[ ! "$(pwd)" =~ ^\/home\/ ]]; #if inside /home/$user
	then
		echo ;
	elif [[ "$(git rev-parse --show-toplevel)" =~ \/home\/[A-Za-z0-9]+$ ]]; #if inside /home/$user
	then
		echo ;
	else
		echo -e $(__git_ps1 '[%s]');
	fi
}
setPS() {
	export PS1="\[\e[0m\]$termcolor\u@\h:\[\e[0;38;5;2m\]\w\[\e[0;38;5;12m\]"
	if [[ ( "$(__git_ps1 "%s")" != *"command not found"* ) && ( $OSTYPE != "msys" ) ]]
	then
		export GIT_PS1_SHOWDIRTYSTATE=1
		export PS1=$PS1" $(git_ps)"
	fi
	export PS1=$PS1"\[\e[0m\]\n$fgcolor\@\$ $cmdCOLOR"
	export PS2="\[\e[0m\]$fgcolor\@> $cmdCOLOR"
}
setPS
# }}}

############################
# git related
#
shopt -s extdebug
exitWithNoGit() {
	if ! [[ $BASH_COMMAND =~ ^(exit|shutdown.*|logout) ]]; then
		return 0
	fi
	#if inside /home/$user or /$driver/root/home or /$driver/Users/$user
	if ! [[ "$(git rev-parse --show-toplevel)" =~ \/(root\/home|(home|[a-Z]\/Users)\/[a-Z0-9]+)$ ]];then
		return 0
	fi
	if ! [[ "$(__git_ps1 '[%s]')" =~ (\*|\+) ]]; then
		return 0
	fi
	#if inside /home/$user or /$driver/root/home or /$driver/Users/$user
	if [[ "$(pwd)" =~ \/(root\/home|(home|[a-Z]\/Users)\/[a-Z0-9]+)$ ]]; then
		return 0
	fi

	echo -e "\n\e[38;2;255;215;175m\e[48;2;251;66;44m[commit your shit!]\e[0m\n\n$(git st)\n"
	cd ~
	return 1
}

#envvars
export PYTHONPATH=$PYTHONPATH:$PWD

###########################
# gruvbox magic colors
#
if [ -f ~/.vim/bundle/gruvbox/gruvbox_256palette.sh ]; then
	. ~/.vim/bundle/gruvbox/gruvbox_256palette.sh
fi

##############################
# TRAP AND PROMPT_COMMAND
#
Terminal(){
	#Named 'Terminal' because it stays on the window name :p
	definevhTheme
	setPS
}
# PROMPT_COMMAND calls once after a full command is executed (this includes &&)
PROMPT_COMMAND=Terminal

#this trap command will:
#1. show in the title the current running command
#2. check if there is a STDOUT
#3. removes all attributes (color, weight, position, etc)
#4. check if there is changes in the git and do its things
# executes before each and every single command
trap 'echo -ne "\033]0;$BASH_COMMAND\007" && [[ -t 1 ]] && tput sgr0 && exitWithNoGit' DEBUG

export EDITOR=nvim

####################3333
# Auto added lines
#

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH=~/.local/bin:$PATH

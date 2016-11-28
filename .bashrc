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
TERM=xterm-256color

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
PATH+=:~/bin

# Here are some android stuff {{{

# This are some PATHS, bcuz, y not right?
export ANDROID_HOME=/home/vhoyer/Android/sdk
export ANDROIDNDK=/home/vhoyer/Android/ndk
export ANDROIDAPI="14"  # Minimum API version your application require

PATH+=:/home/vhoyer/Android/sdk/platform-tools:/home/vhoyer/Android/sdk/tools

stty -ixon
export ANDROIDNDKVER="r10e"  # Version of the NDK you installed

#}}}

#navigate to home when started at sysroot (if in git-bash)
if [[ ( "$OSTYPE" == "msys" ) && ( "$(pwd)" == "/" ) ]]; then
	cd $HOME
fi

# Visual interface customization {{{
#######################
# colors
#
export bgcolor="\[\e[48;2;38;38;38m\]" #hex:262626
export fgcolor="\[\e[38;2;255;215;175m\]" #hex:FFD7AF
export termcolor="$fgcolor"
# current working directory (\w) .................... - hex:87AF87
# current branch on git [if any] $(__git_ps1 "%s") .. - hex:87AFAF

######################
#Git ps1
#
git_ps () {
	if [[ ( $(git rev-parse --show-toplevel) =~ \/home\/[A-Za-z0-9]+$ ) && ( ( "$(__git_ps1 '[%s]')" != *"*"* ) || ( "$(__git_ps1 '[%s]')" != *"+"* ) ) ]];
	then
		echo ;
	else
		echo -e $(__git_ps1 '[%s]');
	fi
}
if [[ "$(__git_ps1 "%s")" == *"command not found"* ]]
then
	export PS1="$termcolor\u@\h:\[\e[38;2;135;175;135m\]\w\[\e[38;2;135;175;175m\]\n$fgcolor\@\$ "
else
	export GIT_PS1_SHOWDIRTYSTATE=1
	export PS1="$termcolor\u@\h:\[\e[38;2;135;175;135m\]\w\[\e[38;2;135;175;175m\] \$(git_ps)\n$fgcolor\@\$ "
fi
export PS2="$fgcolor\@> "
# }}}

# set up apache envvars - required
if [ -f /etc/apache2/envvars ]; then
	. /etc/apache2/envvars
fi

# Enable zshell startup time profiling
#zmodload zsh/zprof

# Turn off sounds
# https://blog.vghaisas.com/zsh-beep-sound/
unsetopt BEEP

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
# "smart-title" is being loaded by the "vhdot module system" system near the
# end of this file.

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf npm sudo)

[ -f ~/.local.zshrc ] && . ~/.local.zshrc
[ -f ~/.zshrc.local ] && . ~/.zshrc.local

# Load custom plugin for "vh" command (see https://github.com/vhoyer/vh-cli)
plugins+=(vh)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export PATH="$PATH:$HOME/.local/bin:$HOME/.local/bin/bin:$HOME/.local/npm/bin"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin/"

# Preferred editor with fallback to default 'vim'
if (which nvim > /dev/null 2>&1); then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

##
# ZPlug section for loading plugins
#
source ~/.zplug/init.zsh

# https://gitlab.com/raabf/gitmoji-fuzzy-hook
zplug raabf/gitmoji-fuzzy-hook, from:gitlab

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load # --verbose
#
# end of ZPlug section loading plugins
##

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias n="npm"

# interactive cd
alias rng='ranger --cmd="set show_hidden true" --choosedir=/tmp/vhcddir; cd "$(cat /tmp/vhcddir)" || exit 1'

###
# "vhdot module system"
# load every "module" that has it's name present on the module file
VHDOT_MODULE_FILE="$("$HOME/dotfiles/scripts/vhdotmodule.sh" modulefile)"
for vhdm in $(<"$VHDOT_MODULE_FILE"); do
  source "$HOME/.dotfiles/zshrc-modules/.zshrc.$vhdm"
done

###
# Auto inserted configuration
#   for configs written by automated installation processes

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/home/vhoyer/.bun/_bun" ] && source "/home/vhoyer/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/vhoyer/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# fnm
FNM_PATH="/home/vhoyer/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/vhoyer/.local/share/fnm:$PATH"
  eval "$(fnm env)"
  eval "$(fnm completions)"
fi
# fnm end

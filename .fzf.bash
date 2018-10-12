# Setup fzf
# ---------
if [[ ! "$PATH" == */home/$USER/.fzf/bin* ]]; then
  export PATH="$PATH:/home/$USER/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/$USER/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/$USER/.fzf/shell/key-bindings.bash"


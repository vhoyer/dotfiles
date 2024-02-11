source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/vimconfigs.vim
source ~/.config/nvim/autogroups.vim
source ~/.config/nvim/plugins.vim

if filereadable(expand('~/.config/nvim/local.vim'))
  source ~/.config/nvim/local.vim
endif

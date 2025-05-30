source ~/.config/nvim/ftplugin/_blocking.vim
source ~/.config/nvim/ftplugin/_stringing.vim

inoremap <buffer> >> func():<space>
inoremap <buffer> :: : ,<left>

" tab/spaces stuffs
set noexpandtab " do not transforms tabs into spaces
set shiftround " round indent to a multiple of 'shiftwidth'
set shiftwidth=4 " Number of auto-indent spaces
set softtabstop=4 " Edit as if the tabs are 4 characters wide
set tabstop=4 " the visible width of tabs
set smarttab " Enable smart-tabs respect 'tabstop', 'shiftwidth', and 'softtabstop'

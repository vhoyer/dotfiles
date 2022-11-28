source ~/.config/nvim/ftplugin/_blocking.vim
source ~/.config/nvim/ftplugin/_stringing.vim
source ~/.config/nvim/ftplugin/_jslike-keybindings.vim

setlocal foldmethod=syntax

augroup Syntax
	autocmd FileType json syntax match Comment +\/\/.*$+
	autocmd FileType json syntax match Comment +\/\*.*\*\/+
augroup END

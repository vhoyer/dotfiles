augroup Syntax
	autocmd FileType json syntax match Comment +\/\/.\+$+
	autocmd FileType json syntax match Comment +\/\*.*\*\/+
augroup END

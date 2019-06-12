if !has("autocmd") || exists("g:loaded_augroups")
	finish
endif

let g:loaded_augroups = 1

augroup TerminalStuff
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

augroup CocRelated
	autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END
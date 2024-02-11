let g:neoranger_opts='--cmd="set show_hidden true"'
let g:neoranger_viewmode='miller'
function! OpenRanger()
	try
		RangerCurrentFile
	catch
		Ranger
	endtry
endfunction
nnoremap <silent> <leader>n <esc>:call OpenRanger()<cr>

let g:neoranger_opts='--cmd="set show_hidden true"'
let g:neoranger_viewmode='miller'
function! OpenRanger()
	try
		RangerCurrentFile
	catch
		Ranger
	endtry
endfunction

if !has('win32')
	nnoremap <silent> <leader>n <esc>:call OpenRanger()<cr>
endif

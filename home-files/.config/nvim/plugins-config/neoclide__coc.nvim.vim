let g:coc_global_extensions = [
			\ 'coc-css',
			\ 'coc-dictionary',
			\ 'coc-eslint',
			\ 'coc-prettier',
			\ 'coc-highlight',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-tabnine',
			\ 'coc-tsserver',
			\ '@yaegassy/coc-volar',
			\ 'coc-vimlsp',
			\ 'coc-tailwindcss',
			\ 'coc-stylelintplus',
			\ 'coc-diagnostic',
			\]

noremap <leader>r <esc>:e!<cr>:CocRestart<cr>
nmap ,f <Plug>(coc-codeaction)

" Formatting selected code.
xmap ,=  <Plug>(coc-format-selected)
nmap ,=  <Plug>(coc-format-selected)

nmap ,d <Plug>(coc-definition)
nmap ,y <Plug>(coc-type-definition)
nmap ,i <Plug>(coc-implementation)
nmap ,r <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)

" jump list
nnoremap <silent><nowait> ,j :<C-u>CocList outline<cr>

map <silent> [e <Plug>(coc-diagnostic-prev)
map <silent> ]e <Plug>(coc-diagnostic-next)

" make <cr> confirm completion if completion is visible
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

augroup CocRelated
	autocmd!
	autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

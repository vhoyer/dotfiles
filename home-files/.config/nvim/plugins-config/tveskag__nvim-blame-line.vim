nnoremap <silent> <leader>bl :ToggleBlameLine<CR>
augroup BlameLine
	autocmd!
	autocmd BufEnter * EnableBlameLine
augroup END

augroup NvimBlameLineSyntax
	autocmd! * <buffer>
	autocmd Syntax * highlight NvimBlameLine guifg=#665c54 ctermfg=239 guibg=NONE ctermbg=NONE gui=italic cterm=italic
augroup END
" Specify the highlight group used for the virtual text ('Comment' by default)
let g:blameLineVirtualTextHighlight = 'NvimBlameLine'

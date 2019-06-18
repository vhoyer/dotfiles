let mapleader = "\<Space>"

" prevent opening of Ex mode, which I dont like :(
nnoremap Q <nop>

" esc key to jk in insert and command mode
inoremap jk <esc>
cnoremap jk <esc>

" jump to begin and end of an line in normal and visual mode
nnoremap <leader>h ^
nnoremap <leader>l $
vnoremap <leader>h ^
vnoremap <leader>l $

" save file with <leader>s
nnoremap <leader>s <esc>:w<cr>

vnoremap s :sort<cr>

"
" find replace in the same buffer
"
vnoremap R y:%s/<C-R>"/<C-R>"/gc<left><left><left>
vnoremap RR y:%s/<C-R>"//gc<left><left><left>

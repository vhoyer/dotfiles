let mapleader = "\<Space>"

nnoremap Q <nop>

inoremap jk <esc>
cnoremap jk <esc>

nnoremap <space>h ^
nnoremap <space>l $
vnoremap <space>h ^
vnoremap <space>l $

nnoremap <space>s <esc>:w<cr>

vnoremap s :sort<cr>

" find replace in the same buffer
vnoremap R y:%s/<C-R>"/<C-R>"/gc<left><left><left>
vnoremap RR y:%s/<C-R>"//gc<left><left><left>

call plug#begin()

Plug 'vhoyer/neoranger'
Plug 'morhetz/gruvbox'

call plug#end()

" Plug 'vhoyer/neoranger'
let g:neoranger_opts='--cmd="set show_hidden true"'
let g:neoranger_viewmode='miller'
nnoremap <space>n <esc>:RangerCurrentFile<cr>

" Plug 'morhetz/gruvbox'
colorscheme gruvbox
let g:gruvbox_italic=1

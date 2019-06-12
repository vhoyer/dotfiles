call plug#begin()

Plug 'Lokaltog/neoranger'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

" Plug 'Lokaltog/neoranger'
let g:neoranger_opts='--cmd="set show_hidden true"'
let g:neoranger_viewmode='miller'
nnoremap <space>n <esc>:RangerCurrentFile<cr>

" Plug 'morhetz/gruvbox'
colorscheme gruvbox
let g:gruvbox_italic=1

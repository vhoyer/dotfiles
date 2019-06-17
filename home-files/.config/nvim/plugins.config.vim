"
" Plug 'Lokaltog/neoranger'
"
let g:neoranger_opts='--cmd="set show_hidden true"'
let g:neoranger_viewmode='miller'
nnoremap <leader>n <esc>:RangerCurrentFile<cr>

"
" Plug 'morhetz/gruvbox'
"
let g:gruvbox_italic=1

colorscheme gruvbox

"
" Plug 'neoclide/coc.nvim'
"
" CocInstall coc-css
" CocInstall coc-emmet
" CocInstall coc-highlight
" CocInstall coc-html
" CocInstall coc-json
" CocInstall coc-tsserver
" CocInstall coc-vetur
" CocInstall coc-eslint
" CocInstall coc-tslint

"
" Plug 'airblade/vim-gitgutter'
"
let g:gitgutter_max_signs = 1000

"
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
"
let $FZF_DEFAULT_COMMAND="rg --hidden -g '!.git' -l \"\""
nnoremap <leader>p <esc>:Files<cr>

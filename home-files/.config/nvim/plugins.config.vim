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
nnoremap <f3> <esc>:Rg<cr>
nnoremap <leader>fh <esc>:Helptags<cr>
nnoremap <leader>fl <esc>:BCommits<cr>
nnoremap <leader>fn <esc>:Buffers<cr>
nnoremap <leader>p <esc>:Files<cr>
" :Files [PATH]   " Files (similar to :FZF)
" :GFiles [OPTS]  " Git files (git ls-files)
" :GFiles?        " Git files (git status)
" :Buffers        " Open buffers
" :Colors         " Color schemes
" :Ag [PATTERN]   " ag search result (ALT-A to select all, ALT-D to deselect all)
" :Rg [PATTERN]   " rg search result (ALT-A to select all, ALT-D to deselect all)
" :Lines [QUERY]  " Lines in loaded buffers
" :BLines [QUERY] " Lines in the current buffer
" :Tags [QUERY]   " Tags in the project (ctags -R)
" :BTags [QUERY]  " Tags in the current buffer
" :Marks          " Marks
" :Windows        " Windows
" :Locate PATTERN " locate command output
" :History        " v:oldfiles and open buffers
" :History:       " Command history
" :History/       " Search history
" :Snippets       " Snippets (UltiSnips)
" :Commits        " Git commits (requires fugitive.vim)
" :BCommits       " Git commits for the current buffer
" :Commands       " Commands
" :Maps           " Normal mode mappings
" :Helptags       " Help tags 1
" :Filetypes      " File types

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
" make FZF see hidden lines in :Files<cr>
let $FZF_DEFAULT_COMMAND="rg --hidden -g '!.git' -l \"\""

" bind ctrl-a to select all lines in fzf
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" method to add lines to quickfix window
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" add ctrl-q to open selected files to quickfix window
let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" make :Rg<cr> see hidden files, cuz duh, why this is not default?
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --hidden --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, <bang>0)

nnoremap <f3> <esc>:Rg<cr>
nnoremap <leader>fl <esc>:BCommits<cr>
nnoremap <leader>fn <esc>:Buffers<cr>
nnoremap <leader>fp <esc>:Files<cr>
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

"
" stefandtw/quickfix-reflector.vim
"
" let g:qf_modifiable = 1 "If 1, automatically sets quickfix buffers 'modifiable'. Default: 1
let g:qf_join_changes = 1 "If 1, changes in a buffer will be joined, to allow unding it all at once. Default: 0
" let g:qf_write_changes = 1 "If 1, will write the files, if 0 will only change the buffer without saving the file. Default: 1

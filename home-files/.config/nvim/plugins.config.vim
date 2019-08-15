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
" packages:
" CocInstall coc-css
" CocInstall coc-highlight
" CocInstall coc-html
" CocInstall coc-json
" CocInstall coc-tsserver
" CocInstall coc-vetur
" CocInstall coc-eslint
" CocInstall coc-tslint
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

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

" make :Rg<cr> see hidden files, cuz duh, why this is not default?
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --hidden --no-heading -g '!.git/*' --color=always --smart-case ".shellescape(<q-args>), 1, <bang>0)

nnoremap <f3> <esc>:Rg<cr>
nnoremap <c-f> <esc>:BLines<cr>
nnoremap <c-h> <esc>:Helptags<cr>
nnoremap <leader>fb <esc>:Buffers<cr>
nnoremap <leader>fl <esc>:BCommits<cr>
nnoremap <leader>fp <esc>:Files<cr>
nnoremap <leader>fw <esc>:Windows<cr>
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

"
" Plug 'mattn/emmet-vim'
"
let g:user_emmet_leader_key = '<C-e>'
let g:user_emmet_expandabbr_key = '<C-e>e'
let g:user_emmet_expandword_key = '<C-e>;'
let g:user_emmet_update_tag = '<C-e>u'
let g:user_emmet_balancetaginward_key = '<C-e>d'
let g:user_emmet_balancetagoutward_key = '<C-e>D'
let g:user_emmet_next_key = '<C-e>n'
let g:user_emmet_prev_key = '<C-e>N'
let g:user_emmet_imagesize_key = '<C-e>i'
let g:user_emmet_togglecomment_key = '<C-e>/'
let g:user_emmet_splitjointag_key = '<C-e>j'
let g:user_emmet_removetag_key = '<C-e>k'
let g:user_emmet_anchorizeurl_key = '<C-e>a'
let g:user_emmet_anchorizesummary_key = '<C-e>A'
let g:user_emmet_mergelines_key = '<C-e>m'
let g:user_emmet_codepretty_key = '<C-e>c'

"
" Plug 'posva/vim-vue'
"
let g:vue_disable_pre_processors=1

"
" Plug 'tpope/vim-fugitive'
"
nnoremap <leader>b <esc>:Gblame<cr>
nnoremap <leader>c <esc>:Gcommit<cr>
vnoremap <c-f> "yy:Ggrep "<C-r>y"<cr><Esc>:copen<cr>

" open diff
nnoremap <leader>gd :Gvdiff<CR>
" take from the left
nnoremap gdh :diffget //2<CR>
" take from the right
nnoremap gdl :diffget //3<CR>

"
" Plug 'ruanyl/vim-gh-line'
"
let g:gh_open_command = 'google-chrome '

"
" Plug 'vim-airline/vim-airline'
"
" hide "-- INSERT --" cuz the statusline already show it
set noshowmode

" Remove VCS information (branch, hunk summary) (master) and stuff
let g:airline_section_b = ''
" Remove file encoding[fileformat] (utf-8[unix]) and stuff
let g:airline_section_y = ''

" Better display filename on the tab bar at the top, cuz pair programming feels bad without it
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

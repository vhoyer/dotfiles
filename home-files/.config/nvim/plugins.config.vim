"
" Plug 'Lokaltog/neoranger'
"
let g:neoranger_opts='--cmd="set show_hidden true"'
let g:neoranger_viewmode='miller'
nnoremap <leader>n <esc>:RangerCurrentFile<cr>

"
" Plug 'morhetz/gruvbox'
"
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_italic=1

colorscheme gruvbox

"
" Plug 'neoclide/coc.nvim'
"
let g:coc_global_extensions = [
			\ 'coc-css',
			\ 'coc-dictionary',
			\ 'coc-eslint',
			\ 'coc-highlight',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-tabnine',
			\ 'coc-tsserver',
			\ 'coc-vetur',
			\ 'coc-vimlsp',
			\ 'coc-tailwindcss',
			\ 'coc-stylelintplus',
			\]

noremap <leader>r <esc>:e!<cr>:CocRestart<cr>
noremap ,f <esc>:CocFix<cr>

nmap ,d <Plug>(coc-definition)
nmap ,y <Plug>(coc-type-definition)
nmap ,i <Plug>(coc-implementation)
nmap ,r <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)

map <silent> [e <Plug>(coc-diagnostic-prev)
map <silent> ]e <Plug>(coc-diagnostic-next)

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

"
" choose from templates and apply to file
"
function! s:ReadTemplateIntoBuffer(template)
	execute '0r ~/.config/nvim/templates/'.a:template

	" Remove all trailing whitespace only line at the end of the file
	execute '%s/\($\n\s*\)\+\%$//'

	" <%\s*\(.\{-}\)\s*%>
	" TODO: Make template interpolation actually work, because now, I'm just
	" faking it :D
	execute '%s/<%\s*expand(''%:t:r'')\s*%>/'.expand('%:t:r')."/"

	" Reposition cursor at the top of the file
	normal gg
endfunction

command! -bang -nargs=* LoadTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/templates',
			\   'down': 20,
			\   'sink': function('<sid>ReadTemplateIntoBuffer')
			\ })

"
" key mappings
"
" :Files [PATH]   " Files (similar to :FZF)
nnoremap <leader>fp <esc>:Files<cr>
" :GFiles [OPTS]  " Git files (git ls-files)
" :GFiles?        " Git files (git status)
" :Buffers        " Open buffers
nnoremap <leader>fb <esc>:Buffers<cr>
" :Colors         " Color schemes
" :Ag [PATTERN]   " ag search result (ALT-A to select all, ALT-D to deselect all)
" :Rg [PATTERN]   " rg search result (ALT-A to select all, ALT-D to deselect all)
nnoremap <f3> <esc>:Rg<cr>
nnoremap <leader><f3> <esc>viw"yy:Rg <c-r>y<cr>
vnoremap <leader><f3> "yy<esc>:Rg <c-r>y<cr>
" :Lines [QUERY]  " Lines in loaded buffers
" :BLines [QUERY] " Lines in the current buffer
nnoremap <leader>ff <esc>:BLines<cr>
" :Tags [QUERY]   " Tags in the project (ctags -R)
" :BTags [QUERY]  " Tags in the current buffer
" :Marks          " Marks
" :Windows        " Windows
nnoremap <leader>fw <esc>:Windows<cr>
" :Locate PATTERN " locate command output
" :History        " v:oldfiles and open buffers
" :History:       " Command history
" :History/       " Search history
" :Snippets       " Snippets (UltiSnips)
" :Commits        " Git commits (requires fugitive.vim)
" :BCommits       " Git commits for the current buffer
nnoremap <leader>fl <esc>:BCommits<cr>
" :Commands       " Commands
nnoremap <leader>fc <esc>:Commands<cr>
" :Maps           " Normal mode mappings
" :Helptags       " Help tags 1
nnoremap <f1> <esc>:Helptags<cr>
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
let g:vue_pre_processors = 'detect_on_enter'

"
" Plug 'tpope/vim-fugitive'
"
nnoremap <leader>b <esc>:Git blame<cr>
nnoremap <leader>c <esc>:Git commit<cr>
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

" Define symbols to make the line more lean
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.paste = 'ρ'

" Normalize the word count display
let g:airline#extensions#wordcount#formatter#default#fmt = '%sw'
let g:airline#extensions#wordcount#formatter#default#fmt_short = '%sw'

" Remove VCS information (branch, hunk summary) (master) and stuff
let g:airline_section_b = ''
" Remove file encoding[fileformat] (utf-8[unix]) and stuff
let g:airline_section_y = ''

" Better display filename on the tab bar at the top, cuz pair programming feels bad without it
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Hide buffer open on the current window, cuz this information is useless :D
let g:airline#extensions#tabline#show_splits = 0

"
" Plug 'junegunn/vim-peekaboo'
"

" only show peekaboo if I clearly forgot what I was doing
let g:peekaboo_delay = 1000

"
" Plug 'tpope/vim-scriptease'
"

" Change keybinding to inspect under cursor syntax
nmap ZI <Plug>ScripteaseSynnames

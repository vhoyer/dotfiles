"
" Plug 'Lokaltog/neoranger'
"
let g:neoranger_opts='--cmd="set show_hidden true"'
let g:neoranger_viewmode='miller'
function! OpenRanger()
	try
		RangerCurrentFile
	catch
		Ranger
	endtry
endfunction
nnoremap <silent> <leader>n <esc>:call OpenRanger()<cr>

"
" Plug 'morhetz/gruvbox'
"
let g:gruvbox_contrast_light='hard'
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
			\ 'coc-prettier',
			\ 'coc-highlight',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-tabnine',
			\ 'coc-tsserver',
			\ '@yaegassy/coc-volar',
			\ 'coc-vimlsp',
			\ 'coc-tailwindcss',
			\ 'coc-stylelintplus',
			\ 'coc-diagnostic',
			\]

noremap <leader>r <esc>:e!<cr>:CocRestart<cr>
nmap ,f <Plug>(coc-fix-current)
nmap ,c <Plug>(coc-codeaction)

" Formatting selected code.
xmap ,=  <Plug>(coc-format-selected)
nmap ,=  <Plug>(coc-format-selected)

nmap ,d <Plug>(coc-definition)
nmap ,y <Plug>(coc-type-definition)
nmap ,i <Plug>(coc-implementation)
nmap ,r <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)

" jump list
nnoremap <silent><nowait> ,j :<C-u>CocList outline<cr>

map <silent> [e <Plug>(coc-diagnostic-prev)
map <silent> ]e <Plug>(coc-diagnostic-next)

" make <cr> confirm completion if completion is visible
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

augroup CocRelated
	autocmd!
	autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

"
" Plug 'sheerun/vim-polyglot'
"
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1

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

	let l:replacer_pattern = '<%=\s*\(.\{-}\)\s*%>'
	call cursor(1, 1) " position cursor at the first char
	while search(l:replacer_pattern, 'W') > 0
		let l:replacer = matchstr(getline('.'), l:replacer_pattern)
		let l:replacer = substitute(l:replacer, '^<%=\s*\|\s*%>$', '', 'g')

		execute 's/<%=\s*'.l:replacer.'\s*%>/'.eval(l:replacer)."/"
	endwhile

	call cursor(1, 1) " reposition cursor at the top of the file

	if search('<%\s*cursor\s*%>') > 0
		" the ":s" command already positions the cursor at the place
		execute '%s/<%\s*cursor\s*%>//g'
	endif
endfunction

command! -bang -nargs=* LoadTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/templates',
			\   'down': 20,
			\   'sink': function('<sid>ReadTemplateIntoBuffer')
			\ })

"
" generate ctags file for a language
"
function! s:ExecuteScript(language)
	execute '! ~/.config/nvim/ctags-generation/'.a:language
endfunction

command! -bang -nargs=* GenerateTags call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/ctags-generation/',
			\   'down': 20,
			\   'sink': function('<sid>ExecuteScript')
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
" Plug 'junegunn/vim-easy-align'
"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
" Plug 'tveskag/nvim-blame-line'
"
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
" Plug 'tpope/vim-rhubarb'
"

noremap <leader>gb :GBrowse<cr>

"
" Plug 'tpope/vim-scriptease'
"

" Change keybinding to inspect under cursor syntax
nmap ZI <Plug>ScripteaseSynnames

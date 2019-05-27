" Set a vim home, duh
let g:original_home = $HOME
let $VIMHOME = $HOME."/.config/nvim/"
let $MYVIMPLUGINS = $VIMHOME.".plugins.vim"
" Its commented because, well, Im only using linux, but what if, right?
" if has('win32') || has ('win64')
"   let $VIMHOME = $VIM."/vimfiles"

" load Plugins
source $MYVIMPLUGINS
" create backup dir if it doesn't exists
silent !mkdir $VIMHOME'view' > /dev/null 2>&1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbr sptbr set spelllang=pt_br

set history=1000 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set autoread " detect when a file is changed

set backupdir=~/.nvim-tmp " the .swp files goes here
set directory=~/.nvim-tmp
set viewdir=$VIMHOME
set viewdir+=view/

set hidden
set undolevels=1000


" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set t_Co=256

if empty(matchstr($TERM, '^screen.*$'))
	let g:gruvbox_italic = 1
endif
color gruvbox
set background=dark
if $VHTHEME == "light"
	set background=light
endif

set number
set relativenumber

set diffopt+=vertical

set splitright

set autoindent " Auto-indent new lines
set smartindent " Enable smart-indent

set encoding=utf-8

set iskeyword -=-
syntax iskeyword -,_

set cursorline
set list

set fillchars=fold:-,vert:\│
set listchars=tab:┆\ ,eol:¬,trail:•,extends:❯,precedes:❮
"set listchars=tab:→⋮ ┆,eol:¬,trail:⋅•
"set showbreak=↪

" tab control
set smarttab " Enable smart-tabs respect 'tabstop', 'shiftwidth', and 'softtabstop'
set shiftwidth=2 " Number of auto-indent spaces
set softtabstop=2 " Edit as if the tabs are 4 characters wide
set tabstop=2 " the visible width of tabs
set shiftround " round indent to a multiple of 'shiftwidth'
set expandtab

set colorcolumn=120

set completeopt+=longest
set complete=.,w,b,u,i,k

" code folding settings
set foldnestmax=10          " deepest fold is 10 levels
"set nofoldenable            " don't fold by default
"set foldmethod=syntax       " fold based on highlight
"set foldmethod=indent       " fold based on indent
"set foldmethod=marker       " fold based on markers, default {{{,}}}
set foldmethod=manual       " fold based on manually
set foldlevelstart=0

set concealcursor=nvi
set conceallevel=0

set clipboard=unnamed

set ttyfast " faster redrawing
set laststatus=2 " show the status line at all times
set wildmenu " enchance command line completion
set wildmode=full " complete files like a shell (Default)
set cmdheight=1 " command bar height
set title

"insted of cutting a word to break the line, break the line before the word begin
set nowrap
set linebreak
"keeps vim from inserting a 'new line'
set textwidth=0
set wrapmargin=0

" searching
set hlsearch " Highlight all search results
set smartcase " Enable smart-case search
set noignorecase " Always case-insensitive
set incsearch " Searches for strings incrementally
"set nolazyredraw " don't redraw while executing macros
set incsearch " do incremental searching

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=200

if has('mouse')
	set mouse=nv " to ignore the mouse ->"set mouse="
	" set ttymouse=xterm2
endif

" GVim
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
if has("gui_running")
	if has("gui_gtk2")
		set guifont=Roboto\ Mono\ for\ Powerline\ Regular\ 12
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		set guifont=Consolas:h11:cANSI
	endif
endif

" Scroll offset
set scrolloff=2
set sidescrolloff=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
" Avoiding the <esc>
inoremap jk <esc>
cnoremap jk <C-[>
inoremap <c-c> <c-c>:set isk-=-<cr>

" Always forget {{{
nnoremap Ç :
cnoremap Ç <return>
cnoremap çç <return>
"}}}

" windows {{{
noremap <up> <C-w>+
nnoremap <down> <C-w>-
nnoremap <left> <C-w><
nnoremap <right> <C-w>>

nnoremap <leader>t <esc>:tabe<esc>:Bclose<CR>
"}}}

vnoremap <leader><leader> :normal .<cr>
vnoremap v <esc>

" scroll the viewport faster
noremap <C-e> 3<C-e>
noremap <C-q> 3<C-y>

" Code Folding
nnoremap <leader>f <esc>za
vnoremap <leader>f zf

" spell checking
noremap <leader>cw 1z=

" moviment {{{
noremap <leader>h ^
noremap <leader>l $
vnoremap <leader>l $<left>
"}}}

" Quickfix & make & search {{{
noremap <F5><F5> <esc>:wa<cr>:make<cr>:cw<cr>
noremap <F5> <esc>:wa<cr>:make<cr>:cw<cr><cr>

"ctrl shift f
noremap <F3> <esc>:Ag<cr>
vnoremap s :sort<cr>
vnoremap ss :sort i<cr>
vnoremap R y:%s/<C-R>"/<C-R>"/gc<left><left><left>
vnoremap RR y:%s/<C-R>"//gc<left><left><left>
vnoremap // "yyk/<C-R>y<CR>
vnoremap <C-r> "yy<esc>:args `ag -l '<C-r>y'`<cr>:argdo %s/<C-r>y/<C-r>y/ge <bar> update<left><left><left><left><left><left><left><left><left><left><left><left>

noremap <F6> <esc>:tp<cr>
noremap <F7> <esc>:tn<cr>

noremap + :cw<cr>
noremap - :ccl<cr>
noremap <C-h> :cp<CR>
noremap <C-l> :cn<CR>
"}}}

noremap Q <nop>
noremap Y y$
noremap <leader>y "+y
noremap VV ^v$h
noremap CA <esc>mygg"+yG`y
" Normalize the file
" noremap == <esc>mygg=G`y
" reverse 'J'
noremap JJ i<cr><esc>k$
noremap <leader>s <esc>:w<cr>
noremap <leader>S <esc>:w!<cr>

noremap <leader>p <esc>:FZF<cr>
noremap <C-p> <esc>:CtrlPBuffer<cr>
noremap <C-p><C-p> <esc>:CtrlPMRUFiles<cr>

nnoremap <leader>r <esc>my:e!<cr>`y
nnoremap <leader>W <esc>:set wrap!<cr>
nnoremap <leader>q :Bclose<CR>
nnoremap <leader>qq :bd<cr>
nnoremap <leader>Q :Bclose!<CR>
nnoremap <leader>QQ :bd!<cr>


"Linux only due filesys
map <F12> :tabe $MYVIMRC<CR>:vsplit $MYVIMPLUGINS<cr><c-w><left>
map <F12><F12> <esc>:bd<cr>:bd<cr>

"source the .vimrc (again) ~ reload the configs
noremap <F8> :so $MYVIMRC<cr>

" fugitive
nmap <insert> :Git add %<cr>:bd!<cr>
nmap <insert><insert> :Git add -u<cr>:bd!<cr>
nmap <insert><insert><insert> :Git add -A<cr>:bd!<cr>
nmap <pageup> :Git pow<cr>
nnoremap <leader>gg <esc>:Gcommit<cr>
nnoremap <leader>b <esc>:Gblame<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set TransparentBg {{{
function! TransparentBg()
	hi! NonText ctermbg=NONE guibg=NONE
	hi! Normal ctermbg=NONE guibg=NONE
	hi! Number ctermbg=NONE guibg=NONE
	hi! Folded ctermbg=NONE guibg=NONE
endfunction
command! SetBGtransparent call TransparentBg()
"}}}
" this works just in vim standalone {{{
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction "}}}
" visualy toggling case of words {{{
function! TwiddleCase(str)
	if a:str ==# toupper(a:str)
		let result = tolower(a:str)
	elseif a:str ==# tolower(a:str)
		let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
	else
		let result = toupper(a:str)
	endif
	return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgvl
"}}}
"Close thigs after inserting then {{{
"turn "Close thigs after inserting then" shortcut on if filetype html or xml
function! InrmapCloseThings()
	inoremap <? <?
	inoremap < <|inoremap >> >>|inoremap >>> >>>
	inoremap " "| inoremap "" ""
	inoremap '' ''
	inoremap (( ((|inoremap ((( (((
	inoremap [[ [[|inoremap [<return> [<return>
	inoremap {{ {{|inoremap {{{ {{{
	"}}} }}}
	inoremap }} }}
	inoremap , ,
	inoremap : :|inoremap :: ::|inoremap ::: :::
	inoremap \\ \\
	inoremap -- --
	inoremap __ __
	inoremap <pipe><pipe> <pipe><pipe>
	if index(['svg', 'ruby', 'cs', 'javascript', 'php', 'java', 'css', 'python', 'scss', 'kotlin', 'html', 'c', 'vue', 'eruby', 'json'],&filetype)!=-1
		inoremap "" ""<left>
		inoremap '' ''<left>
		inoremap (( ()<left>
		inoremap [[ []<left>
		inoremap {{ {<cr>}<esc>O
	endif
	if index(['ruby'],&filetype)!=-1
		inoremap <pipe><pipe> <pipe><pipe><left>
	endif
	if index(['php'],&filetype)!=-1
		inoremap -- ->
	endif
	if index(['javascript', 'html','vue', 'json'],&filetype)!=-1
		inoremap :: :<space>,<left>
		inoremap }} {{}}<left><left><space><space><left>
		inoremap {{{ {<cr>},<esc>O
		"}}} }}}
	endif
	if index(['html','vue'],&filetype)!=-1
		inoremap ;; :<space>;<left>
	endif
	if index(['javascript','vue'],&filetype)!=-1
		inoremap <buffer> lgo log
		inoremap <buffer> >> () => {}<left>
	endif
	if index(['vim'],&filetype)!=-1
		inoremap < <><left>
		inoremap '' ''<left>
		inoremap \\ /
	endif
	if index(['mysql'],&filetype)!=-1
		inoremap (( ()<left>
		inoremap ((( (<esc>o);<esc>O
		inoremap '' ''<left>
	endif
	if index(['eruby'],&filetype)!=-1
		inoremap <+ <%=  %><left><left><left>
		inoremap <% <%  %><left><left><left>
	endif
	if index(['css','scss'],&filetype)!=-1
		inoremap :: :<space>;<left>
		inoremap ?? /**/<left><left>
	endif
	if index(['markdown','html','xml','php','xhtml','vue', 'eruby'],&filetype)!=-1
		inoremap <! <!----><left><left><left>
	endif
	if index(['sh'],&filetype)!=-1
		inoremap [[ [[  ]]<left><left><left>
	endif
	if index(['php','phtml'],&filetype)!=-1
		inoremap <? <?php<space><space>?><left><left><left>
		inoremap <+ <?=<space>?><left><left><left>
		inoremap .. =>
		inoremap [<return> []<left><return><esc>O
	endif
	if index(['tex','plaintex', 'ruby', 'eruby'], &filetype)!=-1
		inoremap {{ {}<left>
	endif
endfunction
"}}}
function! GFRelativeHome()
	setlocal suffixes+=.vue
	setlocal suffixes+=.js
	" Super hack to make js imports '~/paths' work with gf
	nnoremap <buffer><silent> gf <esc>:let $HOME=getcwd()<cr>gf<esc>:let $HOME=g:original_home<cr>
	" try
	" finally
	" endtry
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	autocmd BufNewFile,BufRead *.sql setfiletype mysql
	autocmd BufNewFile,BufRead *.test setfiletype mysql
	autocmd BufNewFile,BufRead *.aspx setfiletype html
	autocmd BufNewFile,BufRead *.master setfiletype html
	autocmd BufNewFile,BufRead *.kl setfiletype kotlin
	autocmd BufNewFile,BufRead *.kls setfiletype kotlin
	autocmd BufNewFile,BufRead *.vue setfiletype vue.html.javascript.css
	autocmd BufNewFile,BufRead *.slim setfiletype slim
	autocmd BufNewFile,BufRead *.coffee setfiletype coffee
	autocmd BufNewFile,BufRead *tmux.conf setfiletype tmux

	autocmd BufNewFile,BufRead *.php set ft=phtml syn=php
	autocmd BufNewFile,BufRead *.tex set ft=tex tw=100 spell spl=pt_br
	autocmd BufNewFile,BufRead *.md setlocal spell
	autocmd BufNewFile,BufRead *COMMIT_EDITMSG setlocal spell

	autocmd BufNewFile,BufRead *.vue call GFRelativeHome()
	autocmd BufNewFile,BufRead *.js call GFRelativeHome()

	autocmd BufEnter * call InrmapCloseThings()
	autocmd BufEnter * :GitGutterAll
	autocmd BufEnter * :syntax sync fromstart
	autocmd StdinReadPre * let s:std_in=1
	autocmd BufWrite,VimLeave *.* mkview
	autocmd BufRead *.* silent! loadview

	autocmd BufNewFile,BufRead ~/Documents/defold/*.script setfiletype lua

	autocmd InsertEnter *.* set isk +=_
	autocmd InsertLeave *.* set isk -=_
	autocmd InsertEnter *.* set isk +=-
	autocmd InsertLeave *.* set isk -=-
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeChDirMode = 2
let g:NERDTreeQuitOnOpen = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lokaltog/neoranger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>n :RangerCurrentFile<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
"let g:airline_left_sep = '»'
let g:airline_left_sep = ''
"let g:airline_right_sep = '«'
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
"let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
"""""""""""""""""""""""""""""""""""""""""""""""""""
" TagBar
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_map_showproto = "d"
"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-table-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:table_mode_corner = "|"
"""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/xream/nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""
" from: https://gist.github.com/xream/c474a1adffeb6f70daa6a7ddc22386e0
let g:SynDebug = 0
map <leader>cd :call ToggleDebug()<CR>
imap <leader>ci <SPACE><BS><ESC>:call Comment('Insert')<cr>
map <leader>ca :call Comment('AltDelims')<cr>
xmap <leader>c$ :call Comment('ToEOL', 'x')<cr>
nmap <leader>c$ :call Comment('ToEOL', 'n')<cr>
xmap <leader>cA :call Comment('Append', 'x')<cr>
nmap <leader>cA :call Comment('Append', 'n')<cr>
xmap <leader>cs :call Comment('Sexy', 'x')<cr>
nmap <leader>cs :call Comment('Sexy', 'n')<cr>
xmap <leader>ci :call Comment('Invert', 'x')<cr>
nmap <leader>ci :call Comment('Invert', 'n')<cr>
xmap <leader>cm :call Comment('Minimal', 'x')<cr>
nmap <leader>cm :call Comment('Minimal', 'n')<cr>
xmap <leader>c<space> :call Comment('Toggle', 'x')<cr>
nmap <leader>c<space> :call Comment('Toggle', 'n')<cr>
xmap <leader>cl :call Comment('AlignLeft', 'x')<cr>
nmap <leader>cl :call Comment('AlignLeft', 'n')<cr>
xmap <leader>cb :call Comment('AlignBoth', 'x')<cr>
nmap <leader>cb :call Comment('AlignBoth', 'n')<cr>
xmap <leader>cc :call Comment('Comment', 'x')<cr>
nmap <leader>cc :call Comment('Comment', 'n')<cr>
xmap <leader>cn :call Comment('Nested', 'x')<cr>
nmap <leader>cn :call Comment('Nested', 'n')<cr>
xmap <leader>cu :call Comment('Uncomment', 'x')<cr>
nmap <leader>cu :call Comment('Uncomment', 'n')<cr>
xmap <leader>cy :call Comment('Yank', 'x')<cr>
nmap <leader>cy :call Comment('Yank', 'n')<cr>
let g:NERDCreateDefaultMappings=0
let g:NERDSpaceDelims=1
let g:NERDCustomDelimiters = {'pug': { 'left': '//-', 'leftAlt': '//' }}
function! ToggleDebug()
  let g:SynDebug = !g:SynDebug
  echo 'Syntax Debug Mode: '.g:SynDebug
endfunction
function! Comment(...) range
  let mode = a:0
  let type = a:1
  let ft = &ft
  let stack = synstack(line('.'), col('.'))
  if g:SynDebug
    echo ft
    echo map(stack, 'synIDattr(v:val, "name")')
  endif
  if ft == 'vue'
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        let syn = tolower(syn)
        if g:SynDebug
          echo syn
        endif
        exe 'setf '.syn
      endif
    endif
  endif
  if type == 'AltDelims'
    exe "normal \<plug>NERDCommenterAltDelims"
  elseif type == 'Insert'
    call NERDComment('i', "insert")
  else
    exe 'silent '.a:firstline.','.a:lastline.'call NERDComment(mode, type)'
  endif
  if g:SynDebug
    echo &ft
  endif
  exe "setf ".ft
  syntax sync fromstart
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""
"Ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore='.git$|\tmp$|log$'
let g:ctrlp_max_depth=40
let g:ctrlp_map = '<nul>'
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark
""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>m <Plug>MarkSet
vmap <leader>m <Plug>MarkSet
nmap <leader><leader>n <Plug>MarkClear
nmap <leader><leader>r <Plug>MarkRegex
vmap <leader><leader>r <Plug>MarkRegex
""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet
""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=100
let g:gitgutter_max_signs = 1000
"see readme for more info
"let g:gitgutter_terminal_reports_focus=0 "if commented is enabled

"""""""""""""""""""""""""
" autozimu/LanguageClient-neovim
"""""""""""""""""""""""""
" Required for operations modifying multiple buffers like rename.
set hidden

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Minimal LSP configuration for JavaScript
let g:LanguageClient_serverCommands = {
			\ 'javascript': ['javascript-typescript-stdio'],
			\ 'vue': ['vls'],
			\ 'html': ['html-languageserver', '--stdio'],
			\ 'css': ['css-languageserver', '--stdio'],
			\ 'json': ['json-languageserver', '--stdio'],
			\ }
" Use LanguageServer for omnifunc completion
autocmd FileType javascript,vue,html,css,json
			\ setlocal omnifunc=LanguageClient#complete

" go to definition
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
" type info under cursor
nnoremap <silent> K :call LanguageClient_textDocument_hover()<cr>
" rename variable under cursor
nnoremap <silent> RR :call LanguageClient_textDocument_rename()<cr>

"""""""""""""""""""""""""
" fzf.vim
"""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
"""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""
let g:ale_fixers = {
				\	'vue': ['eslint', 'stylelint'],
				\	'javascript': ['eslint'],
				\}

nmap ]e <Plug>(ale_next_wrap)
nmap [e <Plug>(ale_previous_wrap)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ruanyl/vim-gh-line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gh_open_command = 'google-chrome '


" vim: noet ts=4 sw=4 sts=4 fdm=marker

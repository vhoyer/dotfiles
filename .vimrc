" load Plugins
source ~/.plugins.vim
" create backup dir if it doesn't exists
silent !mkdir ~/.vim-tmp/ > /dev/null 2>&1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbr sptbr set spelllang=pt_br

set history=1000 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set autoread " detect when a file is changed

set backupdir=~/.vim-tmp// ",~/.tmp/,/var/tmp/,/tmp/ " the .swp files goes here
set directory=~/.vim-tmp// ",~/.tmp/,/var/tmp/,/tmp/
set viewdir=~/.vim/view

set hidden
set undolevels=1000
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

set autoindent " Auto-indent new lines
set smartindent " Enable smart-indent

set encoding=utf-8
set iskeyword-=-

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

set completeopt+=longest
set complete=.,w,b

" code folding settings
set foldnestmax=10          " deepest fold is 10 levels
"set nofoldenable            " don't fold by default
"set foldmethod=syntax       " fold based on highlight
"set foldmethod=indent       " fold based on indent
set foldmethod=marker       " fold based on markers, default {{{,}}}
set foldlevelstart=1

set clipboard=unnamed

set ttyfast " faster redrawing
set laststatus=2 " show the status line at all times
set wildmenu " enchance command line completion
set wildmode=full " complete files like a shell (Default)
set cmdheight=1 " command bar height
set title

"insted of cutting a word to break the line, break the line before the word begin
set wrap
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
noremap <leader><Bslash> <esc>:vsplit<cr>
noremap <leader>\| <esc>:split<cr>

nnoremap <up> <C-w>+
nnoremap <down> <C-w>-
nnoremap <left> <C-w><
nnoremap <right> <C-w>>
"}}}

vnoremap <leader><leader> :normal .<cr>
vnoremap v <esc>

" scroll the viewport faster
noremap <C-e> 2<C-e>
noremap <C-q> 2<C-y>

" Code Folding
nnoremap <leader>f <esc>za
vnoremap <leader>f zf

" spell checking
noremap <leader>cw 1z=

" moviment {{{
noremap <leader>h ^
noremap <leader>l $
vnoremap <leader>l $<left>

" transform the up and down to work on line wraps
noremap j gj
noremap k gk

nnoremap <leader>H <C-w><left>
nnoremap <leader>J <C-w><down>
nnoremap <leader>K <C-w><up>
nnoremap <leader>L <C-w><right>
"}}}

" Quickfix & make & search {{{
noremap <F5><F5> <esc>:wa<cr>:make<cr>:cw<cr>
noremap <F5> <esc>:wa<cr>:make<cr>:cw<cr><cr>

"ctrl shift f
"noremap <key> <esc>:grep -R '' .<left><left><left>

noremap <F6> <esc>:tn<cr>
noremap <F7> <esc>:tp<cr>

noremap + :cw<cr>
noremap - :ccl<cr>
noremap <C-h> :cp<CR>
noremap <C-l> :cn<CR>
"}}}

noremap Q <nop>
noremap Y y$
noremap <leader>y "+y
noremap VV ^v$h
noremap <F2> :tabprevious<cr>
noremap <F3> :tabNext<cr>
noremap <F4> :b#<cr>
nmap <insert> :Git add %<cr><cr>
nmap <insert><insert> :Git add -u<cr><cr>
nmap <insert><insert><insert> :Git add -A<cr><cr>
nmap <pageup> :Git pow<cr>
noremap <F10> :UltiSnipsEdit<cr>
noremap CA <esc>mygg"+yG`y
noremap <C-j> :bp<CR>
noremap <C-k> :bn<CR>
" Normalize the file
noremap == <esc>mygg=G`y
" reverse 'J'
noremap JJ i<cr><esc>k$
" go to mark ...
noremap <leader>g `
noremap <leader>m <esc>:only<cr>
noremap <leader>s <esc>:w<cr>
noremap <leader>S <esc>:w!<cr>
noremap <leader>p <esc>:CtrlP<cr>

nnoremap ~ g~
nnoremap <BS> i<bs><esc><right>
nnoremap <leader>gg <esc>:Gcommit<cr>
nnoremap <leader>ga <esc>:Git add %<cr><cr>
nnoremap <leader>r <esc>my:e!<cr>`y
nnoremap <leader>W <esc>:set wrap!<cr>
nnoremap <leader>q :Bclose<CR>
nnoremap <leader>qq :bd<cr>
nnoremap <leader>Q :Bclose!<CR>
nnoremap <leader>QQ :bd!<cr>
nnoremap <leader>e :q<CR>
nnoremap <leader>E :q!<cr>
nnoremap <leader>ee :qa<cr>
nnoremap <leader>EE :qa!<cr>
"Linux only due filesys
map <F12> :tabe ~/.plugins.vim<CR>:vsplit $MYVIMRC<cr>
map <F12><F12> <esc>:bd ~/.vimrc<cr>:bd ~/.plugins.vim<cr>

"source the .vimrc (again) ~ reload the configs
noremap <F8> :so $MYVIMRC<cr>
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
endfunction"}}}
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
	inoremap }} }}
	"}}} }}}
	inoremap , ,
	inoremap : :|inoremap :: ::
	inoremap \\ \\
	inoremap -- --
	inoremap __ __
	inoremap <pipe><pipe> <pipe><pipe>
	if index(['ruby','cs','javascript','php','java','css','python','scss','kotlin','html','c','vue'],&filetype)!=-1
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
	if index(['html','vue'],&filetype)!=-1
		inoremap }} {{}}<left><left><space><space><left>
	endif
	if index(['javascript','vue'],&filetype)!=-1
		inoremap :: :<space>,<left>
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
	if index(['html','xml','php','xhtml','vue','eruby'],&filetype)!=-1
		inoremap << <space>/>
		inoremap >> <space>><esc>mtT<yt<space>`ta</<esc>pa><esc><left>F<space>xa
		inoremap >>> <space>><esc>mtT<yt<space>`ta</<esc>pa><esc><left>F<space>xa<cr><esc>O
		inoremap \\ /
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
	autocmd BufNewFile,BufRead *.md setlocal spell tw=100
	autocmd BufNewFile,BufRead *COMMIT_EDITMSG setlocal spell

	autocmd BufEnter * call InrmapCloseThings()
	autocmd StdinReadPre * let s:std_in=1
	autocmd BufWrite,VimLeave *.* mkview
	autocmd BufRead *.* silent loadview

	autocmd BufNewFile,BufRead ~/Documents/defold/*.script setfiletype lua

	"autocmd InsertEnter *.* set isk+=- isk+=_
	"autocmd InsertLeave *.* set isk-=- isk-=_
	autocmd InsertEnter *.* set isk+=-
	autocmd InsertLeave *.* set isk-=-
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
" ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<Nul>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
"""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_java_javac_config_file_enabled = 1
	"command to call in project folder -> :SyntasticJavacEditClasspath
"let g:syntastic_scss_sass_args = '-I <path to variables file>'
    "option relates to https://github.com/vim-syntastic/syntastic/issues/1140
    "should get rid of false-positive for variable not declared
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore='.git$|\tmp$|log$'
let g:ctrlp_max_depth=40
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark
""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader><leader>m <Plug>MarkSet
vmap <leader><leader>m <Plug>MarkSet
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
let g:gitgutter_map_keys = 0
"see readme for more info
"let g:gitgutter_terminal_reports_focus=0 "if commented is enabled

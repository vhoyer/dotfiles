" load Plugins
source ~/.plugins.vim
" create backup dir if it doesn't exists
silent !mkdir ~/.vim-tmp/ > /dev/null 2>&1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=1000 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set autoread " detect when a file is changed

set backupdir=~/.vim-tmp// ",~/.tmp/,/var/tmp/,/tmp/ " the .swp files goes here
set directory=~/.vim-tmp// ",~/.tmp/,/var/tmp/,/tmp/

set undolevels=1000
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set t_Co=256

let g:gruvbox_italic = 1
color gruvbox
set background=dark

set number
set relativenumber

set autoindent " Auto-indent new lines
set smartindent " Enable smart-indent

set list
set listchars=tab:┆\ ,eol:¬,trail:•,extends:❯,precedes:❮
"set listchars=tab:→⋮ ┆,eol:¬,trail:⋅•
"set showbreak=↪

" tab control
set smarttab " Enable smart-tabs respect 'tabstop', 'shiftwidth', and 'softtabstop'
set shiftwidth=4 " Number of auto-indent spaces
set softtabstop=4 " Edit as if the tabs are 4 characters wide
set tabstop=4 " the visible width of tabs
set shiftround " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

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
set ignorecase " Always case-insensitive
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

" Scroll offset
set scrolloff=2
set sidescrolloff=5
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
"Avoiding the <esc>
inoremap kl <esc>
cmap <C-space> <C-c>

" windows
nnoremap <silent> <leader>h <esc>:split<cr>
nnoremap <silent> <leader>H <esc>:vsplit<cr>

nnoremap <up> <C-w>+
nnoremap <down> <C-w>-
nnoremap <left> <C-w><
nnoremap <right> <C-w>>

" set paste toggle
nnoremap <silent> \p :set invpaste<cr>
" set pastetoggle="\p"

vnoremap <leader><leader> :normal .<cr>
vnoremap v <esc>

" scroll the viewport faster
noremap K 2<C-e>
noremap L 2<C-y>

" Code Folding
nnoremap <leader>f <esc>za
vnoremap <leader>f zf

" spell checking
noremap <leader>cw 1z=

" movimento
noremap ç l
noremap l k
noremap k j
noremap j h

noremap J b
noremap Ç w
noremap <leader>J ^
noremap <leader>Ç $
vnoremap <leader>Ç $<left>

nnoremap <leader>j <C-w><left>
nnoremap <leader>k <C-w><down>
nnoremap <leader>l <C-w><up>
nnoremap <leader>ç <C-w><right>

noremap Q <nop>
noremap Y y$
noremap + :cw<cr>
noremap - :ccl<cr>
noremap VV ^v$h
noremap <F2> :tabprevious<cr>
noremap <F3> :tabNext<cr>
noremap <F4> :b#<cr>
noremap <F5> <esc>:wa<cr>:make<cr>:cw<cr>
noremap <S-F5> <esc>:wa<cr>:make<space>
noremap <C-F5> <esc>:wa<cr>:make %:r<cr>:cw<cr>
noremap <C-j> :bp!<CR>
noremap <C-k> :bn!<CR>
noremap <C-h> :cp<CR>
noremap <C-l> :cn<CR>
noremap <C-n> <esc>mygg=G`y
noremap <leader>g `
noremap <leader>m <esc>:only<cr>
noremap <leader>s <esc>:w<cr>
noremap <leader>S <esc>:w!<cr>
noremap <leader>p <esc>:CtrlP<cr>
noremap <leader><leader> .

nnoremap ~ g~
nnoremap <BS> i<bs><esc><right>
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
map <S-F12> <esc>:bd ~/.vimrc<cr>:bd ~/.plugins.vim<cr><F8>
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
abbr tbg call<space>TransparentBg()
"}}}
function! USlayout() "{{{
	""""""""""""""""
	nnoremap Ç :
	cnoremap Ç <return>
	cnoremap çç <return>
	""""""""""""""""
	inoremap kl kl
	noremap H H
	noremap J J
	noremap K K
	noremap L L

	"Avoiding the <esc>
	inoremap jk <esc>
	cnoremap jk <esc>

	" scroll the viewport faster
	noremap <C-e> 2<C-e>
	noremap <C-q> 2<C-y>

	"moviment
	noremap h h
	noremap j j
	noremap k k
	noremap l l

	noremap <leader><Bslash> <esc>:split<cr>
	noremap <leader>\| <esc>:vsplit<cr>
	noremap <leader>H ^
	noremap <leader>L $
	vnoremap <leader>L $<left>

	nnoremap <leader>h <C-w><left>
	nnoremap <leader>j <C-w><down>
	nnoremap <leader>k <C-w><up>
	nnoremap <leader>l <C-w><right>

	noremap <C-j> :bp<CR>
	noremap <C-k> :bn<CR>
endfunction
call USlayout()
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
	"}}} }}}
	inoremap , ,
	inoremap : :|inoremap :: ::
	inoremap \\ \\
	inoremap -- --
	inoremap __ __
	if &filetype == 'html' || &filetype == 'xml' || &filetype == 'php'
		inoremap <? <?php<space>?><left><left><left>
		inoremap << <space>/>
		inoremap >> <space>><esc>mtT<yt<space>`ta</<esc>pa><esc><left>F<space>xa
		inoremap >>> <space>><esc>mtT<yt<space>`ta</<esc>pa><esc><left>F<space>xa<cr><esc>O
		inoremap '' ''<left>
		inoremap \\ /
	endif
	if &filetype == 'cs' || &filetype == 'javascript' || &filetype == 'php' || &filetype == 'java' || &filetype == 'css' || &filetype == 'python'
		inoremap "" ""<left>
		inoremap '' ''<left>
		inoremap (( ()<left>
		inoremap [[ []<left>
		inoremap {{ {<cr>}<esc>O
		inoremap -- ->
	endif
	if &filetype == 'php'
		inoremap __ =>
		inoremap [<return> []<left><return><esc>O
	endif
	if &filetype == 'vim'
		inoremap < <><left>
		inoremap '' ''<left>
		inoremap \\ /
	endif
	if &filetype == 'mysql'
		inoremap (( ()<left>
		inoremap ((( (<esc>o);<esc>O<tab>
		inoremap '' ''<left>
	endif
	if &filetype == 'css'
		inoremap :: :<space>;<left>
	endif
	if &filetype == 'markdown' || &filetype == 'html' || &filetype == 'xml' || &filetype == 'php'
		inoremap <! <!----><left><left><left>
	endif
endfunction
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	autocmd BufNewFile,BufRead *.sql set filetype=mysql
	autocmd BufNewFile,BufRead *.test set filetype=mysql
	autocmd BufNewFile,BufRead *.aspx set filetype=html
	autocmd BufNewFile,BufRead *.master set filetype=html
	autocmd BufNewFile,BufRead *.php setfiletype=php

	autocmd BufNewFile,BufRead *.md setlocal spell

	autocmd BufEnter * call InrmapCloseThings()
	autocmd StdinReadPre * let s:std_in=1
	autocmd BufWrite,VimLeave *.* mkview
	autocmd BufRead *.* silent loadview
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
" super tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc','&completefunc']
let g:SuperTabRetainCompletionType=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown-preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_markdown_preview_hotkey='<C-m>'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
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
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetsDir = "~/.vim/Ultisnips"
let g:UltiSnipsSnippetsDirectories=["~/.vim/Ultisnips", "Ultisnips"]
"""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_java_javac_config_file_enabled = 1
	"command to call in project folder -> :SyntasticJavacEditClasspath

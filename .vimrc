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

set hidden
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
set guifont=UbuntuMono\ 13

" Scroll offset
set scrolloff=2
set sidescrolloff=5
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
" Avoiding the <esc>
inoremap jk <esc>
cnoremap jk <C-[>

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
noremap <leader>H ^
noremap <leader>L $
vnoremap <leader>L $<left>

nnoremap <leader>h <C-w><left>
nnoremap <leader>j <C-w><down>
nnoremap <leader>k <C-w><up>
nnoremap <leader>l <C-w><right>
"}}}

" Quickfix & make {{{
noremap <F5> <esc>:wa<cr>:make<cr>:cw<cr>
noremap <S-F5> <esc>:wa<cr>:make<space>
noremap <C-F5> <esc>:wa<cr>:make %:r<cr>:cw<cr>
noremap <F9> <esc>:e Makefile<cr>
noremap <S-F9> <esc>:bd Makefile<cr>
noremap + :cw<cr>
noremap - :ccl<cr>
noremap <C-h> :cp<CR>
noremap <C-l> :cn<CR>
"}}}

noremap Q <nop>
noremap Y y$
noremap VV ^v$h
noremap <F2> :tabprevious<cr>
noremap <F3> :tabNext<cr>
noremap <F4> :b#<cr>
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

"insert maps
inoremap <C-n> <C-x><C-n>

"Linux only due filesys
map <F12> :tabe ~/.plugins.vim<CR>:vsplit $MYVIMRC<cr>
map <S-F12> <esc>:bd ~/.vimrc<cr>:bd ~/.plugins.vim<cr>

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
	if &filetype == 'html' || &filetype == 'xml' || &filetype == 'phtml'
		inoremap <? <?php<space>?><left><left><left>
		inoremap <+ <?=<space>?><left><left><left>
		inoremap << <space>/>
		inoremap >> <space>><esc>mtT<yt<space>`ta</<esc>pa><esc><left>F<space>xa
		inoremap >>> <space>><esc>mtT<yt<space>`ta</<esc>pa><esc><left>F<space>xa<cr><esc>O
		inoremap '' ''<left>
		inoremap \\ /
	endif
	if &filetype == 'cs' || &filetype == 'javascript' || &filetype == 'phtml' || &filetype == 'java' || &filetype == 'css' || &filetype == 'python'
		inoremap "" ""<left>
		inoremap '' ''<left>
		inoremap (( ()<left>
		inoremap [[ []<left>
		inoremap {{ {<cr>}<esc>O
		inoremap -- ->
	endif
	if &filetype == 'phtml'
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
		inoremap ((( (<esc>o);<esc>O
		inoremap '' ''<left>
	endif
	if &filetype == 'css'
		inoremap :: :<space>;<left>
	endif
	if &filetype == 'markdown' || &filetype == 'html' || &filetype == 'xml' || &filetype == 'phtml'
		inoremap <! <!----><left><left><left>
	endif
	if &filetype == 'sh'
		inoremap [[ [[  ]]<left><left><left>
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
	autocmd BufNewFile,BufRead *.php set filetype=phtml

	autocmd BufNewFile,BufRead *.md setlocal spell
	autocmd BufNewFile,BufRead *COMMIT_EDITMSG setlocal spell

	autocmd BufEnter * call InrmapCloseThings()
	autocmd StdinReadPre * let s:std_in=1
	autocmd BufWrite,VimLeave *.* mkview
	autocmd BufRead *.* silent loadview

	autocmd BufNewFile,BufRead ~/Documents/defold/*.script set filetype=lua
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
let g:UltiSnipsExpandTrigger = "<Nul>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
"""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_java_javac_config_file_enabled = 1
	"command to call in project folder -> :SyntasticJavacEditClasspath
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark
""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader><leader>m <Plug>MarkSet
vmap <leader><leader>m <Plug>MarkSet
nmap <leader><leader>n <Plug>MarkClear

" create backup dir if it doesn't exists
silent !mkdir ~/.vim-tmp/ > /dev/null 2>&1
" load Plugins
source ~/.plugins.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbr W w
abbr Q q

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
set nofoldenable            " don't fold by default
"set foldmethod=syntax       " fold based on indent
set foldlevel=1

set clipboard=unnamed

set ttyfast " faster redrawing
set laststatus=2 " show the status line at all times
set wildmenu " enchance command line completion
set wildmode=list:longest " complete files like a shell
set cmdheight=1 " command bar height
set title

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

vnoremap ´ :normal .<cr>
vnoremap <leader><leader> <esc>

" scroll the viewport faster
noremap K 2<C-e>
noremap L 2<C-y>

" Code Folding
nnoremap <leader>f <esc>za
vnoremap <leader>f zf

" movimento
noremap ç l
noremap l k
noremap k j
noremap j h

noremap J b
noremap Ç w
noremap <leader>J ^
noremap <leader>Ç $

nnoremap <leader>j <C-w><left>
nnoremap <leader>k <C-w><down>
nnoremap <leader>l <C-w><up>
nnoremap <leader>ç <C-w><right>


noremap ´ .
noremap Q <nop>
noremap <leader>g `
noremap <F2> :tabprevious<cr>
noremap <F3> :tabNext<cr>
noremap <F4> :b#<cr>
noremap <C-k> :bp<CR>
noremap <C-l> :bn<CR>
noremap <C-n> <esc>mygg=G`y
noremap <leader>s <esc>:w<cr>
noremap <leader>p <esc>:CtrlP<cr>

nnoremap ~ g~
nnoremap W <esc>:set wrap!<cr>
nnoremap <BS> i<bs><esc><right>
nnoremap <leader>q :Bclose<CR>:enew<cr>
nnoremap <leader>qq :bd<cr>
nnoremap <leader>Q :Bclose!<CR>:enew<cr>
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
function! Cecp(...)
	if expand('%:e') ==? "py"
		if (a:0 > 0)
			let arg = join(a:000, " ")
			execute ":!python ".expand('%:p')." ".arg
		else
			execute ":!python ".expand('%:p')
		endif
	elseif expand('%:e') ==? "sql"
		execute ":!mysql -p < ".expand('%:p')
	endif
endfunction
noremap <F6> :call Cecp()<cr>
noremap <S-F6> :call Cecp()

" this works just in vim standalone {{{
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction
"}}}
" visualy toggling case of words
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
"turn "Close thigs after inserting then" shortcut on if filetype html or xml
function! InrmapCloseThings()
	inoremap < <
	inoremap " "
	inoremap ' '
	inoremap ( ( | inoremap (( (( | inoremap () ()
	inoremap [ [ | inoremap [[ [[ | inoremap [] []
	inoremap { { | inoremap {{ {{
	inoremap , ,
	inoremap : :
	inoremap ; ;
	inoremap \\ \\
	if &filetype == 'html' || &filetype == 'xml' || &filetype == 'vim'
		inoremap < <><left>
		inoremap ' ''<left>
		inoremap \\ /
	elseif &filetype == 'cs'
		inoremap " ""<left>
		inoremap (( (
		inoremap () ()
		inoremap ( ()<left>
		inoremap [[ [
		inoremap [] []
		inoremap [ []<left>
		inoremap {{ {<esc>o}<esc>O
		inoremap ; ;<left>
	elseif &filetype == 'mysql'
		inoremap ( ()<left>
		inoremap (( (<esc>o);<esc>O<tab>
		inoremap ' ''<left>
	elseif &filetype == 'css'
		inoremap , ,<space>
		inoremap ( ()<left>
		inoremap {{ {<esc>o}<esc>O
		inoremap : :<space>;<left>
	endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	autocmd BufNewFile,BufRead *.sql set filetype=mysql      
	autocmd BufNewFile,BufRead *.test set filetype=mysql
	autocmd BufEnter,BufNewFile,BufRead *.aspx set filetype=html
	autocmd BufEnter * call InrmapCloseThings()
	autocmd StdinReadPre * let s:std_in=1
	autocmd BufWrite,VimLeave *.* mkview
	autocmd BufRead *.* silent loadview
	autocmd BufRead *.* '.
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeChDirMode = 2
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
" Ctrl-p
"""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ctrlp_map = '<leader>p'
"let g:ctrlp_prompt_mappings = {
	"\ 'PrtSelectMove("j")': '<C-k>',
	"\ 'PrtSelectMove("k")': '<C-l>',
	"\ 'MarkToOpen()':         ['<c-z>'],
	"\ 'OpenMulti()':          ['<c-o>']
	"\ }

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

set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp " the .swp files goes here

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
set listchars=tab:⋮\ ,eol:¬,trail:•,extends:❯,precedes:❮
"set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
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
"Avoiding the <esc>
inoremap kl <esc>
cmap <C-space> <C-c>

" close things after inserting them
inoremap [ []<esc>i
inoremap ( ()<esc>i
inoremap { {<esc>o}<esc>O
inoremap < <><esc>i
inoremap " ""<esc>i

nmap <leader>\ :w<cr>
nmap <leader>; \pA;<esc>\p

" set paste toggle
"nnoremap \p :set invpaste<cr>
set pastetoggle=<leader>p

vnoremap . :normal .<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" movimento
noremap ç l
noremap l k
noremap k j
noremap j h

nmap <C-w>j <C-w><left>
nmap <C-w>k <C-w><down>
nmap <C-w>l <C-w><up>
nmap <C-w>ç <C-w><right>

nnoremap <BS> i<bs><esc><right>
nmap <F4> :b#<cr>

" source the .vimrc (again) ~ reload the configs
nnoremap <F8> :so $MYVIMRC<cr>
noremap <silent> <leader>w <esc>:set wrap!<cr>
nnoremap <space> za
vnoremap <space> zf
map <F2> :bp<CR>
map <F3> :bn<CR>
noremap <S-F5> :bd<CR>
noremap <F5> :Bclose<CR>:enew<cr>
"Linux only due filesys
map <F12> :tabe ~/.plugins.vim<CR>:vsplit $MYVIMRC<cr>
map <S-F12> :bd ~/.vimrc<cr>:bd ~/.plugins.vim<cr>
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufRead *.sql set filetype=mysql      
    autocmd BufRead *.test set filetype=mysql
endif
" autocmd BufEnter * silent! lcd %:p:h
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
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

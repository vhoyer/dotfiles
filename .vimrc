" settings
set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set mouse=a

set autoindent	    " Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	    " Enable smart-indent
set smarttab	    " Enable smart-tabs
set softtabstop=4	" Number of spaces per Tabset errorbells

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch   " Searches for strings incrementally

set number
set novisualbell
set showmatch
set undolevels=1000
set showtabline=2
set t_Co=256

" key mapping
noremap ç l
noremap l k
noremap k j
noremap j h
nnoremap <BS> i<bs>
nmap <F4> :b#<cr>
nmap <F8> :so $MYVIMRC<cr>
nnoremap <space> za
vnoremap <space> zf
map <F2> :bp<CR>
map <F3> :bn<CR>

map <F12> :tabe ~/.vimrc<CR>
map <S-F12> :tabclose<cr>
" Compiler Function
function! Cecp(...)
    if expand('%:e') ==? "py"
	if (a:0 > 0)
	    let arg = join(a:000, " ")
	    execute ":!python ".expand('%:p')." ".arg
	else
	    execute ":!python ".expand('%:p')
	endif
    endif
endfunction
noremap <F5> :call Cecp()<cr>
noremap <S-F5> :call Cecp()
" autocmds
autocmd BufEnter * silent! lcd %:p:h

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox' " colorscheme
Plugin 'tpope/vim-fugitive' 
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'joonty/vdebug'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'taglist.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
" :PluginUpdate
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" color scheme
color gruvbox
set background=dark
" nerd tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" super tab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc','&completefunc']
let g:SuperTabRetainCompletionType=2
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '▸'
let g:airline#extensions#tabline#left_alt_sep = '>'

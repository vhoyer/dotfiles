" load Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox' " colorscheme
Plugin 'scrooloose/nerdcommenter' " auto comment code based on ft
Plugin 'vadimr/bclose.vim' " close buffer instead of window
Plugin 'tpope/vim-surround' " handy, hard to explain in one line
Plugin 'tpope/vim-repeat' " make . work with surrond
Plugin 'vhoyer/Mark' " hightlight words, handy for debug
Plugin 'mattn/emmet-vim' "html>body>div.container into html file
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
" :PluginUpdate
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
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
set viewdir=~/.vim/view

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
set foldmethod=manual       " fold based on manually

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
"set textwidth=0
"set wrapmargin=0

" searching
set hlsearch " Highlight all search results
set smartcase " Enable smart-case search
set incsearch " Searches for strings incrementally
"set nolazyredraw " don't redraw while executing macros

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

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

vnoremap v <esc>

" scroll the viewport faster
noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>

" Code Folding
nnoremap <leader>f <esc>za
vnoremap <leader>f zf

" moviment {{{
noremap <leader>h ^
noremap <leader>l $
vnoremap <leader>l $<left>

" Quickfix & make & search {{{
noremap <F5> <esc>:wa<cr>:make<cr>:cw<cr><cr>

"ctrl shift f
noremap <F3> <esc>:grep --exclude=tags -R '' .<left><left><left>

noremap Q <nop>
noremap Y y$
noremap <leader>y "+y
noremap VV ^v$h
noremap <leader>s <esc>:w<cr>
noremap <leader>S <esc>:w!<cr>

nnoremap <leader>r <esc>my:e!<cr>`y
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" this works just in vim standalone {{{
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction"}}}

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
	autocmd BufNewFile,BufRead *.tex set ft=tex spell spl=pt_br
	autocmd BufNewFile,BufRead *.md setlocal spell
	autocmd BufNewFile,BufRead *COMMIT_EDITMSG setlocal spell

	autocmd StdinReadPre * let s:std_in=1
	autocmd BufWrite,VimLeave *.* mkview
	autocmd BufRead *.* silent loadview

	autocmd InsertEnter *.* set isk+=-
	autocmd InsertLeave *.* set isk-=-
endif
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

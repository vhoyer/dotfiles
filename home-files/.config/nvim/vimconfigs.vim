" highlight current search
set hlsearch

" this can be overruled by using "\c" or "\C" in the pattern
set ignorecase

" THIS IS A MUST, I dunno why this is not default, not having this makes using
" macros painful!!! With this macros is practically instant
set lazyredraw

" default encoding
set encoding=utf-8

" Vim refresh rate
set updatetime=200

" set timeout for keybinding insertion
set timeoutlen=200

" Set line numbers
set number
set relativenumber

" Set current line highlight
set cursorline

" tab/spaces stuffs
set expandtab " transforms tabs into spaces
set shiftround " round indent to a multiple of 'shiftwidth'
set shiftwidth=2 " Number of auto-indent spaces
set smarttab " Enable smart-tabs respect 'tabstop', 'shiftwidth', and 'softtabstop'
set softtabstop=2 " Edit as if the tabs are 2 characters wide
set tabstop=2 " the visible width of tabs

" Search dictionary for word completion
set complete=.,w,b,u,i,k " see :h 'complete'

" Vim's default completion mechanism (e.g.: trigged by <c-n>) options
set completeopt=menuone,noselect

" Set spell checking by default
set spell

" Set cute characters
set fillchars=fold:\ ,vert:\│
set list
set listchars=tab:┆\ ,eol:¬,trail:•,extends:❯,precedes:❮,nbsp:⍽

if has('folding')
	" custom function to define what is shown when fold closed
	function! FoldText() abort
		let l:commentline_start_dictionary = {
					\ 'vim': '"',
					\ 'make': '#',
					\ 'sh': '#',
					\}
		let l:commentline_start = get(l:commentline_start_dictionary, &filetype, '//')

		" meta information after the line
		let l:lines = l:commentline_start.' '.(v:foldend - v:foldstart + 1).' lines'

		" make the folded preview have the same indent as the original line
		let l:first = substitute(getline(v:foldstart), '\(^\|\t\)\@<=\t', repeat(' ', &tabstop), 'g')
		let l:first = substitute(l:first, '^ ', '+', '')

		return l:first . ' ' . l:lines
	endfunction

	set foldmethod=indent " how the folding is processed, other values: syntax,manual
	set foldlevelstart=99 " start unfolded
	set foldtext=FoldText() " call custom function

	function HLFold() abort
		let l:guibg=synIDattr(hlID("Normal"), "bg", "GUI")
		let l:guifg=synIDattr(hlID("Comment"), "fg", "GUI")
		let l:ctermbg=synIDattr(hlID("Normal"), "bg", "cterm")
		let l:ctermfg=synIDattr(hlID("Comment"), "fg", "cterm")

		let l:histring = ['highlight Folded',
					\ 'guifg=' . l:guifg, 'ctermfg=' . l:ctermfg,
					\ 'guibg=' . l:guibg, 'ctermbg=' . l:ctermbg,
					\ 'gui=NONE', 'cterm=NONE'
					\ ]

		execute join(l:histring, ' ')
	endfunction
	augroup FoldSyntax
		autocmd!
		autocmd Syntax * call HLFold()
	augroup END
endif

" open new tab on the bottom and on the right
set splitbelow
set splitright

" enable mouse support, mainly for scrolling stuff
set mouse=a

" set diffview as vertical because default is horizontal split and that makes
" no sense :p
set diffopt+=vertical

" when wrapping a line, wrap around words not any-letter
set linebreak
set breakindent
set breakindentopt=shift:2

" when no wrapping a line, make sure the window displays everything
set sidescrolloff=5

" set default behavior to not wrap
set nowrap

" set a Vim theme options
set background=dark

" prevent Vim from complaining about leaving an unsaved buffer
set hidden

" enable true color support
set termguicolors

" configure backup behavior
set backupcopy=yes

" disable swap exists warning
"set shortmess+=A

" Also <C-a> and <C-x> letters
set nrformats+=alpha

" make all files vim creates stay away from git control
silent !mkdir ~/tmp > /dev/null 2>&1
set directory=~/tmp
set backupdir=~/tmp

" on a ultra wide monitor with three vertical splits, 88 is the displayed
" number of characters per window, and 120 is just the reasonable default
set colorcolumn=88,120

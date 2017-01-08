"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox' " colorscheme
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
"Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'joonty/vdebug'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
"Plugin 'JamshedVesuna/vim-markdown-preview' "doesn't seen to work'
Plugin 'vadimr/bclose.vim'
Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
"Plugin 'siminino/vim-autoprefixer'
Plugin 'albfan/AnsiEsc.vim'
"Plugin 'OmniSharp/omnisharp-vim' "seens a good one, but needs vim compiled with python
Plugin 'dhruvasagar/vim-table-mode'
"Plugin 'jaxbot/semantic-highlight.vim' "custom color for variables
Plugin 'vhoyer/Mark'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
" :PluginUpdate
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

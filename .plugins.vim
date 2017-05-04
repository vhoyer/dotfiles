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
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'joonty/vdebug'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'vadimr/bclose.vim'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-surround'
Plugin 'albfan/AnsiEsc.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'vhoyer/Mark'
Plugin 'wakatime/vim-wakatime'
Plugin 'mattn/emmet-vim' "html>body>div.container into html file
"Plugin 'sjl/gundo'
"Plugin 'siminino/vim-autoprefixer'
"Plugin 'jaxbot/semantic-highlight.vim' "custom color for variables

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
" :PluginUpdate
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

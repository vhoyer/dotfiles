"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox' " colorscheme
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'scrooloose/nerdtree' " tree file explorer
Plugin 'vim-airline/vim-airline' " the bottom thingy
Plugin 'scrooloose/syntastic' " ?
Plugin 'kien/ctrlp.vim' " just press ctrl+p too see
Plugin 'scrooloose/nerdcommenter' " auto comment code based on ft
Plugin 'majutsushi/tagbar' " run :Tagbar, neat thing for bit files
Plugin 'vadimr/bclose.vim' " close buffer instead of window
Plugin 'SirVer/ultisnips' " snippets
Plugin 'tpope/vim-surround' " handy, hard to explain in one line
Plugin 'tpope/vim-repeat' " make . work with surrond
Plugin 'dhruvasagar/vim-table-mode' " utililty for tables in .md
Plugin 'vhoyer/Mark' " hightlight words, handy for debug
Plugin 'wakatime/vim-wakatime' " waka waka waka
Plugin 'mattn/emmet-vim' "html>body>div.container into html file
Plugin 'udalov/kotlin-vim'
Plugin 'othree/html5.vim'
Plugin 'posva/vim-vue'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
"Plugin 'tpope/vim-rails'
"Plugin 'joonty/vdebug'
"Plugin 'sjl/gundo'
"Plugin 'jaxbot/semantic-highlight.vim' "custom color for variables

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
" :PluginUpdate
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

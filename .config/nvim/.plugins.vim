"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Lokaltog/neoranger'
Plugin 'airblade/vim-gitgutter'
Plugin 'autozimu/LanguageClient-neovim'
Plugin 'junegunn/fzf.vim'
Plugin 'kien/ctrlp.vim' " just press ctrl+p too see
Plugin 'mattn/emmet-vim' "html>body>div.container into html file
Plugin 'morhetz/gruvbox' " colorscheme
Plugin 'ruanyl/vim-gh-line'
Plugin 'scrooloose/nerdcommenter' " auto comment code based on ft
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tommcdo/vim-fugitive-blame-ext'
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'tpope/vim-repeat' " make . work with surrond
Plugin 'tpope/vim-surround' " handy, hard to explain in one line
Plugin 'unblevable/quick-scope'
Plugin 'vadimr/bclose.vim' " close buffer instead of window
Plugin 'vhoyer/Mark' " hightlight words, handy for debug
Plugin 'vim-airline/vim-airline' " the bottom thingy
Plugin 'w0rp/ale' " asynchronos linting
Plugin 'wakatime/vim-wakatime' " waka waka waka

Plugin 'udalov/kotlin-vim'
Plugin 'othree/html5.vim'
Plugin 'posva/vim-vue'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'elixir-editors/vim-elixir'
Plugin 'chr4/nginx.vim'
"Plugin 'jaxbot/semantic-highlight.vim' "custom color for variables

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
" :PluginUpdate
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" for fuzzy file finder 'junegunn/fzf' its just... different
set rtp+=~/.fzf

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif


" vim: noet ts=4 sw=4 sts=4 fdm=marker

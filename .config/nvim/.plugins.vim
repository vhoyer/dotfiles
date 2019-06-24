"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
call plug#begin()

Plug 'Lokaltog/neoranger'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim' "html>body>div.container into html file
Plug 'morhetz/gruvbox' " colorscheme
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'ruanyl/vim-gh-line'
Plug 'scrooloose/nerdcommenter' " auto comment code based on ft
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-repeat' " make . work with surrond
Plug 'tpope/vim-surround' " handy, hard to explain in one line
Plug 'unblevable/quick-scope'
Plug 'vadimr/bclose.vim' " close buffer instead of window
Plug 'vhoyer/Mark' " hightlight words, handy for debug
Plug 'vim-airline/vim-airline' " the bottom thingy
" Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime' " waka waka waka

Plug 'ap/vim-css-color'
Plug 'chr4/nginx.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'hail2u/vim-css3-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-haml'
Plug 'udalov/kotlin-vim'
"Plugin 'jaxbot/semantic-highlight.vim' "custom color for variables

call plug#end()

" for fuzzy file finder 'junegunn/fzf' its just... different
set rtp+=~/.fzf

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif


" vim: noet ts=4 sw=4 sts=4 fdm=marker

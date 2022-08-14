" embeddedvim syntax file
" Language: None
" Maintainer: Vinícius Hoyer

if exists("b:current_syntax")
  finish
endif

" Load vim syntax inside especial tags {{{
syntax include @vimAll syntax/vim.vim
unlet! b:current_syntax

syn region embeddedvim matchgroup=Special start=/<%=/ keepend end=/%>/ contains=@vimAll containedin=ALL,javaScript
" }}}

" Load the other syntax for the file based on sub.extension {{{
let s:extensions_dict = {
      \ 'js': 'javascript',
      \}
let s:extension = split(expand('%:t:r'), '\.')[-1]
let s:filetype = get(s:extensions_dict, s:extension, s:extension)

execute 'runtime! syntax/'.s:filetype.'.vim'
unlet! b:current_syntax
" }}}

let b:current_syntax = "embeddedvim"

" vim: foldmethod=marker

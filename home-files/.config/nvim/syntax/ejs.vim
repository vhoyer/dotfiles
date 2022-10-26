" embeddedvim syntax file
" Language: embedded js
" Maintainer: Vinícius Hoyer

if exists("b:current_syntax")
  finish
endif

" Load syntax inside especial tags {{{
syntax include @jsAll syntax/javascript.vim
unlet! b:current_syntax

" replacer
syntax region embeddedvim_substitution matchgroup=Special start=/<%=\?/ keepend end=/%>/ contains=@jsAll containedin=ALL
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

let b:current_syntax = "ejs"

" vim: foldmethod=marker


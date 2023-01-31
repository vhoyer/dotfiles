" embeddedjs syntax file
" Language: embedded js
" Maintainer: Vinícius Hoyer

if exists("b:current_syntax")
  finish
endif

" Load syntax inside especial tags {{{
syntax include @jsAll syntax/javascript.vim
unlet! b:current_syntax

syntax match ejsComment contained /.*/
syntax region ejs_comment start=/<%#/ keepend end=/%>/ contains=ejsComment containedin=ALL
hi link ejsComment Comment

" replacer
syntax region ejs_javascript matchgroup=Special start=/<%[_=-]\?\(#\)\@!/ keepend end=/[-_]\?%>/ contains=@jsAll containedin=ALL
" }}}

" Load the other syntax for the file based on sub.extension {{{
let s:extensions_dict = {
      \ 'js': 'javascript',
      \}
let s:extension = split(substitute(expand('%:t'), "\\.ejs$", "", ""), '\.')[-1]
let s:filetype = get(s:extensions_dict, s:extension, s:extension)

" prevent context syntax regions with "extend" option to mess with external
" syntax highlighting
execute 'syntax include @context syntax/'.s:filetype.'.vim'
unlet! b:current_syntax
syntax region ejs_context matchgroup=Special start=/[-_]\?%>/ end=/<%[_=-]\?\(#\)\@!/ keepend contains=@context containedin=@jsAll

" load rest of the syntax
execute 'runtime! syntax/'.s:filetype.'.vim'
unlet! b:current_syntax
" }}}

" exceptions for html {{{
syn clear htmlTagError " it's ugly and I don't know how to get rid of this otherwise
syn clear htmlError " it's ugly and I don't know how to get rid of this otherwise
" }}}

let b:current_syntax = "ejs"

" vim: foldmethod=marker


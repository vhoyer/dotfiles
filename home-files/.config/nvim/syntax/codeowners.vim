" CODEOWNERS syntax file
" Language: None
" Maintainer: Vinícius Hoyer

if exists("b:current_syntax")
  finish
endif

syntax region Comment start=/^#/ end=/$/
syntax match Identifier /\(\s\)\@<=@\S\+/

let b:current_syntax = "CODEOWNERS"

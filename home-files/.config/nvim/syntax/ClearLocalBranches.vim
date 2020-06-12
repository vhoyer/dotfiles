" Clear Local Branch syntax file
" Language: None
" Maintainer: Vinícius Hoyer

if exists("b:current_syntax")
  finish
endif

syntax region Comment start=/^#/ end=/$/

let b:current_syntax = "ClearLocalBranches"

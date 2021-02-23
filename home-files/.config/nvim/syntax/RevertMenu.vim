" RevertMenu syntax file
" Language: None
" Maintainer: Vinícius Hoyer

if exists("b:current_syntax")
  finish
endif

syntax region Comment start=/^#/ end=/$/
syntax region Comment start=/^r/ end=/$/
syntax region GitStuff matchgroup=Type start=/^k/ end=/$/

syntax match CommitHash /\v<\x{7,}>/ containedin=GitStuff

highlight link CommitHash Identifier

let b:current_syntax = "RevertMenu"

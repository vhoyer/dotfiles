" dotenv as https://www.npmjs.com/package/dotenv#rules describe
" Language: None
" Maintainer: Vinícius Hoyer

if exists("b:current_syntax")
  finish
endif

syntax region Comment start=/^#/ end=/$/
syntax match Identifier /\w\+\(=\)\@=/
syntax match String /\(=\)\@<=.\+$/

let b:current_syntax = "ClearLocalBranches"

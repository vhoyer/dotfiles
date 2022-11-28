iabbrev <buffer> configs configurations
iabbrev <buffer> config configuration
iabbrev <buffer> cuz because

setlocal spell
setlocal breakindentopt=shift:0
setlocal shiftwidth=4

"
" invert behaviour of j/k and gj/gk
"
nnoremap <buffer> j gj
nnoremap <buffer> k gk
nnoremap <buffer> gj j
nnoremap <buffer> gk k

" To align tables
vnoremap <Leader><Bslash> :EasyAlign*<Bar><Enter>

augroup ReloadSyntax
  autocmd! * <buffer>
  autocmd BufEnter <buffer> syntax sync fromstart
augroup END

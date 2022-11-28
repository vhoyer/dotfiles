source ~/.config/nvim/ftplugin/javascript.vim

syntax sync fromstart
setlocal suffixesadd+=.vue,/index.vue

inoremap <buffer> }} {{  }}<left><left><left>
inoremap <buffer> {{{ {},<left><left><CR><esc>O
inoremap <buffer> >>> >>>

augroup ReloadSyntax
  autocmd! * <buffer>
  autocmd BufEnter <buffer> syntax sync fromstart
augroup END

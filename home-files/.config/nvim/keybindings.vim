let mapleader = "\<Space>"

" prevent opening of Ex mode, which I dont like :(
nnoremap Q <nop>

" esc key to jk in terminal, insert and command mode
tnoremap jk <c-\><c-n>
inoremap jk <esc>
cnoremap jk <esc>

" jump to begin and end of an line in normal and visual mode
nnoremap <leader>h ^
nnoremap <leader>l $
vnoremap <leader>h ^
vnoremap <leader>l $

" save file with <leader>s
nnoremap <leader>s <esc>:w<cr>

vnoremap s :sort<cr>

"
" find replace in the same buffer
"
vnoremap R y:%s/<C-R>"/<C-R>"/gc<left><left><left>
vnoremap RR y:%s/<C-R>"//gc<left><left><left>

"
" prevent pasting in insert mode to mess with indentation
"
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" set a sane version of Y to yank till end of the line
nnoremap Y y$

" tab management
nnoremap <c-n> <esc>:tabe %<cr><C-o>

" refresh file
nnoremap <leader>r <esc>:e!<cr>

" search for selected bit
vnoremap // "yy/\<<c-r>y\><cr>

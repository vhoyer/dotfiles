nnoremap <leader>b <esc>:Git blame<cr>
nnoremap <leader>c <esc>:Git commit<cr>
vnoremap <c-f> "yy:Ggrep "<C-r>y"<cr><Esc>:copen<cr>

" open diff
nnoremap <leader>gd :Gvdiff<CR>
" take from the left
nnoremap gdh :diffget //2<CR>
" take from the right
nnoremap gdl :diffget //3<CR>

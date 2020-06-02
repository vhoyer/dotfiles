let mapleader = "\<Space>"

" prevent opening of Ex mode, which I dont like :(
nnoremap Q <nop>

"
" esc key to jk in insert and command mode
"
inoremap jk <esc>
cnoremap jk <esc>

"
" jump to begin and end of an line in normal and visual mode
"
nnoremap <leader>h ^
nnoremap <leader>l $
vnoremap <leader>h ^
vnoremap <leader>l $

" save file with ease
nnoremap <leader>w <esc>:w<cr>

vnoremap s :sort<cr>

" find replace in the same buffer
vnoremap R y:%s/<C-R>"/<C-R>"/gc<left><left><left>

"
" find replace inside visual line selection
" ref: https://www.reddit.com/r/vim/comments/9n45h2/mapping_only_in_visual_line_mode/
"
xnoremap <expr> RR {'v':      "\"yy",
                  \ 'V':      ":s/<C-R>y/<C-R>y/gc<left><left><left>",
                  \ }[mode()]

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
vnoremap // "yy/\<<c-r>y\><cr>N

"
" super scroll
"
nnoremap <c-e> 6<c-e>
nnoremap <c-y> 6<c-y>

" apply the first suggestion for the bad spelled word
nnoremap <leader>cw 1z=

let g:currentLang = 0
let g:myLangList = [ "en", "pt_br" ]

function! ToggleSpellCheckLang()
	"loop through languages
	let g:currentLang = g:currentLang + 1
	if g:currentLang >= len(g:myLangList)
		let g:currentLang = 0
	endif

	execute "set spelllang=".get(g:myLangList, g:currentLang)
endfunction

nnoremap <silent> <leader>s <esc>:call ToggleSpellCheckLang()<cr>

" shortcut to past from " registry in insert mode
inoremap <c-r><c-r> <c-r>"

" prevent wrong use of ç in normal mode due to keyboard layout difference
nnoremap Ç :

" paste without overriding the registry, this binding overrides default |gp|
vnoremap gp "_dP

" open terminal on horizontal split
nnoremap <leader>t <esc><c-w>s:terminal<cr>A
" open terminal on vertical split
nnoremap <leader>T <esc><c-w>v:terminal<cr>A

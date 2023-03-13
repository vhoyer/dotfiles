let mapleader = "\<Space>"

" prevent opening of Ex mode, which I dont like :(
nnoremap Q <nop>
" prevent push to talk key from messing on insert mode
inoremap <F9> <nop>

"
" esc key to jk in insert and command mode
"
inoremap jk <esc>
cnoremap jk <esc>

" this is to fix any InsertLeave autocmd present in the config if the user uses Ctrl-C to exit insert mode
inoremap <C-c> <esc>

"
" jump to begin and end of an line in normal and visual mode
"
"nnoremap <leader>h ^
"nnoremap <leader>l $
"vnoremap <leader>h ^
"vnoremap <leader>l $

" save file with ease
nnoremap <leader>w <esc>:w<cr>

" sort selection
vnoremap ,s :sort<cr>

" find replace in the same buffer
" take extra steps to escape everything so the substitution always works
vnoremap R "sy:let @p=escape(@s,'^$.*?/\\[]~')<cr>:let @s=escape(@s, '\\')<cr>:%s/<C-R>p/<C-R>s/gc<left><left><left>

"
" find replace inside visual line selection
" ref: https://www.reddit.com/r/vim/comments/9n45h2/mapping_only_in_visual_line_mode/
"
xnoremap <expr> RR {'v':      "\"yy",
                  \ 'V':      ":s/<C-R>y/<C-R>y/gc<left><left><left>",
                  \ }[mode()]

" go to next git conflict
nnoremap ,c /=======<cr>

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
vnoremap // "yy:let @y=escape(@y,'^$.*?/\\[]~')<cr>/\<<c-r>y\><cr>N
vnoremap ?? "yy:let @y=escape(@y,'^$.*?/\\[]~')<cr>/<c-r>y<cr>N

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

" paste without overriding the registry
vnoremap zp "_dP

if has('nvim')
	" open terminal on horizontal split
	nnoremap <leader>t <esc><c-w>s:terminal<cr>A
	" open terminal on vertical split
	nnoremap <leader>T <esc><c-w>v:terminal<cr>A
else
	" open terminal on horizontal split
	nnoremap <silent> <leader>t <esc>:terminal<cr>
	" open terminal on vertical split
	nnoremap <silent> <leader>T <esc>:vertical terminal<cr>
endif

"
" copy to clipboard current link to GitHub
"
function! s:GithubLinkToClipboard(line1, count)
	let remote = 'origin'

	let default_branch = system('git config --get init.defaultBranch')
	let default_branch = substitute(default_branch, '[\x0]', '', 'g')
	" 'main'
	let current_branch = system('git status -sb | head -1')
	let current_branch = substitute(current_branch, '[\x0]\|^##\s', '', 'g')
	" 'feat-branch...origin/feat-branch' | 'feat-branch'

	let branch = (default_branch)
	let regex_has_remote = ('\.\.\.'.remote.'\/')
	if matchstr(current_branch, regex_has_remote) > -1
		let branch = substitute(current_branch, '^.*'.regex_has_remote, '', '')
	endif

	let fetch = system('git remote show '.remote.' -n | grep "Fetch URL"')
	let fetch = substitute(fetch, '^.*URL:\s\+\|[\x0]', '', 'g')
	" 'git@github.com:/quero-edu/quero-cli'
	let user = substitute(fetch, '.*\/\([^/]\+\)\/\([^/]\+\)$', '\1', '')
	let repo = substitute(fetch, '.*\/\([^/]\+\)\/\([^/]\+\)$', '\2', '')

	let file = expand('%p')

	let lines = ''
	let line1 = a:count > 0 ? a:line1 : 0
	let line2 = a:count > 0 ? a:count : 0
	if (line2 > 0 && line1 == line2)
		let lines = ('\#L'.line1)
	elseif (line1 > 0 && line2 > 0)
		let lines = ('\#L'.line1.'-L'.line2)
	endif

	let link = ('https://github.com/'.user.'/'.repo.'/blob/'.branch.'/'.file.lines)

	exec '!echo '.shellescape(link).' | xclip -selection clipboard -in'
endfunction
command! -range=-1 GithubLinkToClipboard :call <SID>GithubLinkToClipboard(<line1>, <count>)
noremap <leader>gl :GithubLinkToClipboard<CR>

"
" inspect a commit sha/hash by spawning a git show on it
"
" this is basically a command to be used during interactive git rebasing
"
function! s:GitShowCommitHashUnderCursor()
	let commit_hash = expand('<cword>')

	" split screen
	vsplit
	" open the show command
	exec 'terminal git show '.commit_hash
	" enter insert mode to easily manipulate the terminal
	normal i
endfunction
command! GitShowCommitHashUnderCursor :call s:GitShowCommitHashUnderCursor()
noremap <leader>gs :GitShowCommitHashUnderCursor<CR>

function! s:LoremPicsum()
	let url = 'https://picsum.photos/200/300'

	exec 'normal i' . url
endfunction
command! Picsum :call s:LoremPicsum()

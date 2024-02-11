" hide "-- INSERT --" cuz the statusline already show it
set noshowmode

" Define symbols to make the line more lean
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.paste = 'ρ'

" Normalize the word count display
let g:airline#extensions#wordcount#formatter#default#fmt = '%sw'
let g:airline#extensions#wordcount#formatter#default#fmt_short = '%sw'

" Remove VCS information (branch, hunk summary) (master) and stuff
let g:airline_section_b = ''
" Remove file encoding[fileformat] (utf-8[unix]) and stuff
let g:airline_section_y = ''

" Better display filename on the tab bar at the top, cuz pair programming feels bad without it
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Hide buffer open on the current window, cuz this information is useless :D
let g:airline#extensions#tabline#show_splits = 0

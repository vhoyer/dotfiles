" hide "-- INSERT --" cuz the statusline already show it
set noshowmode

" Define symbols to make the line more lean
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.spell = '󰓆'
let g:airline_symbols.paste = '󰆒'

" Normalize the word count display
let g:airline#extensions#wordcount#formatter#default#fmt = '%sw'
let g:airline#extensions#wordcount#formatter#default#fmt_short = '%sw'

" Remove VCS information (branch, hunk summary) (master) and stuff
let g:airline_section_b = ''
" Remove file encoding[fileformat] (utf-8[unix]) and stuff
let g:airline_section_y = ''
" %p - percentage of the file
" %% - literal percentage sign
" %l - current line number
" %L - total number of lines
" %v - virtual column number
" display if the current window is winfixwidth
let g:airline_section_z = '%p%% 󰚈 %l/%L 󰚉 %v%{ &winfixwidth ? " 󰤳" : "" }'
let g:airline_section_z_term = '󰚈 %l/%L%{ &winfixwidth ? " 󰤳" : "" }'

" Better display filename on the tab bar at the top, cuz pair programming feels bad without it
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Hide buffer open on the current window, cuz this information is useless :D
let g:airline#extensions#tabline#show_splits = 0

" Abbreviate the mode names
let g:airline_mode_map = {
			\ '__'     : '-',
			\ 'c'      : 'CMD',
			\ 'i'      : 'I',
			\ 'ic'     : 'I',
			\ 'ix'     : 'I',
			\ 'n'      : 'N',
			\ 'multi'  : 'M',
			\ 'ni'     : 'N',
			\ 'no'     : 'N',
			\ 'R'      : 'R',
			\ 'Rv'     : 'R',
			\ 's'      : 'S',
			\ 'S'      : 'S',
			\ '␓'      : 'S',
			\ 't'      : 'TERM',
			\ 'v'      : 'V',
			\ 'V'      : 'V',
			\ '␖'      : 'V',
			\ }

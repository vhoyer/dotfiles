if has('nvim')
	augroup TerminalStuff
		autocmd!
		autocmd TermOpen * setlocal nonumber
		autocmd TermOpen * setlocal norelativenumber
		autocmd TermOpen * setlocal nospell

		" fix terminal width to the size it was when the terminal was opened
		autocmd TermOpen * setlocal winfixwidth
		autocmd TermClose * setlocal nowinfixwidth
	augroup END
endif

augroup ReloadThingsIfConfigFilesChanges
	autocmd!
	autocmd BufWritePost */.i3/* !i3-msg reload
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
augroup END

augroup DashUnderlineCompletion
	" autocmd!
	" autocmd InsertEnter *.* set isk +=_
	" autocmd InsertLeave *.* set isk -=_
	" autocmd InsertEnter *.* set isk +=\-
	" autocmd InsertLeave *.* set isk -=\-
augroup END

augroup RemoveTrailingSpace
	autocmd!
	autocmd BufWritePre * if (index(['snapshot', 'diff'], &filetype) == -1) | %s/\s\+$//e
augroup END

augroup FiletypeOverride
	autocmd!
	autocmd FileType json set filetype=jsonc
augroup END

augroup ColorSchemeOverrides
	autocmd!
	autocmd ColorScheme * highlight SpellBad cterm=underline
	autocmd ColorScheme * highlight link Operator Normal
	autocmd ColorScheme * highlight link Operator GruvboxFg1
augroup END

if ! exists('g:neovide')
	augroup TransparentBGOnTerm
		autocmd!
		autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
	augroup END
endif

augroup CursorLine
	autocmd!
	autocmd VimEnter * setlocal cursorline
	autocmd WinEnter * setlocal cursorline
	autocmd BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END


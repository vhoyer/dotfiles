augroup TerminalStuff
	autocmd!
	autocmd TermOpen * setlocal nonumber
	autocmd TermOpen * setlocal norelativenumber
	autocmd TermOpen * setlocal nospell
augroup END

augroup CocRelated
	autocmd!
	autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

augroup ReloadThingsIfConfigFilesChanges
	autocmd!
	autocmd BufWritePost */.i3/* !i3-msg reload
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
augroup END

augroup DashUnderlineCompletion
	autocmd!
	autocmd InsertEnter *.* set isk +=_
	autocmd InsertLeave *.* set isk -=_
	autocmd InsertEnter *.* set isk +=\-
	autocmd InsertLeave *.* set isk -=\-
augroup END

augroup RemoveTrailingSpace
	autocmd!
	autocmd BufWritePre * if index(['snap', 'diff'], &ft) < 0 | %s/\s\+$//e
augroup END

augroup FiletypeForUnknowns
	autocmd!
	autocmd BufNewFile,BufRead *.svelte setfiletype svelte
augroup END

augroup SpellChecking
	autocmd!
	autocmd ColorScheme * hi SpellBad cterm=underline
augroup END

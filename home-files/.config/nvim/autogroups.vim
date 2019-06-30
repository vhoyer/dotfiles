if !has("autocmd") || exists("g:loaded_augroups")
	finish
endif

let g:loaded_augroups = 1

augroup TerminalStuff
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

augroup CocRelated
	autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

augroup ReloadThingsIfConfigFilesChanges
	autocmd BufWritePost */.i3/* !i3-msg reload
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
augroup END

augroup DashUnderlineCompletion
	autocmd InsertEnter *.* set isk +=_
	autocmd InsertLeave *.* set isk -=_
	autocmd InsertEnter *.* set isk +=\-
	autocmd InsertLeave *.* set isk -=\-
augroup END

augroup RemoveTrailingSpace
	autocmd BufWritePre * %s/\s\+$//e
augroup END

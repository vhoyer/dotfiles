" https://github.com/junegunn/fzf/blob/master/README-VIM.md

" open fzf in a floating window covering most of the current window on top of the current window
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'relative': v:true } }

let $FZF_DEFAULT_OPTS='--preview-window ''right,35%,border-left,<90(up,30%,border-bottom)'''

" make FZF see hidden lines in :Files<cr>
let $FZF_DEFAULT_COMMAND="rg --hidden -g '!.git' -l \"\""

" make :Rg<cr> see hidden files, cuz duh, why this is not default?
let s:rg_default_command = "rg --column --line-number --hidden --no-heading --ignore-file=".$HOME."/.global_rgignore --color=always --smart-case "
command! -bang -nargs=* Rg call fzf#vim#grep(s:rg_default_command . shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* RgFollow call fzf#vim#grep(s:rg_default_command . '--follow ' .shellescape(<q-args>), 1, <bang>0)

"
" choose from templates and apply to file
"
function! s:ReadTemplateIntoBuffer(template)
	execute '0r ~/.config/nvim/templates/'.a:template

	" Remove all trailing whitespace only line at the end of the file
	execute '%s/\($\n\s*\)\+\%$//'

	let l:replacer_pattern = '<%=\s*\(.\{-}\)\s*%>'
	call cursor(1, 1) " position cursor at the first char
	while search(l:replacer_pattern, 'W') > 0
		let l:replacer = matchstr(getline('.'), l:replacer_pattern)
		let l:replacer = substitute(l:replacer, '^<%=\s*\|\s*%>$', '', 'g')

		execute 's/<%=\s*'.l:replacer.'\s*%>/'.eval(l:replacer)."/"
	endwhile

	call cursor(1, 1) " reposition cursor at the top of the file

	if search('<%\s*cursor\s*%>') > 0
		" the ":s" command already positions the cursor at the place
		execute '%s/<%\s*cursor\s*%>//g'
	endif
endfunction

command! -bang -nargs=* LoadTemplate call fzf#run(fzf#wrap({
			\   'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true },
			\   'options': '--reverse',
			\   'source': 'ls -1 ~/.config/nvim/templates',
			\   'sink': function('<sid>ReadTemplateIntoBuffer')
			\ }))

"
" cd into a project
"
function! s:CdIntoProject(template)
	execute 'cd ~/src/'.a:template
endfunction

command! -bang -nargs=* ChangeProject call fzf#run(fzf#wrap({
			\   'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true },
			\   'options': '--reverse',
			\   'source': 'cd ~/src/ && rg --hidden --files --null | xargs -0 dirname | rg \.git$ | sort -u | sed -e ''s/\/\.git$//''',
			\   'sink': function('<sid>CdIntoProject')
			\ }))

"
" key mappings
"

" :Files [PATH]   " Files (similar to :FZF)
nnoremap <leader>fp <esc>:Files<cr>
" :GFiles [OPTS]  " Git files (git ls-files)
" :GFiles?        " Git files (git status)
" :Buffers        " Open buffers
nnoremap <leader>fb <esc>:Buffers<cr>
" :Colors         " Color schemes
" :Ag [PATTERN]   " ag search result (ALT-A to select all, ALT-D to deselect all)
" :Rg [PATTERN]   " rg search result (ALT-A to select all, ALT-D to deselect all)
nnoremap <f3> <esc>:Rg<cr>
nnoremap <leader><f3> <esc>viw"yy:Rg <c-r>y<cr>
vnoremap <leader><f3> "yy<esc>:Rg <c-r>y<cr>
" :Lines [QUERY]  " Lines in loaded buffers
" :BLines [QUERY] " Lines in the current buffer
nnoremap <leader>ff <esc>:BLines<cr>
" :Tags [QUERY]   " Tags in the project (ctags -R)
" :BTags [QUERY]  " Tags in the current buffer
" :Marks          " Marks
" :Windows        " Windows
nnoremap <leader>fw <esc>:Windows<cr>
" :Locate PATTERN " locate command output
" :History        " v:oldfiles and open buffers
" :History:       " Command history
" :History/       " Search history
" :Snippets       " Snippets (UltiSnips)
" :Commits        " Git commits (requires fugitive.vim)
" :BCommits       " Git commits for the current buffer
nnoremap <leader>fl <esc>:BCommits<cr>
" :Commands       " Commands
nnoremap <leader>fc <esc>:Commands<cr>
" :Maps           " Normal mode mappings
" :Helptags       " Help tags 1
nnoremap <f1> <esc>:Helptags<cr>
" :Filetypes      " File types

let b:hi_attr_indent = 1

function! HtmlIndentCustom()
	let cline = v:lnum
	let prev = prevnonblank(cline - 1)

	if getline(cline) =~ '^\s*>'
		call cursor(cline, 1)
		let start = searchpairpos('<\w', '', '>', 'bW',
					\ 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string"')[0]
		if start > 0
			return indent(start)
		endif
	endif

	if prev > 0 && getline(prev) =~ '^\s*>$'
		call cursor(prev, 1)
		let start = searchpairpos('<\w', '', '>', 'bW',
					\ 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string"')[0]
		if start > 0
			return indent(start) + shiftwidth()
		endif
	endif

	return HtmlIndent()
endfunction

setlocal indentexpr=HtmlIndentCustom()

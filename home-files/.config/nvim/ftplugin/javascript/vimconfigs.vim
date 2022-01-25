setlocal suffixesadd+=.js,.json,/index.js,/package.json
setlocal path+=.,,src,node_modules

function! MakeMagic(fname)
	let filename = a:fname
	let toRemoveList = [
			\["^\\~/", ""],
			\["^\\~\\~/", ""],
			\]

	for [toRemove, flags] in toRemoveList
		let filename = substitute(filename,toRemove,'',flags)
	endfor

	for base in split(&path, ',')
		for suffix in split(&suffixesadd, ',')
			let filenameToTest = base . '/' . filename . suffix

			" " Implement this one day, if you find necessary, sauce:
			" " https://damien.pobel.fr/post/configure-neovim-vim-gf-javascript-import/
			" let nodeModules = './node_modules/'
			" let packageJsonPath = nodeModules . a:fname . '/package.json'
			" return nodeModules . a:fname . '/' . json_decode(join(readfile(packageJsonPath))).main

			echom 'Testing: ' . filenameToTest

			if filereadable(filenameToTest)
				return filenameToTest
			endif
		endfor
	endfor

	return filename
endfunction

setlocal includeexpr=MakeMagic(v:fname)

setlocal suffixesadd+=.js,.json,/index.js,/package.json
setlocal path+=.,,src,node_modules
setlocal includeexpr=substitute(substitute(v:fname,'^\\~/','',''),'^\\~\\~/','','')

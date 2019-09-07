" import javascript as a base
for f in split(glob('~/.config/nvim/ftplugin/javascript/*.vim'), '\n')
	exe 'source' f
endfor

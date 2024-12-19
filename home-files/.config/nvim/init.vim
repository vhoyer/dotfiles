execute 'source ' . fnamemodify(stdpath('config'), ':p') . 'keybindings.vim'
execute 'source ' . fnamemodify(stdpath('config'), ':p') . 'vimconfigs.vim'
execute 'source ' . fnamemodify(stdpath('config'), ':p') . 'autogroups.vim'
execute 'source ' . fnamemodify(stdpath('config'), ':p') . 'plugins.vim'

let localconfig = fnamemodify(stdpath('config'), ':p') . 'local.vim'
if filereadable(localconfig)
  execute 'source ' . localconfig
endif

if exists('g:neovide')
	execute 'source ' . fnamemodify(stdpath('config'), ':p') . 'neovide.vim'
endif

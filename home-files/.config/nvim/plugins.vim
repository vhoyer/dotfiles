let s:after_scripts = []

" Function that runs Plug and add a file named after the name of the plugin +
" '.vim' to the after_scripts list. The parameters it receive are arrays where
" the first element is the name of the plugin and the rest are just forwarded
" to Plug, related plugins can be setup in the same call.
function s:PlugSetup(...)
	for plugin in a:000
		let filename = substitute(plugin[0], '/', '__', '')
		let plugin[0] = "'".plugin[0]."'"
		execute 'Plug ' . join(plugin, ', ')

		let config_file = stdpath('config') . '/plugins-config/' . filename

		let extension = ['.lua', '.vim']
		for ext in extension
			if ! filereadable(config_file . ext)
				continue
			endif

			call add(s:after_scripts, config_file . ext)
		endfor
	endfor
endfunction

" plugins saved to {stdpath('data').'/plugged'='~/.local/share/nvim/plugged'} by default
call plug#begin()

call s:PlugSetup(['airblade/vim-gitgutter'])
call s:PlugSetup(['ap/vim-css-color'])
call s:PlugSetup(['editorconfig/editorconfig-vim'])
call s:PlugSetup(['github/copilot.vim'])
call s:PlugSetup(['hail2u/vim-css3-syntax'])
call s:PlugSetup(['iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}])
call s:PlugSetup(
			\ ['junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}],
			\ ['junegunn/fzf.vim'],
			\ )
call s:PlugSetup(['junegunn/goyo.vim'])
call s:PlugSetup(['junegunn/vim-easy-align'])
call s:PlugSetup(['junegunn/vim-peekaboo'])
call s:PlugSetup(['mattn/emmet-vim'])
call s:PlugSetup(['morhetz/gruvbox'])
call s:PlugSetup(['neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile' }])
call s:PlugSetup(['sheerun/vim-polyglot'])
call s:PlugSetup(['simnalamburt/vim-mundo'])
call s:PlugSetup(['stefandtw/quickfix-reflector.vim'])
call s:PlugSetup(['tomtom/tcomment_vim'])
call s:PlugSetup(
			\ ['tommcdo/vim-fugitive-blame-ext'],
			\ ['tpope/vim-fugitive'],
			\ ['tpope/vim-rhubarb'],
			\ )
call s:PlugSetup(
			\ ['tpope/vim-repeat'],
			\ ['tpope/vim-surround'],
			\ )
call s:PlugSetup(['tveskag/nvim-blame-line'])
call s:PlugSetup(['unblevable/quick-scope'])
call s:PlugSetup(['vhoyer/neoranger', { 'branch': 'patch-1' }]) " Plug 'Lokaltog/neoranger'
call s:PlugSetup(['vhoyer/vim-vue', { 'branch': 'add-support-for-gridsome-graphql' }]) " Plug 'posva/vim-vue'
call s:PlugSetup(['vim-airline/vim-airline'])
call s:PlugSetup(['wakatime/vim-wakatime'])

" script making
call s:PlugSetup(['junegunn/vader.vim'])
call s:PlugSetup(['tpope/vim-scriptease'])

call plug#end()

" enable ftplugings
filetype plugin on

" iterate over the after_scripts and source them
for script in s:after_scripts
	execute 'source ' . script
endfor

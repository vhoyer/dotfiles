if [[ $OSTYPE == "linux-gnu" ]]; then
	$apps
	if [[ $(which git) == "" ]]; then
		$apps = $apps + " git"
	fi
	if [[ $(which vim) == "" ]]; then
		$apps = $apps + " vim"
	fi
	if [[ $(which ctags) == "" ]]; then
		$apps = $apps + " exuberant-ctags"
	fi

	if [[ $apps != "" ]]; then
		sudo apt-get install -y $apps
	fi

	if [ -d "~/.vim" ]; then
		mkdir ~/.vim-tmp ~/.vim/bundle/Vundle.vim
		git clone http://github.com/Vundlevim/Vundle.vim ~/.vim/bundle/Vundle.vim
		vim +PluginInstall +qall
	fi
fi

if [[ $OSTYPE == "linux-gnu" ]]; then
	apps=""
	if [[ $(which git) == "" ]]; then
		apps=$apps" git"
	fi
	if [[ $(which vim) == "" ]]; then
		apps=$apps" vim vim-gtk"
	fi
	if [[ $(which ctags) == "" ]]; then
		apps=$apps" exuberant-ctags"
	fi
	if [[ $(which apache2) == "" ]]; then
		apps=$apps" apache2"
	fi
	if [[ $(which php) == "" ]]; then
		apps=$apps" libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-json php-memcached php7.0-dev php7.0-mcrypt php7.0-sqlite3"
		phpenmod mcrypt
	fi

	if [[ ( $apps != "" ) && ( `uname -n` == *"ubuntu" ) ]]; then
		sudo apt-get update && sudo apt-get upgrade
		for i in $apps; do
			sudo apt-get install -y $i
		done
	fi

	if [ -d "~/.vim" ]; then
		mkdir ~/.vim-tmp ~/.vim/bundle/Vundle.vim
		git clone http://github.com/Vundlevim/Vundle.vim ~/.vim/bundle/Vundle.vim
		vim +PluginInstall +qall
	fi
fi

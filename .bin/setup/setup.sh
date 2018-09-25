#!/bin/bash

InstallVimPlugins(){
	mkdir ~/.vim-tmp ~/.vim ~/.vim/bundle/
	git clone http://github.com/Vundlevim/Vundle.vim ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
}

InstallTmuxPluginManager(){
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	echo "Enter tmux and press 'prefix + I' to install the other plugins"
}

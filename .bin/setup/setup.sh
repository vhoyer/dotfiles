#!/bin/bash

InstallVimPlugins(){
	mkdir ~/.vim-tmp ~/.vim ~/.vim/bundle/
	git clone http://github.com/Vundlevim/Vundle.vim ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
}

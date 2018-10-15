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

InstallFzf(){
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
}

#node version manager
InstallNvm(){
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
}

InstallApt(){
	./addppa
	apt install -y $(aptpackages)
}

configureGnomeEnviroment(){
	#apply configurations from that file to touchpad
	gsettings set org.gnome.settings-daemon.peripherals.input-devices hotplug-command "/home/$USER/.bin/setup/helper/touchpad_settings.sh"
}

while (($#))
do
	eval $1

	shift || break
done

# vim: noet ts=4 sw=4 sts=4 fdm=marker

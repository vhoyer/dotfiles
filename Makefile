all: install-programs setup-i3 setup-zsh setup-git

install-programs:
	sudo pacman -Syu --noconfirm `cat ./packages/pacman-install.txt`
	yes | yay -S --nodiffmenu --nocleanmenu `cat ./packages/yay-install.txt`

setup-i3:
	sudo xdg-settings set default-web-browser google-chrome.desktop
	rm -rf ${HOME}/.i3
	ln -s $(realpath ./home-files/.i3/) ${HOME}
	i3-msg reload

setup-zsh:
	rm -f ${HOME}/{.zshrc,./.zcompdump}
	ln -s $(realpath ./home-files/.zshrc) ${HOME}
	ln -s $(realpath ./home-files/.zcompdump) ${HOME}
	sudo chsh -s /bin/zsh ${USER}

setup-ranger:
	rm -rf ${HOME}/.config/ranger/
	ln -s $(realpath ./home-files/.config/ranger/) ${HOME}/.config/

setup-git:
	rm -f ${HOME}/{.gitconfig,.global_gitignore}
	ln -s $(realpath ./home-files/.gitconfig) ${HOME}
	ln -s $(realpath ./home-files/.global_gitignore) ${HOME}

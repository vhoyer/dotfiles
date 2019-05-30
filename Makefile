all: install-programs setup-i3 setup-git

install-programs:
	sudo pacman -S --noconfirm `cat ./packages/pacman-install.txt`
	yay -S --nodiffmenu --nocleanmenu `cat ./packages/yay-install.txt`

setup-i3:
	sudo xdg-settings set default-web-browser google-chrome.desktop
	rm -rf ${HOME}/.i3
	ln -s $(realpath ./home-files/.i3/) ${HOME}
	i3-msg reload

setup-git:
	rm -f ${HOME}/{.gitconfig,.global_gitignore}
	ln -s $(realpath ./home-files/.gitconfig) ${HOME}
	ln -s $(realpath ./home-files/.global_gitignore) ${HOME}

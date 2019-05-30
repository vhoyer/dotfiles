all: install-programs setup-git

install-programs:
	sudo pacman -S --noconfirm `cat ./packages/pacman-install.txt`
	yay -S --nodiffmenu --nocleanmenu `cat ./packages/yay-install.txt`

setup-git:
	rm -f ${HOME}/{.gitconfig,.global_gitignore}
	ln -s $(realpath ./home-files/.gitconfig) ${HOME}
	ln -s $(realpath ./home-files/.global_gitignore) ${HOME}

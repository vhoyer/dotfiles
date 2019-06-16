install-dependencies:
	sudo pacman -Syu --noconfirm `cat ./packages/pacman-install.txt`
	yay -S --nodiffmenu --nocleanmenu `cat ./packages/yay-install.txt`

setup: system-config i3 oh-my-zsh dotconfig nvim st git 

system-config:
	sudo xdg-settings set default-web-browser google-chrome.desktop
	sudo timedatectl set-ntp true

i3:
	rm -rf ${HOME}/.i3
	ln -s $(realpath ./home-files/.i3/) ${HOME}
	i3-msg reload

oh-my-zsh:
	rm -f ${HOME}/{.zshrc,.zcompdump}
	ln -s $(realpath ./home-files/.zshrc) ${HOME}
	ln -s $(realpath ./home-files/.zcompdump) ${HOME}
	sudo chsh -s /bin/zsh ${USER}
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

dotconfig:
	rm -rf ${HOME}/.config/ranger
	ln -s $(realpath ./home-files/.config/ranger/) ${HOME}/.config/

nvim:
	rm -rf ${HOME}/.config/nvim
	ln -s $(realpath ./home-files/.config/nvim/) ${HOME}/.config/
	curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim -u ${HOME}/.config/nvim/plugins.vim +PlugInstall +UpdateRemotePlugins +qa

st:
	mkdir -p ${HOME}/devenv/
	rm -rf ${HOME}/devenv/st/
	git clone https://github.com/LukeSmithxyz/st ${HOME}/devenv/st/
	sudo make -C ${HOME}/devenv/st install

git:
	rm -f ${HOME}/{.gitconfig,.global_gitignore}
	ln -s $(realpath ./home-files/.gitconfig) ${HOME}
	ln -s $(realpath ./home-files/.global_gitignore) ${HOME}

redshift:
	rm -f ${HOME}/.config/redshift.conf
	ln -s $(realpath ./home-files/.config/redshift.conf) ${HOME}/.config/

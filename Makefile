install-dependencies:
	sudo pacman -Syu --noconfirm $$(cat ./packages/pacman-install.txt)
	yay -S --nodiffmenu --nocleanmenu $$(cat ./packages/yay-install.txt)

setup: system-config i3 oh-my-zsh dotconfig dotlocal nvim st git fzf nvm folder-mapping betterlockscreen

system-config:
	sudo xdg-settings set default-web-browser google-chrome.desktop
	sudo timedatectl set-ntp true
	rm -f ${HOME}/{.profile,.Xresources}
	ln -s $(realpath ./home-files/.profile) ${HOME}
	ln -s $(realpath ./home-files/.Xresources) ${HOME}

i3:
	rm -rf ${HOME}/.i3
	ln -s $(realpath ./home-files/.i3/) ${HOME}
	i3-msg reload

betterlockscreen: i3lock-color
	rm -rf ${HOME}/src/betterlockscreen
	git clone https://github.com/pavanjadhaw/betterlockscreen ${HOME}/src/betterlockscreen
	cp -f ${HOME}/src/betterlockscreen/betterlockscreen ./home-files/.local/bin/
	betterlockscreen -u ${HOME}/Pictures/wallpaper/john-sommo-untitled-3.jpg
	rm -f ${HOME}/.config/betterlockscreenrc
	ln -s $(realpath ./home-files/.config/betterlockscreenrc) ${HOME}/.config/

i3lock-color:
	mkdir -p ${HOME}/Documents/backup/
	rm -rf /tmp/i3lock-color
	git clone https://github.com/PandorasFox/i3lock-color /tmp/i3lock-color;
	cd /tmp/i3lock-color; git checkout $$(git describe --abbrev=0)
	cd /tmp/i3lock-color; autoreconf --force --install
	cd /tmp/i3lock-color; rm -rf build
	cd /tmp/i3lock-color; mkdir -p build
	cd /tmp/i3lock-color/build; ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
	cd /tmp/i3lock-color/build; make
	cd /tmp/i3lock-color/build; sudo mv -t ${HOME}/Documents/backup/ /usr/bin/i3lock
	cd /tmp/i3lock-color/build; sudo cp -t /usr/bin/ ./i3lock

oh-my-zsh:
	sudo chsh -s /bin/zsh ${USER}
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	rm -f ${HOME}/{.zshrc}
	ln -s $(realpath ./home-files/.zshrc) ${HOME}

dotconfig:
	rm -rf ${HOME}/.config/{ranger,mimeapps.list}
	ln -s $(realpath ./home-files/.config/ranger/) ${HOME}/.config/
	ln -s $(realpath ./home-files/.config/mimeapps.list) ${HOME}/.config/

dotlocal:
	rm -rf ${HOME}/.local/bin/
	ln -s $(realpath ./home-files/.local/bin/) ${HOME}/.local/bin

nvim:
	rm -rf ${HOME}/.config/nvim
	ln -s $(realpath ./home-files/.config/nvim/) ${HOME}/.config/
	curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim -u ${HOME}/.config/nvim/plugins.vim +PlugInstall +UpdateRemotePlugins +qa
	# wakatime.config
	rm -rf ~/.wakatime.cfg
	ln -s $(realpath ./home-files/.wakatime.cfg) ${HOME}

st:
	mkdir -p ${HOME}/src/
	rm -rf ${HOME}/src/st/
	git clone https://github.com/LukeSmithxyz/st ${HOME}/src/st/
	sudo make -C ${HOME}/src/st install

git:
	rm -f ${HOME}/{.gitconfig,.global_gitignore}
	ln -s $(realpath ./home-files/.gitconfig) ${HOME}
	ln -s $(realpath ./home-files/.global_gitignore) ${HOME}

redshift:
	rm -f ${HOME}/.config/redshift.conf
	ln -s $(realpath ./home-files/.config/redshift.conf) ${HOME}/.config/

fzf:
	rm -rf ${HOME}/.fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
	${HOME}/.fzf/install --key-bindings --completion --update-rc

nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

sxhkd:
	rm -rf ${HOME}/.config/sxhkd
	ln -s $(realpath ./home-files/.config/sxhkd) ${HOME}/.config/

folder-mapping:
	rm -rf ${HOME}/Pictures/wallpaper
	ln -s $(realpath ./home-files/Pictures/wallpaper) ${HOME}/Pictures/

#
# Dependencies:
#

help:
	@echo "First install dependencies by running make with one of these options:"
	@sed -n -e '/^\(#\|$$\|\t\)/d' -e's/:.*//' -e's/^install/\t\0/' -e'/^\t/p' <./Makefile
	@echo ""
	@echo "After installing dependencies, run make with one of these options to \
	configurate everything (or manually choose each recipe to run):"
	@sed -n -e '/^\(#\|$$\|\t\)/d' -e's/:.*//' -e's/^setup/\t\0/' -e'/^\t/p' <./Makefile
	@echo ""

flavor-manjaro-gnome:
	$(eval SYSTEM := manjaro-gnome)
flavor-manjaro-i3:
	$(eval SYSTEM := manjaro-i3)
flavor-wls-ubuntu:
	$(eval SYSTEM := wls-ubuntu)

install-pacman: pacman-yay npm
install-apt: apt npm

apt:
	sudo apt update
	sudo apt --yes upgrade
	sudo apt --yes install $$(cat ./packages/$(SYSTEM)/apt.txt)

pacman-yay:
	sudo pacman -Syu --noconfirm $$(cat ./packages/$(SYSTEM)/pacman.txt)
	yay -S --nodiffmenu --nocleanmenu $$(cat ./packages/$(SYSTEM)/yay.txt)

npm:
	npm config set prefix ${HOME}/.local/npm
	npm install -g $$(cat ./packages/npm-install.txt)

#
# Configurations:
#

setup-manjaro-i3: system-config i3 oh-my-zsh dotconfig dotlocal vim st git fzf folder-mapping betterlockscreen
setup-manjaro-gnome: system-config oh-my-zsh dotconfig dotlocal vim git fzf folder-mapping
setup-ubuntu: oh-my-zsh dotconfig dotlocal vim git fzf folder-mapping

system-config:
	sudo xdg-settings set default-web-browser google-chrome.desktop
	sudo timedatectl set-ntp true
	ln -fs $(realpath ./home-files/.profile) ${HOME}
	ln -fs $(realpath ./home-files/.xprofile) ${HOME}
	ln -fs $(realpath ./home-files/.Xresources) ${HOME}

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
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || echo 'I think oh-my-zsh already exists'
	ln -fs $(realpath ./home-files/.zshrc) ${HOME}
	ln -fs $(realpath ./home-files/.zshrc.smartTitle) ${HOME}

dotconfig:
	for x in ranger mimeapps.list; do rm -rf ${HOME}/.config/$$x; done
	mkdir -p ${HOME}/.config/
	ln -s $(realpath ./home-files/.config/ranger/) ${HOME}/.config/
	ln -s $(realpath ./home-files/.config/mimeapps.list) ${HOME}/.config/

dotlocal:
	rm -rf ${HOME}/.local/bin/
	mkdir -p ${HOME}/.local/bin/
	ln -s $(realpath ./home-files/.local/bin/) ${HOME}/.local/bin

test:
	$${EDITOR-vim}

vim:
	for x in .config/nvim nvim .vim .vimrc .wakatime.cfg; do rm -rf ${HOME}/$$x; done
	mkdir -p ${HOME}/.config/
	ln -s $(realpath ./home-files/.wakatime.cfg) ${HOME}
	ln -s $(realpath ./home-files/.config/nvim/) ${HOME}/.config/
	ln -s $(realpath ./home-files/.config/nvim/) ${HOME} && mv ${HOME}/nvim ${HOME}/.vim
	ln -s $(realpath ./home-files/.config/nvim/init.vim) ${HOME}/ && mv ${HOME}/init.vim ${HOME}/.vimrc
	curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	$${EDITOR-vim} -u ${HOME}/.config/nvim/vimconfigs.vim -u ${HOME}/.config/nvim/plugins.vim +PlugInstall +UpdateRemotePlugins +qa

st:
	mkdir -p ${HOME}/src/
	rm -rf ${HOME}/src/st/
	git clone https://github.com/LukeSmithxyz/st ${HOME}/src/st/
	sudo make -C ${HOME}/src/st install

git:
	for x in .gitconfig .global_gitignore; do rm -f ${HOME}/$$x; done
	ln -s $(realpath ./home-files/.gitconfig) ${HOME}
	ln -s $(realpath ./home-files/.global_gitignore) ${HOME}

redshift:
	rm -f ${HOME}/.config/redshift.conf
	ln -s $(realpath ./home-files/.config/redshift.conf) ${HOME}/.config/

fzf:
	rm -rf ${HOME}/.fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
	${HOME}/.fzf/install --key-bindings --completion --update-rc

sxhkd:
	rm -rf ${HOME}/.config/sxhkd
	ln -s $(realpath ./home-files/.config/sxhkd) ${HOME}/.config/

folder-mapping:
	rm -rf ${HOME}/Pictures/wallpaper
	mkdir -p ${HOME}/Pictures/
	ln -s $(realpath ./home-files/Pictures/wallpaper) ${HOME}/Pictures/

docker:
	sudo systemctl start docker.service
	sudo systemctl enable docker.service
	# Allow docker without "sudo"
	sudo usermod -aG docker ${USER}

aws:
	# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
	aws --version
	rm -r awscliv2.zip aws/

kubectl:
	# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
	curl -LO "https://dl.k8s.io/release/$$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
	curl -LO "https://dl.k8s.io/$$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
	echo "$$(<kubectl.sha256) kubectl" | sha256sum --check
	sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
	kubectl version --client
	rm kubectl*

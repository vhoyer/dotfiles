FILE_FLAVOR:=/tmp/dotfiles-flavor
FILE_MANAGER:=/tmp/dotfiles-pkg-manager
FILE_SETUP:=/tmp/dotfiles-setup

$(shell touch ${FILE_FLAVOR})
$(shell touch ${FILE_MANAGER})
$(shell touch ${FILE_SETUP})

help:
	@echo "First choose the flavor you want for this installation:"
	@sed -n -e '/^\(#\|$$\|\t\)/d' -e's/:.*//' -e's/^flavor/\t\0/' -e'/^\t/p' <./Makefile
	@echo ""
	@echo "Then run 'make setup' to configure everything according to the flavor choosen."
	@echo "It's recommended to pay attention to the screen specially at the beginning of the setup,"
	@echo "package managers may inquire for confirmations."
	@echo ""

flavor-manjaro-gnome:
	echo 'manjaro-gnome' > $(FILE_FLAVOR)
	echo 'install-pacman' > $(FILE_MANAGER)
	echo 'setup-shared system-config' > $(FILE_SETUP)
flavor-manjaro-i3:
	echo 'manjaro-i3' > $(FILE_FLAVOR)
	echo 'install-pacman' > $(FILE_MANAGER)
	echo 'setup-shared system-config i3 st betterlockscreen' > $(FILE_SETUP)
flavor-wls-ubuntu:
	echo 'wls-ubuntu' > $(FILE_FLAVOR)
	echo 'install-apt' > $(FILE_MANAGER)
	echo 'setup-shared' > $(FILE_SETUP)

install: $(shell cat ${FILE_MANAGER})
setup: install $(shell cat ${FILE_FLAVOR})

#
# Dependencies:
#

install-pacman: pacman-yay npm fnm
install-apt: apt npm fnm

# apt install a very old nvim, so this makes up for it's shortcoming
neovim:
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz

fnm:
	# installs fnm (Fast Node Manager)
	curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

apt: neovim
	sudo apt update
	sudo apt --yes upgrade
	sudo apt --yes install $$(cat ./packages/$(shell cat ${FILE_FLAVOR})/apt.txt)

pacman-yay:
	sudo pacman -Syu --noconfirm $$(cat ./packages/$(shell cat ${FILE_FLAVOR})/pacman.txt)
	yay -S $$(cat ./packages/$(shell cat ${FILE_FLAVOR})/yay.txt)

npm:
	npm config set prefix ${HOME}/.local/npm
	npm install -g $$(cat ./packages/npm-install.txt)

#
# Configurations:
#

setup-shared: oh-my-zsh dotconfig dotlocal vim git fzf folder-mapping vh-cli

system-config:
	sudo xdg-settings set default-web-browser google-chrome.desktop
	sudo timedatectl set-ntp true
	ln -fs $(realpath ./home-files/.profile) ${HOME}
	ln -fs $(realpath ./home-files/.xprofile) ${HOME}
	ln -fs $(realpath ./home-files/.Xresources) ${HOME}
	ln -fs $(realpath ./home-files/.gnupg/gpg-agent.conf) ${HOME}/.gnupg/

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
	rm -rf ${HOME}/.dotfiles/
	ln -fs $(realpath ./home-files/.zshrc) ${HOME}
	ln -fs $(realpath ./home-files/.dotfiles) ${HOME}
	./scripts/vhdotmodule.sh add smart-title
	# install zplug
	rm -rf ${HOME}/.zplug/
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

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
	ln -s $(realpath ./home-files/.global_rgignore) ${HOME}

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
	sudo groupadd docker || echo "group 'docker' already exists"
	sudo usermod -aG docker ${USER}
	newgrp docker

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

vh-cli:
	mkdir -p ${HOME}/src/
	rm -rf ${HOME}/src/vh-cli
	git clone git@github.com:vhoyer/vh-cli.git ${HOME}/src/vh-cli
	cd ${HOME}/src/vh-cli; make install
	cd ${HOME}/src/vh-cli; make install-oh-my-zsh-tab-completion

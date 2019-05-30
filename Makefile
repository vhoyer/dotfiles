setup-git:
	rm -f ${HOME}/{.gitconfig,.global_gitignore}
	ln -s $(realpath ./home-files/.gitconfig) ${HOME}
	ln -s $(realpath ./home-files/.global_gitignore) ${HOME}

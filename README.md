My .dotfiles configurations
===========================

So yeah, the motivations behind all this is: man, it feels freaking awesome to sit on a new
computer just clone your .dotfiles repository and run a command to install everything you
need. And so I ~did~ am doing it!

## wiki

~So if you are my stalker, you probably saw that I had a personal wiki section here, right?
Well, I moved it to its own [repository](https://github.com/vhoyer/studies).~

EDIT:

I've moved the studies repo back to this one because in the end is more convenient event if
it doesn't make all the sense in the world, :shrug:.

## Dependencies

- a Unix system (I'm making it for Manjaro, so I don't guarantee it works on other systems)
- Git
- GNU make (or any program capable of reading and executing a Makefile)
- pacman package manager
- sudo

I think that's it, I may be wrong, and if so, then I'm sorry.

## Quick ssh-key to clipboard

Because I never remember that command:

```bash
bash <(curl -s https://raw.githubusercontent.com/vhoyer/dotfiles/master/scripts/generate-ssh-key.sh) <your@email.here>
```

## Quick start

With all dependencies installed, you may clone the repository:

```bash
git clone https://github.com/vhoyer/dotfiles.git
cd dotfiles
```

And run `make` on that directory:

```bash
make

make setup
```

You may also choose what you want to setup manually, by calling:

```bash
make <insert here name of rule>
```

Example, if you want to only install packages listed on `./packages/*.txt` files, you may:

```
make install-programs
```

Then if you only want to setup git:

```bash
make setup-git
```

I will not list what rules are present on the `Makefile` to lower the chances of this
`README.md` get out of date.

## Roadmap

- [x] make an script to install it all!
  - [ ] when installing yay packages, don't ask for [Y/n] to continue (it just
      need a `yes | yay ...`, but it cannot be used if yay asks for choosing
      installation, see next topic)
  - [ ] when installing yay packages, don't ask for default
      (e.g.: google-chrome? 1=stable; 2=beta; etc)
- [x] install nvim
  - [x] install gruvbox
  - [x] install coc.nvim
    - [ ] make CocInstall work by itself
  - [x] install neoranger
  - [x] install `stefandtw/quickfix-reflector.vim`
- [x] install zsh
  - [x] install oh-my-zsh
  - [ ] ask for reboot after finish make
- [x] install i3
- [x] install and use st
- [x] install google-chrome
  - [x] make it default
  - [x] install and use a better default font with emoji support :D
- [x] make two monitor setup work
- [x] setup that modular key bindings program: sxhkd
- [x] make `scripts/make-swapfile.sh`
  - [x] have an --help parameter
  - [x] have a undo option
  - [x] have the option to choose how much memory to allocate the swap
  - [ ] have the option to change how much memory is allocated to be swap
- [x] install redshift
- [x] make `./home-files/.local/bin/commitizen`
    - [ ] have a way to automatically commit formated

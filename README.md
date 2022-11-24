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

## GPG key generation

```sh
# list all the keys in your key ring
gpg --list-keys
# create a new key (follow the wizard) (recommended: highest bits, 1y expiration)
# after typing the passphrase, immediately begin performing random actions on
# your pc to increase entropy
gpg --full-generate-key
# edit the key
# it opens a console where you can type some commands
# > list # to list all keys and sub keys
# > key 0 # to select a key based on index (0 based)
# > expire # to edit the expiration date of your key, you can use this to renew it
gpg --edit-key <your@email.here>
# change your passphrase
gpg --passwd <your@email.here>
```

If you do renew your key, you should edit the expiration date of all your sub
keys as well as the primary.

It is possible to revoke your key in case of compromise, I will let future me
search the process up if it is ever needed.

If you need to move your configuration for GPG keys to a new computer, my
recommendation it to zip the `~/.gnupg` folder, save it to a thumb drive and
copy it over to the new machine. Just pay attention to the file permissions.

Reference: https://www.youtube.com/watch?v=1vVIpIvboSg

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

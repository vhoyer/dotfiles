My .dotfiles configurations
===========================

So yeah, the motivations behind all this is: man, it feels freaking awesome to sit on a new
computer just clone your .dotfiles repository and run a command to install everything you
need. And so I ~did~ am doing it!

## Dependencies

- a Unix system
- Git
- GNU make (or any program capable of reading and executing a Makefile)
- pacman package manager 
- sudo

I think that's it, I may be wrong, and if so, then I'm sorry.

## Quick ssh-key to clipboard

because I never remember that command:

```bash
bash <(curl -s https://raw.githubusercontent.com/vhoyer/dotfiles/i3-zsh/scripts/generate-ssh-key.sh) <your@email.here>
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

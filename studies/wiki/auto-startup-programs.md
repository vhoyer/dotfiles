Auto startup programs
=====================

~~In Manjaro with i3 desktop, auto startup programs are configured by i3 and its configuration file.~~

**EDIT:**

The thing is a little more complicated than that, thankfully there is a page on Arch Linux wiki that explain all this way better than me: <https://wiki.archlinux.org/index.php/Autostarting>. But in case the internet goes down, or something:

## On bootup/shutdown
- use [systemd](https://wiki.archlinux.org/index.php/Systemd) services

## On user login/logout
- use [systemd/User](https://wiki.archlinux.org/index.php/Systemd/User) services

## On device plug in/unplug
- use [udev](https://wiki.archlinux.org/index.php/Udev) rules

## On time events

###Periodically at certain times, dates or intervals:

- systemd/Timers
- Cron

### Once at a date and time:

- systemd/Timers
- `at`

## On filesystem events
Use an inotify event watcher:

- `inotify-tools`, see `inotifywait(1)`
- Incron
- `fswatch`<sup>AUR</sup>

## On shell login / logout
See Command-line shell#Configuration files.

## On Xorg startup

- xinitrc if you are starting Xorg manually with [xinit](https://wiki.archlinux.org/index.php/Xinit).
- xprofile if you are using a display manager.

## On desktop environment startup

Most desktop environments implement [XDG Autostart](https://wiki.archlinux.org/index.php/XDG_Autostart).

If the desktop environments has an article, see its Autostart section.

- GNOME#Autostart
- KDE#Autostart
- Xfce#Autostart
- LXDE#Autostart
- LXQt#Autostart

## On window manager startup

Many window managers implement XDG Autostart.

If the window manager has an article, see its Autostart section.

- Fluxbox#Autostart
- Openbox#Autostart
- Awesome#Autostart
- [i3#Autostart](https://wiki.archlinux.org/index.php/I3#Autostart)

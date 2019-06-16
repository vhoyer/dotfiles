x.org.conf
==========

So, x.org.conf, I don't get 'em. One thing I learned, they just load on server startup, which
is just a pretty name for you have to reboot your system to get your configurations to work.

## Touchpad

Anyway, my laptop here is using _libinput_, so this [archlinux
wikipage on libinput](https://wiki.archlinux.org/index.php/Libinput) helped me a bit and I got
to this setup for my `/etc/X11/xorg.conf.d/30-touchpad.conf`:

```xf86conf
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
EndSection
```

And after a reboot I got it to work just fine :D.

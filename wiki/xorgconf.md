x.org.conf
==========

So, x.org.conf, I don't get 'em. Anyway, I'm trying to configure my touchpad to have a proper scrolling behavior and not
that reverse, confusing thing they call "natural scrolling" which is total bullshit, that thing makes no sense at all for
me and I'm trying to configure it for _my_ personal "natural scrolling".

Anyway, my laptop here is using libinput, so this [archlinux wikipage on libinput](https://wiki.archlinux.org/index.php/Libinput)
helped me a bit and I got to this setup for my `/etc/X11/xorg.conf.d/30-touchpad.conf`:

```xf86conf
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
EndSection
```

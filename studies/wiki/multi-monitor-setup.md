Multi Monitor setup
===================

So the reason I don't try automating those kind of configurations are too much
hardware dependent, so It would be a total pain to setup a proper working tool
to automate this. Instead, what I'm doing is writing this wiki in hope that it
will help me in the future (or anyone who find this).

My notebook has a primary monitor to it controlled by intel's onboard video
card, and has a HDMI output port controlled by my nvidia offboard card.

## What I did to solve my problems?

I had to use [`mhwd` tool to remove and install drivers][1], basically:

```bash
# this removes a driver
sudo mhwd -r pci <driver name>
# this install a driver
sudo mhwd -i pci <driver name>
# this list drivers available for pci
mhwd --pci -l
# this list drivers installed for pci
mhwd --pci -li
```

1. I unistalled video-hybrid-intel-nvidia-bumblebee;
1. I installed video-nvidia;
1. `rm`ed `/etc/X11/xorg.conf.d/*-mhwd*.conf` (its fuzzy because I don't
   remember the name of it);
1. rebooted (and then I saw myself with only the second monitor working);
1. run `xrandr` and only my HDMI's display was showing at all
1. I installed video-linux;
1. `rm`ed `/etc/X11/xorg.conf.d/*-mhwd*.conf` (its fuzzy because I don't
   remember the name of it);
1. rebooted (and then I saw myself with only the second monitor working);
1. run `xrandr` and all my display ports were listed;
1. configured my multi monitor setup by using `arandr`, but one could use
   anything.

## Everything great, right? No.

So there was that thing that was kinda bugging me, it was that when I first started
this settings onto the laptop, the monitor who got to turn on was the external, so
I rebooted it again, in hope that now it would be ok, but it wasn't. "Oh, but its no
big deal, you can just login and afterwards you can configure the monitors the way you
want", except it was loading on the external monitor even with the cable unpluged :D.

Great..., but its just configure RandR to load properly whenever Xorg starts, right?
Ok, so to configure RandR I could find out the name of my monitors through `xrandr`,
which now were all connected, and after a quick search I came to terms that the best
dual monitor settings for me was:

```bash
xrandr --output eDP-1-1 --primary --auto --output eDP-1-1 --auto --right-of HDMI-0
```

So I thought the place to place your Xorg configurations was on `.xprofile` and well,
I continue to think that it is the right place, although I could be wrong, but if you
add `xrandr` configurations into `.xprofile` it will only run after the login. So there
are still problems.

So to run `xrandr` configurations before `lightdm` loads I found that you only needed to
[add into `/etc/lightdm/lightdm.conf` the following section][2]\:

```conf
[SeatDefaults]
display-setup-script=/usr/share/xrandr.config.sh
```

And into `/usr/share/xrandr.config.sh`, you can put the `xrandr` configurations mentioned
earlier. (it needs to be `chmod +x`ed)

Now, I only wanted that I found about this days before :sweat_smile:

## New news

So, if you want to stick with bumblebee's battery performant driver, you could try using the
`sudo intel-virtual-output -b` which makes the Nvidia and Intel talk to each other.

This new piece of information was taken from [this thread on majaro wiki][3].

Really just read this: https://wiki.archlinux.org/index.php/bumblebee

## If you are on the fly

Remember you have `mons`, the multi-monitor helper.

```bash
mons -e top
```

<!--
## References -->

[1]: https://forum.manjaro.org/t/multi-monitor-setup-acting-weird/83906/9
[2]: https://askubuntu.com/a/69501
[3]: https://forum.manjaro.org/t/hdmi-port-not-working-on-dell-inspiron-7567/41791/28

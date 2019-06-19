Multi Monitor setup
===================

So the reason I don't try automating those kind of configurations are too much
hardware dependent, so It would be a total pain to setup a proper working tool
to automate this. Instead, what I'm doing is writing this wiki in hope that it
will help me in the future (or anyone who find this).

My notebook has a primary monitor to it controlled by intel's onboard video
card, and has a HDMI output port controlled by my nvidia offboard card.

## References

- https://forum.manjaro.org/t/multi-monitor-setup-acting-weird/83906/11

## What I did to solve my problems?

I had to use `mhwd` tool to remove and install drivers, basically:

```bash
# this removes a driver
sudo mhwd -r <driver name>
# this install a driver
sudo mhwd -i <driver name>
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

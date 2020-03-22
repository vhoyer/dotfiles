Keyboard L
===========

How to use `keyboardctl`, you say?

1. Firstly, you need to run it on sudo.
1. Secondly, to alter your settings you should run it with the `-l` flag. Don't ask me, I don't know what it stands for either.
1. Thirdly, to set a different layout based on countries you just pass the country "code" to the `-l` flag

Done! You've successfully changed your keyboard layout.

```bash
sudo keyboardctl -l us
```

If you want to set a different layout for the same language, just add an space and type the layout name, supposedly every `-l` parameter should be on lowercase.

```bash
sudo keyboardctl -l us dvorak
```

## Other languages

Well, what I use is just the following:

| country code | layout |
|--------------|--------|
| us           |        |
| us           | dvorak |
| br           |        |
| br           | abnt2  |
| br           | dvorak |

If you want to add another languages, just open a PR :stuck_out_tongue:.

Also, accordingly to [Manjaro wiki](https://wiki.manjaro.org/index.php/Keyboard_Layout), you can check all possible keyboard layouts on `/usr/share/X11/xkb/rules/xorg.lst`.

***

The day is 2019-09-26, 08:00,
I'm having the following error:
```
The keyboard is in some unknown mode
Changing to the requested mode may make your keyboard unusable, please use -f to force the change.
unknown keysym 'trademark'

lk_add_key called with bad keycode -1
error: loadkeys failed!
```

How did I solved?
I didn't! What I did was to change the approach (still don't know what the problem is), to change the layout I used `setxkbmap`. Have you heard of `setxkbmap`? It's very cool, you don't even need `sudo` as you do with `keyboardctl`.

```bash
setxbmap br -variant abnt2
# or
setxbmap us
# or
setxbmap us -variant dvorak
```

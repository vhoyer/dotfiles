Increasing battery life on Linux laptops
========================================

> Information from this wiki page came from [this blog post on tecmint](https://www.tecmint.com/tlp-increase-and-optimize-linux-battery-life/)

Theoretically just by installing `tlp` on your system and running:

```bash
sudo tlp start
```

Configurations are on `/etc/default/tlp`.

## Useful commands

For showing all kinds of information `tlp` has

```bash
sudo tlp-stat
```

### Useful flags

`-b`: for battery

`-c`: for configurations

`-p`: for processor data

`-t`: for temperatures

`-w`: for warnings

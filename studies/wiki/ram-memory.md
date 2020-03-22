# RAM memory

## How to Clear Cache in Linux?
Every Linux System has three options to clear cache without interrupting any processes or services.

1. Clear PageCache only.

```sh
sudo su
sync; echo 1 > /proc/sys/vm/drop_caches
```

2. Clear dentries and inodes.

```sh
sudo su
sync; echo 2 > /proc/sys/vm/drop_caches
```

3. Clear PageCache, dentries and inodes.

```sh
sudo su
sync; echo 3 > /proc/sys/vm/drop_caches
```

Explanation of above command.

**sync** will flush the file system buffer. Command Separated by `“;”` run sequentially. The shell wait for each command to terminate before executing the next command in the sequence. As mentioned in kernel documentation, writing to **drop_cache** will clean cache without killing any application/service, command [echo](https://www.tecmint.com/echo-command-in-linux/) is doing the job of writing to file.

If you have to clear the disk cache, the first command is safest in enterprise and production as `“...echo 1 > ….”` will clear the **PageCache** only. It is not recommended to use third option above `“...echo 3 >”` in production until you know what you are doing, as it will clear **PageCache**, **dentries** and **inodes**.

# References

https://www.tecmint.com/clear-ram-memory-cache-buffer-and-swap-space-on-linux/

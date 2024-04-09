# shell script if clause guide

## test if the file exist

```sh
if [ -f /etc/passwd ]; then
    echo "/etc/passwd exists."
fi
```

## test if the directory exist

```sh
if [ -d /etc ]; then
    echo "/etc exists."
fi
```

## test if the file is writable

```sh
if [ -w /etc/passwd ]; then
    echo "/etc/passwd is writable."
fi
```

## test if the file is executable

```sh
if [ -x /etc/passwd ]; then
    echo "/etc/passwd is executable."
fi
```

## test if the file is a character special file

```sh
if [ -c /dev/tty ]; then
    echo "/dev/tty is a character special file."
fi
```

A file that is a character special file is a device file that provides serial access to a device such as a terminal.

## test if the file is a block special file

```sh
if [ -b /dev/sda ]; then
    echo "/dev/sda is a block special file."
fi
```

## test if the file is a symbolic link

```sh
if [ -L /etc/passwd ]; then
    echo "/etc/passwd is a symbolic link."
fi
```

## test if the file is a socket

```sh
if [ -S /var/run/mysqld/mysqld.sock ]; then
    echo "/var/run/mysqld/mysqld.sock is a socket."
fi
```

## test if the file is a named pipe

```sh
if [ -p /var/run/mysqld/mysqld.sock ]; then
    echo "/var/run/mysqld/mysqld.sock is a"
fi
```

## test if the string is empty

a good menemonic for this is: `-z` means "zero length"

```sh
if [ -z "$var" ]; then
    echo "var is empty."
fi
```

## test if the string is not empty

```sh
if [ -n "$var" ]; then
    echo "var is not empty."
fi
```

## test if the string is not empty and not null

```sh
if [ "$var" ]; then
    echo "var is not empty and not null."
fi
```

## test if the number is equal

```sh
if [ 1 -eq 1 ]; then
    echo "1 is equal to 1."
fi
```

## test if the number is not equal

```sh
if [ 1 -ne 2 ]; then
    echo "1 is not equal to 2."
fi
```

## test if the number is less than

```sh
if [ 1 -lt 2 ]; then
    echo "1 is less than 2."
fi
```

## test if the number is less than or equal to

```sh
if [ 1 -le 1 ]; then
    echo "1 is less than or equal to 1."
fi
```

## test if the number is greater than

```sh
if [ 2 -gt 1 ]; then
    echo "2 is greater than 1."
fi
```

## test if the number is greater than or equal to

```sh
if [ 1 -ge 1 ]; then
    echo "1 is greater than or equal to 1."
fi
```

## test if the file is newer than

```sh
if [ file1 -nt file2 ]; then
    echo "file1 is newer than file2."
fi
```

## test if the file is older than

```sh
if [ file1 -ot file2 ]; then
    echo "file1 is older than file2."
fi
```

## test if the file is empty

```sh
if [ -s file ]; then
    echo "file is not empty."
fi
```

## test if the file is a regular file

```sh
if [ -f file ]; then
    echo "file is a regular file."
fi
```

## test if the file is a block device

```sh
if [ -b file ]; then
    echo "file is a block device."
fi
```

## test if the file is a character device

```sh
if [ -c file ]; then
    echo "file is a

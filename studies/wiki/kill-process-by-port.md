# How to kill process by port

```bash
#!/bin/sh

PORT=$1

sudo kill -9 `sudo lsof -t -i:$PORT`
```

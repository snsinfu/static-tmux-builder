# Static tmux builder

Clone this repository and type `make` to build a statically linked
`tmux` binary. Requires Docker.

```
$ git clone https://github.com/snsinfu/static-tmux-builder
$ cd static-tmux-builder
$ make
$ ls out
tmux
```

Copy the binary to a linux host (most likely in `~/bin`) and use it.

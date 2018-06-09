#!/bin/sh -eu

name="tmux-${TMUX_VERSION}"

curl -fsSLO "https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/${name}.tar.gz"
tar xzf "${name}.tar.gz"

cd "${name}"
./configure --enable-static
make -j

strip -o /srv/out/tmux tmux

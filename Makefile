LIBEVENT_VERSION = 2.1.8-stable
TMUX_VERSION = 2.7
ARTIFACTS = out/tmux _docker.ok

.PHONY: clean

out/tmux: _docker.ok
	mkdir -p out
	docker run -it --rm -v $${PWD}/out:/srv/out -e TMUX_VERSION=$(TMUX_VERSION) tmux-builder:latest

_docker.ok: Dockerfile build.sh
	docker build --build-arg LIBEVENT_VERSION=$(LIBEVENT_VERSION) -t tmux-builder .
	@touch $@

clean:
	docker image rm tmux-builder
	rm -f $(ARTIFACTS)


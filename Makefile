NAME=team-fortress-2
VERSION=latest
PORT=27015

build:
	docker build . -t $(NAME):$(VERSION)

run: rm
	docker run -dt --name $(NAME) -p $(PORT):$(PORT) -p $(PORT):$(PORT)/udp $(NAME):$(VERSION)

rm:
	docker rm -f $(NAME) || true

logs:
	docker logs $(NAME)

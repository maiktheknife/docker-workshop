NAME=minecraft
VERSION=latest
PORT=25565

build:
	docker build . -t $(NAME):$(VERSION)

run: rm
	docker run -dt --name $(NAME) -p $(PORT):$(PORT) -p $(PORT):$(PORT)/udp $(NAME):$(VERSION)

rm:
	docker rm -f $(NAME) || true

logs:
	docker logs $(NAME)

NAME=etlegacy
VERSION=latest
PORT=27960

build:
	docker build . -t $(NAME):$(VERSION)

run: rm
	docker run -dt --name $(NAME) -p $(PORT):$(PORT)/udp $(NAME):$(VERSION) -e PASSWD=myrconpasswd

rm:
	docker rm -f $(NAME) || true

logs:
	docker logs $(NAME)

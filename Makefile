NAME=agario
VERSION=latest
PORT_WEB=8443
PORT_STATS=88

build:
	docker build . -t $(NAME):$(VERSION)

run: rm
	docker run -dt --name $(NAME) -p $(PORT_WEB):443 -p $(PORT_STATS):88 $(NAME):$(VERSION)
	@echo visit "http://agar.io/?ip=$(shell docker-machine ip):$(PORT_WEB)"
	@echo or visit "$(shell docker-machine ip):$(PORT_STATS)" for statistics

rm:
	docker rm -f $(NAME) || true

logs:
	docker logs $(NAME)

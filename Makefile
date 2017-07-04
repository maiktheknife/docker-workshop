NAME=agario
VERSION=latest
PORT=8443

build:
	docker build . -t $(NAME):$(VERSION)

run: rm
	docker run -dt --name $(NAME) -p $(PORT):443 $(NAME):$(VERSION)
	@echo "visit http://agar.io/?ip=(IP-ADRESSE):$(PORT)"

rm:
	docker rm -f $(NAME) || true

logs:
	docker logs $(NAME)

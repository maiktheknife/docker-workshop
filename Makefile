NAME=minecraft
VERSION=latest
PORT=25565

build:
	docker build . -t $(NAME):$(VERSION)

run: rm
	docker run -dt --name $(NAME) -p $(PORT):$(PORT) -p $(PORT):$(PORT)/udp $(NAME):$(VERSION)

run-with-parameters: rm
	docker run -dt --name $(NAME) -p $(PORT):$(PORT) -p $(PORT):$(PORT)/udp -e JVM_MEMORY=2G -e DIFFICULTY=0 -e MOTD="Welcome to the adesso Minecraft Server" -e GAMEMODE=1 $(NAME):$(VERSION)

rm:
	docker rm -f $(NAME) || true

logs:
	docker logs $(NAME)

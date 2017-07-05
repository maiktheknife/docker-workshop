NAME=team-fortress-2
VERSION=latest
PORT=27015

build:
	docker build . -t $(NAME):$(VERSION)

run: rm
	docker run -dt --name $(NAME) -p $(PORT):$(PORT) -p $(PORT):$(PORT)/udp $(NAME):$(VERSION)

run-with-parameters: rm
	docker run -dt --name $(NAME) -p $(PORT):$(PORT) -e TIMELIMIT=15 -e MOTD="Welcome to our adesso Workshop Team Fortress 2 Server!" -e MAX_PLAYERS=22 -e MAX_ROUNDS=5 -p $(PORT):$(PORT)/udp $(NAME):$(VERSION)

rm:
	docker rm -f $(NAME) || true

logs:
	docker logs $(NAME)

list-replays:
	docker exec -i $(NAME) ls -al tf2/tf/replay

build:
	docker-compose build

run:
	docker-compose up --force-recreate -d

rm:
	docker-compose down

logs:
	docker-compose logs

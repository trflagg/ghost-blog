build:
	docker-compose -f docker-compose.yml -f docker-compose.build.yml up

docker-start:
	docker-machine start default

run:
	docker-compose up

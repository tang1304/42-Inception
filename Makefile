.PHONY: all up down clean

include srcs/.env

all: up

up:
	mkdir -p /home/tgellon/data/mariadb /home/tgellon/data/wordpress
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up -d --build 

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	- docker stop $$(docker ps -qa); \
	- docker rm $$(docker ps -qa); \
	- docker rmi -f $$(docker images -qa); \
	- docker volume rm $$(docker volume ls -q); \
	- docker network rm $$(docker network ls -q) 2>/dev/null
	- sudo rm -rf /home/tgellon/data/mariadb /home/tgellon/data/wordpress

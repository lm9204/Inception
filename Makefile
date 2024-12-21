DOCKER = docker-compose -f srcs/docker-compose.yml
OS := $(shell uname)

ifeq ($(OS),Linux)
    DATA = /home/yeondcho/data
else ifeq ($(OS),Darwin)
	DATA = /Users/yeondcho/data
endif

all: build

build:
	mkdir -p $(DATA)/mariadb
	mkdir -p $(DATA)/www
	$(DOCKER) up --build

up:
	$(DOCKER) up

down:
	$(DOCKER) down -v

clean: down
	docker system prune -af

fclean: clean
	sudo rm -rf $(DATA)/*

re: down up

.PHONY: all up down re clean fclean

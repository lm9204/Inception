DOCKER = docker-compose -f srcs/docker-compose.yml
OS := $(shell uname)

ifeq ($(OS),Linux)
    DATA = /home/yeondcho/data
else ifeq ($(OS),Darwin)
	DATA = /Users/yeondcho/data
endif

all:
	$(DOCKER) up --build

up:
	$(DOCKER) up

down:
	$(DOCKER) down -v

clean: down
	docker system prune -af

fclean: clean
	rm -rf $(DATA)/*

re: clean all

.PHONY: all up down re clean fclean

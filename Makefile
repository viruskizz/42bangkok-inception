NAME = inception

SRC = ./src
NGINX = nginx

all: $(NAME)

$(NAME): mkdir_data up

mkdir_data:
	mkdir -p $(HOME)/data
	mkdir -p $(HOME)/data/wordpress

up:
	cd $(SRC) && docker compose up -d
down: stop
	cd $(SRC) && docker compose down
stop:
	cd $(SRC) && docker compose stop

.PHONY: cd up down stop

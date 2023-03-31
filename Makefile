NAME = inception

SRC = ./src
NGINX = nginx

all: $(NAME)

$(NAME): up

up:
	cd $(SRC) && docker compose up -d
down: stop
	cd $(SRC) && docker compose down
stop:
	cd $(SRC) && docker compose stop

.PHONY: cd up down stop

NAME = inception

all: $(NAME)

$(NAME):
	docker compose \
		--file src/docker-compose.yml \
		--env-file "./src/.env" \
		up \
		--build

down:
	docker compose down

nginx:
	docker build -t nginx -f src/requirements/nginx/Dockerfile .

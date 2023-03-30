# 42Bangkok - Inception

The `docker` container project. There are multiple containers in single project. Run all services in application with `docker-compose`.

## command

```sh
docker compose \
    --file src/docker-compose.yml \
    --env-file "./src/.env" \
    up \
    --build
```

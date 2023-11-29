#!/bin/bash

docker run --rm -d \
--name postgres \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_USER=postgres \
-e POSTGRES_DB=dbtest \
-v ./entry-postgres-folder/:/docker-entrypoint-initdb.d/ \
postgres

docker run --rm -d \
--name pgadmin \
-e PGADMIN_DEFAULT_EMAIL=jayllon@test.fr \
-e PGADMIN_DEFAULT_PASSWORD=password \
-p 8080:80 \
dpage/pgadmin4

docker build -f api/Dockerfile.api -t node-api .
docker run --rm -d \
--name node-api \
-p 3000:3000 \
node-api

ng new --skip-install --skip-git -S --minimal --style css --ssr --routing front-angular
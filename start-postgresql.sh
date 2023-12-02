#!/bin/bash

# init db
docker run --rm -d \
--name postgres \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_USER=postgres \
-e POSTGRES_DB=dbtest \
-v ./postgresql/:/docker-entrypoint-initdb.d/ \
-v pg-data:/var/lib/postgresql/data \
postgres

# start db
docker run --rm -d \
--name postgres \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_USER=postgres \
-e POSTGRES_DB=dbtest \
-v pg-data:/var/lib/postgresql/data \
postgres

docker run --rm -d \
--name pgadmin \
-e PGADMIN_DEFAULT_EMAIL=jayllon@test.fr \
-e PGADMIN_DEFAULT_PASSWORD=password \
-p 8080:80 \
dpage/pgadmin4

# build api
docker build -f api/Dockerfile.api -t node-api .
# run api
docker run --rm -d \
--name node-api \
-e PORT=3000 \
-p 3000:3000 \
node-api

ng new -s -t --routing true --skip-git --skip-install -S --ssr --style css front-angular
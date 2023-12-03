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

# Access database
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
-e ENTRY_PORT=3000 \
-p 3000:3000 \
node-api

# Create front angular project
ng new -s -t --routing true --skip-git --skip-install -S --ssr --style css front-angular

# Build Front
docker build -f Dockerfile.front -t angular-front .
# Run front
docker run --rm -d \
--name angular-front \
-p 4200:80 \
angular-front

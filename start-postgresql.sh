#!/bin/bash

docker run --rm -d \
--name postgres \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_USER=postgres \
-e POSTGRES_DB=dbtest \
-p 5432:5432 \
-v ./entry-postgres-folder/:/docker-entrypoint-initdb.d/ \
postgres

docker run --rm -d \
--name pgadmin \
-e PGADMIN_DEFAULT_EMAIL=jayllon@test.fr \
-e PGADMIN_DEFAULT_PASSWORD=password \
-p 8080:80 \
dpage/pgadmin4
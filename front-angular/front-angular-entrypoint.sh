#!/bin/sh
envsubst < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/default.conf
su - nginx
nginx -g 'daemon off;'
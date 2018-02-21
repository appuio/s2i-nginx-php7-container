#!/bin/bash
# https://github.com/docker-library/php/issues/74
env | sed "s/\(.*\)=\(.*\)/env[\1]='\2'/" > /etc/php-fpm.d/env.conf
php-fpm
nginx -c /opt/app-root/etc/conf.d/nginx/nginx.conf
#!/bin/bash

# https://github.com/docker-library/php/issues/74
# https://medium.com/@tomahock/passing-system-environment-variables-to-php-fpm-when-using-nginx-a70045370fad
echo "clear_env = no" >> /etc/php-fpm.d/www.conf
env | sed "s/\(.*\)=\(.*\)/env[\1]='\2'/" >> /etc/php-fpm.d/www.conf

php-fpm
nginx -c /opt/app-root/etc/conf.d/nginx/nginx.conf
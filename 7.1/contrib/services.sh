#!/bin/bash

# https://medium.com/@tomahock/passing-system-environment-variables-to-php-fpm-when-using-nginx-a70045370fad
printf "\nclear_env = no\n" >> /etc/php-fpm.d/www.conf
# remote empty values then rewrite as env[key] = 'value'
env | awk -F '=' '$2 !~ /^$/{print}'  | sed "s/\([^=]*\)=\(.*\)/env[\1] = '\2'/" >> /etc/php-fpm.d/www.conf
printf "\n" >> /etc/php-fpm.d/www.conf

php-fpm
nginx -c /opt/app-root/etc/conf.d/nginx/nginx.conf

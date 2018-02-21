#!/bin/bash

# https://medium.com/@tomahock/passing-system-environment-variables-to-php-fpm-when-using-nginx-a70045370fad
echo "\n\nclear_env = no" >> /etc/php-fpm.d/www.conf
env | sed "s/\(.*\)=\(.*\)/env[\1]='\2'/" >> /etc/php-fpm.d/www.conf

php-fpm
nginx -c /opt/app-root/etc/conf.d/nginx/nginx.conf
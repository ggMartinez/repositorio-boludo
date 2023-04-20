#!/bin/bash

cd /var/www/html
mkdir /var/www/html/storage/app/public/reports || true 
chown -R apache /var/www/html/bootstrap/cache && chown -R apache /var/www/html/storage
php artisan cache:clear
php artisan storage:link &&  php artisan l5-swagger:generate
mkdir /var/www/html/storage/app/public/reports
httpd -D FOREGROUND

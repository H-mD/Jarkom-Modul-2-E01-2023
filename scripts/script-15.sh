#!/bin/bash 

line0=$(grep -n 'ServerAlias www.parikesit.abimanyu.e01.com' /etc/apache2/sites-available/abimanyu.e01.conf | cut -d ':' -f 1)

if [ -n "$line0" ]; then
    sed -i "$((line0 + 14))i IndexIgnore error" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 15))i <Directory /var/www/parikesit.abimanyu.e01/error>" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 16))i Options -Indexes" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 17))i </Directory>" /etc/apache2/sites-available/abimanyu.e01.conf
    
    sed -i "$((line0 + 18))i ErrorDocument 403 /error/403.html" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 19))i ErrorDocument 404 /error/404.html" /etc/apache2/sites-available/abimanyu.e01.conf
fi

service apache2 restart
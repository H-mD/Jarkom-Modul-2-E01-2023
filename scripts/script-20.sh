#!/bin/bash

line0=$(grep -n 'ServerAlias www.parikesit.abimanyu.e01.com' /etc/apache2/sites-available/abimanyu.e01.conf | cut -d ':' -f 1)

if [ -n "$line0" ]; then
    sed -i "$((line0 + 21))i <Directory \"/var/www/parikesit.abimanyu.e01\">" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 22))i AllowOverride All" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 23))i </Directory>" /etc/apache2/sites-available/abimanyu.e01.conf
fi

echo "
RewriteEngine On
RewriteBase /
RewriteCond %{REQUEST_URI} .*abimanyu.*\.(png|jpg|webp)$
RewriteRule ^.*\$ public/images/abimanyu.png [L,R=301]
" > /var/www/parikesit.abimanyu.e01/public/images/.htaccess
#!/bin/bash

a2enmod rewrite

echo -e "
<VirtualHost *:80>
        ServerName 10.37.3.4
        RewriteEngine On
        RewriteCond %{HTTP_HOST} ^10\.37\.3\.4*$
        RewriteRule ^(.*) http://www.abimanyu.e01.com [L,R=301]
</VirtualHost>
" >> /etc/apache2/sites-available/abimanyu.e01.conf

service apache2 restart
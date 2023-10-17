#!/bin/bash 

line0=$(grep -n 'ServerAlias www.parikesit.abimanyu.e01.com' /etc/apache2/sites-available/abimanyu.e01.conf | cut -d ':' -f 1)

if [ -n "$line0" ]; then
    sed -i "$((line0 + 20))i Alias \"/js\" \"/var/www/parikesit.abimanyu.e01/public/js\"" /etc/apache2/sites-available/abimanyu.e01.conf
fi

service apache2 restart
#!/bin/bash 

line0=$(grep -n 'ServerAlias www.parikesit.abimanyu.e01.com' /etc/apache2/sites-available/abimanyu.e01.conf | cut -d ':' -f 1)

if [ -n "$line0" ]; then
    sed -i "$((line0 + 5))i <Directory /var/www/parikesit.abimanyu.e01/public>" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 6))i Options +Indexes" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 7))i </Directory>" /etc/apache2/sites-available/abimanyu.e01.conf
    
    sed -i "$((line0 + 11))i <Directory /var/www/parikesit.abimanyu.e01/secret>" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 12))i Deny from All" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 13))i </Directory>" /etc/apache2/sites-available/abimanyu.e01.conf
fi

service apache2 restart
#!/bin/bash

line0=$(grep -n '<Directory /var/www/abimanyu.e01>' /etc/apache2/sites-available/abimanyu.e01.conf | cut -d ':' -f 1)

if [ -n "$line0" ]; then
    sed -i "$((line0 + 3))i Alias \"/home\" \"/var/www/abimanyu.e01/index.php/home\"" /etc/apache2/sites-available/abimanyu.e01.conf
fi

service apache2 restart

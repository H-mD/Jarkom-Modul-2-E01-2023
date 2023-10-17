#!/bin/bash

mkdir /etc/apache2/passwd
htpasswd -c -b "/etc/apache2/passwd/passwords" "Wayang" "baratayudaE01"

line0=$(grep -n 'ServerAlias www.rjp.baratayuda.abimanyu.e01.com' /etc/apache2/sites-available/abimanyu.e01.conf | cut -d ':' -f 1)

if [ -n "$line0" ]; then
    sed -i "$((line0 + 5))i <Directory "/var/www/rjp.baratayuda.abimanyu.e01">" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 6))i AuthType Basic" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 7))i AuthName \"E01\"" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 8))i AuthUserFile /etc/apache2/passwd/passwords" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 9))i Require user Wayang" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 10))i </Directory>" /etc/apache2/sites-available/abimanyu.e01.conf
fi

service apache2 restart
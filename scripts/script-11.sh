#!/bin/bash

git clone "https://github.com/H-mD/Jarkom-Modul-2-E01-2023.git"

cp -r /root/Jarkom-Modul-2-E01-2023/resources/abimanyu.yyy.com /var/www/abimanyu.e01

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/abimanyu.e01.conf

line0=$(grep -n 'DocumentRoot' /etc/apache2/sites-available/abimanyu.e01.conf | cut -d ':' -f 1)

if [ -n "$line0" ]; then
    sed "$((line0 + 0))d" /etc/apache2/sites-available/abimanyu.e01.conf > temp
    mv temp /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 0))i DocumentRoot /var/www/abimanyu.e01" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 1))i ServerName abimanyu.e01.com" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 2))i ServerAlias www.abimanyu.e01.com" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 3))i <Directory /var/www/abimanyu.e01>" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 4))i Require expr \%{HTTP_HOST} == \"abimanyu.e01.com\" || \%{HTTP_HOST} == \"www.abimanyu.e01.com\"" /etc/apache2/sites-available/abimanyu.e01.conf
    sed -i "$((line0 + 5))i </Directory>" /etc/apache2/sites-available/abimanyu.e01.conf
fi

rm -rf /etc/apache2/sites-enabled/000-default.conf

a2ensite abimanyu.e01.conf

service apache2 reload
service apache2 restart
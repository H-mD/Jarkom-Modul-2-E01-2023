#!/bin/bash

git clone "https://github.com/H-mD/Jarkom-Modul-2-E01-2023.git"

cp -r /root/Jarkom-Modul-2-E01-2023/resources/arjuna.yyy.com /var/www/arjuna.e01

echo -e "
server {

\tlisten 8001;

\troot /var/www/arjuna.e01;

\tindex index.php index.html index.htm;
\tserver_name _;

\tlocation / {
\t\ttry_files \$uri \$uri/ /index.php?\$query_string;
\t}

\t# pass PHP scripts to FastCGI server
\tlocation ~ \.php\$ {
\t\tinclude snippets/fastcgi-php.conf;
\t\tfastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
\t}

\tlocation ~ /\.ht {
\t\tdeny all;
\t}

\terror_log /var/log/nginx/e01_error.log;
\taccess_log /var/log/nginx/e01_access.log;
}
" > /etc/nginx/sites-available/e01

ln -s /etc/nginx/sites-available/e01 /etc/nginx/sites-enabled

rm -rf /etc/nginx/sites-enabled/default

service php7.2-fpm restart
service php7.2-fpm start

service nginx restart
#!/bin/bash

cp -r /root/Jarkom-Modul-2-E01-2023/resources/parikesit.abimanyu.yyy.com /var/www/parikesit.abimanyu.e01

echo -e "
<VirtualHost *:80>
\tServerAdmin webmaster@localhost
\tDocumentRoot /var/www/parikesit.abimanyu.e01
\tServerName parikesit.abimanyu.e01.com
\tServerAlias www.parikesit.abimanyu.e01.com

\t<Directory /var/www/parikesit.abimanyu.e01>
\t\tRequire expr %{HTTP_HOST} == \"parikesit.abimanyu.e01.com\" || %{HTTP_HOST} == \"www.parikesit.abimanyu.e01.com\"
\t</Directory>

\tErrorLog ${APACHE_LOG_DIR}/error.log
\tCustomLog ${APACHE_LOG_DIR}/access.log combined
    
</VirtualHost>
" >> /etc/apache2/sites-available/abimanyu.e01.conf 

service apache2 restart
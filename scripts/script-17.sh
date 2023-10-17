#!/bin/bash

cp -r /root/Jarkom-Modul-2-E01-2023/resources/rjp.baratayuda.abimanyu.yyy.com /var/www/rjp.baratayuda.abimanyu.e01

line0=$(grep -n 'Listen 80' /etc/apache2/ports.conf | cut -d ':' -f 1)

if [ -n "$line0" ]; then
    sed -i "$((line0 + 1))i Listen 14000" /etc/apache2/ports.conf
    sed -i "$((line0 + 2))i Listen 14400" /etc/apache2/ports.conf
fi

echo -e "
<VirtualHost *:14000 *:14400>
\tServerAdmin webmaster@localhost
\tDocumentRoot /var/www/rjp.baratayuda.abimanyu.e01
\tServerName rjp.baratayuda.abimanyu.e01.com
\tServerAlias www.rjp.baratayuda.abimanyu.e01.com

\t<Directory /var/www/rjp.baratayuda.abimanyu.e01>
\t\tRequire expr %{HTTP_HOST} == \"rjp.baratayuda.abimanyu.e01.com*\" || %{HTTP_HOST} == \"www.rjp.baratayuda.abimanyu.e01.com*\"
\t</Directory>


\tErrorLog \${APACHE_LOG_DIR}/error.log
\tCustomLog \${APACHE_LOG_DIR}/access.log combined
    
</VirtualHost>
" >> /etc/apache2/sites-available/abimanyu.e01.conf 

service apache2 restart
#!/bin/bash

echo -e "
zone \"abimanyu.e01.com\" {
\ttype slave;
\tmasters { 10.37.2.2; };
\tfile \"/var/lib/bind/abimanyu.e01.com\";
};
" >> /etc/bind/named.conf.local

service bind9 restart
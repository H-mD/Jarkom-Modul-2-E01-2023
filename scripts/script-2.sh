#!/bin/bash

echo -e "
zone \"arjuna.e01.com\" {
\ttype master;
\tfile \"/etc/bind/e01/arjuna.e01.com\";
};
" >> /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/e01/arjuna.e01.com

echo -e "
;
; BIND data file for local loopback interface
;
\$TTL\t604800
@\tIN\tSOA\tarjuna.e01.com. root.arjuna.e01.com. (
\t\t     2023101201         ; Serial
\t\t\t 604800         ; Refresh
\t\t\t  86400         ; Retry
\t\t\t2419200         ; Expire
\t\t\t 604800 )       ; Negative Cache TTL
;
@\tIN\tNS\tarjuna.e01.com.
@\tIN\tA\t10.37.3.3\t; IP Arjuna
www\tIN\tCNAME\tarjuna.e01.com.
" > /etc/bind/e01/arjuna.e01.com

service bind9 restart
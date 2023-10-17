#!/bin/bash

echo -e "
zone \"abimanyu.e01.com\" {
\ttype master;
\tfile \"/etc/bind/e01/abimanyu.e01.com\";
};
" >> /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/e01/abimanyu.e01.com

echo -e "
;
; BIND data file for local loopback interface
;
\$TTL\t604800
@\tIN\tSOA\tabimanyu.e01.com. root.abimanyu.e01.com. (
\t\t     2023101201         ; Serial
\t\t\t 604800         ; Refresh
\t\t\t  86400         ; Retry
\t\t\t2419200         ; Expire
\t\t\t 604800 )       ; Negative Cache TTL
;
@\t\tIN\tNS\tabimanyu.e01.com.
@\t\tIN\tA\t10.37.3.4\t; IP Abimanyu
www\t\tIN\tCNAME\tabimanyu.e01.com.
" > /etc/bind/e01/abimanyu.e01.com

service bind9 restart
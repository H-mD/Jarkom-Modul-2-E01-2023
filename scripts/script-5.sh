#!/bin/bash

echo -e "
zone \"3.37.10.in-addr.arpa\" {
\ttype master;
\tfile \"/etc/bind/e01/3.37.10.in-addr.arpa\";
};
" >> /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/e01/3.37.10.in-addr.arpa

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
3.37.10.in-addr.arpa.\tIN\tNS\tabimanyu.e01.com.
4\t\t\tIN\tPTR\tabimanyu.e01.com.
" > /etc/bind/e01/3.37.10.in-addr.arpa

service bind9 restart
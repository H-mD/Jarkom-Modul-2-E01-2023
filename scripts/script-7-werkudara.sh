#!/bin/bash

line0=$(grep -n 'dnssec-validation auto;' /etc/bind/named.conf.options | cut -d ':' -f 1)

if [ -n "$line0" ]; then
    sed "$((line0 + 0))d" /etc/bind/named.conf.options > temp
    mv temp /etc/bind/named.conf.options
    sed -i "$((line0 + 0))i //dnssec-validation auto;" /etc/bind/named.conf.options
    sed -i "$((line0 + 1))i allow-query{ any; };" /etc/bind/named.conf.options
fi

echo -e "
zone \"baratayuda.abimanyu.e01.com\" {
\ttype master;
\tfile \"/etc/bind/Baratayuda/baratayuda.abimanyu.e01.com\";
};
" >> /etc/bind/named.conf.local

mkdir /etc/bind/Baratayuda
cp /etc/bind/db.local /etc/bind/Baratayuda/baratayuda.abimanyu.e01.com

echo -e "
;
; BIND data file for local loopback interface
;
\$TTL\t604800
@\tIN\tSOA\tbaratayuda.abimanyu.e01.com. root.baratayuda.abimanyu.e01.com. (
\t\t     2023101201         ; Serial
\t\t\t 604800         ; Refresh
\t\t\t  86400         ; Retry
\t\t\t2419200         ; Expire
\t\t\t 604800 )       ; Negative Cache TTL
;
@\tIN\tNS\tbaratayuda.abimanyu.e01.com.
@\tIN\tA\t10.37.3.4\t; IP Abimanyu
www\tIN\tCNAME\tbaratayuda.abimanyu.e01.com.
" > /etc/bind/Baratayuda/baratayuda.abimanyu.e01.com

service bind9 restart
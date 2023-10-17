#!/bin/bash

echo -e "
ns1\tIN\tA\t10.37.3.4\t; IP Abimanyu
baratayuda\tIN\tNS\tns1 
" >> /etc/bind/e01/abimanyu.e01.com

line0=$(grep -n 'dnssec-validation auto;' /etc/bind/named.conf.options | cut -d ':' -f 1)

if [ -n "$line0" ]; then
    sed "$((line0 + 0))d" /etc/bind/named.conf.options > temp
    mv temp /etc/bind/named.conf.options
    sed -i "$((line0 + 0))i //dnssec-validation auto;" /etc/bind/named.conf.options
    sed -i "$((line0 + 1))i allow-query{ any; };" /etc/bind/named.conf.options
fi

line1=$(grep -n 'zone "abimanyu.e01.com" {' /etc/bind/named.conf.local | cut -d ':' -f 1)

if [ -n "$line1" ]; then
    sed "$((line1 + 2)),$((line1 + 3))d" /etc/bind/named.conf.local > temp
    mv temp /etc/bind/named.conf.local
fi

service bind9 restart
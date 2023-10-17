#!/bin/bash

line0=$(grep -n 'zone "abimanyu.e01.com" {' /etc/bind/named.conf.local | cut -d ':' -f 1)

if [ -n "$line0" ]; then
    sed -i "$((line0 + 1))i notify yes;" /etc/bind/named.conf.local
    sed -i "$((line0 + 2))i also-notify { 10.37.3.2; };" /etc/bind/named.conf.local
    sed -i "$((line0 + 3))i allow-transfer { 10.37.3.2; };" /etc/bind/named.conf.local
fi

service bind9 restart
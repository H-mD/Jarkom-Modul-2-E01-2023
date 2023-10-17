#!/bin/bash

echo -e "
parikesit\tIN\tA\t10.37.3.4\t; IP Abimanyu
www.parikesit\tIN\tCNAME\tparikesit.abimanyu.e01.com.
" >> /etc/bind/e01/abimanyu.e01.com

service bind9 restart
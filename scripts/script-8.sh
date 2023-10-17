#!/bin/bash

echo -e "
rjp\tIN\tA\t10.37.3.4\t; IP Abimanyu
www.rjp\tIN\tCNAME\trjp.baratayuda.abimanyu.e01.com.
" >> /etc/bind/Baratayuda/baratayuda.abimanyu.e01.com

service bind9 restart
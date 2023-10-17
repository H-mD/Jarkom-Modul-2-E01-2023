#!/bin/bash

echo -e "
upstream myweb  {
\tserver 10.37.3.5:8001; #IP Prabakusuma
\tserver 10.37.3.4:8002; #IP Abimanyu
\tserver 10.37.3.6:8003; #IP Wisanggeni
}

server {
\tlisten 80;
\tserver_name arjuna.e01.com www.arjuna.e01.com;

\tlocation / {
\t\tproxy_pass http://myweb;
\t}
}
" > /etc/nginx/sites-available/e01

ln -s /etc/nginx/sites-available/e01 /etc/nginx/sites-enabled

service nginx restart
#!/bin/sh
nginx_conf="/etc/nginx/nginx.conf"
sed -i "s/{{hidden_service_host}}/${HIDDEN_SERVICE_HOST}/g" ${nginx_conf}
sed -i "s/{{hidden_service_port}}/${HIDDEN_SERVICE_PORT}/g" ${nginx_conf}
mkdir -p /run/nginx
nginx
tor

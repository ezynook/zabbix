#!/bin/sh

set -e 

if [ -n "$(docker ps | grep zabbix)" ]; then
	docker rm -f zabbix > /dev/null
	if [ -n "$(docker volume ls | grep mysql_data)" ]; then
		docker volume rm mysql_data > /dev/null
	fi
	if [ -n "$(docker volume ls | grep mysql_data)" ]; then
		docker volume rm zabbix_config > /dev/null
	fi
else
	docker-compose up -d
fi
exec "$@"
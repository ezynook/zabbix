#!/bin/sh

echo "Zabbix Service Starting..."
docker-compose -f docker-compose.multiple.yml up -d > /dev/null
docker exec -it zabbix /bin/bash -c "sed -i 's/# DBHost=localhost/DBHost=zabbixdb/g' /etc/zabbix/zabbix_server.conf" > /dev/null
docker restart zabbix > /dev/null
echo "Zabbix Service Starting..."

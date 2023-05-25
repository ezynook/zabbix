<img src="https://camo.githubusercontent.com/71e79cfd6b679d246f9c432811761bc96eeeaf8680c15db2a8aa842d67398f45/68747470733a2f2f6173736574732e7a61626269782e636f6d2f696d672f6c6f676f2f7a61626269785f6c6f676f5f353030783133312e706e67" width="90">

## 🖥 Zabbix On Docker

__Frontend Configuration__ = Default

__Database Configuration__ = Bind 0.0.0.0
* Username: zabbix | Password: P@ssw0rd

Available Version
* version 4 LTS (ezynook/zabbix:4)
* version 5 LTS (ezynook/zabbix:5)
* version 6.4 (ezynook/zabbix:6)
* version 7 PRE-RELEASE (ezynook/zabbix:7)

## Setup
__Download Project__

```bash
$ cd /some/path/zabbix
$ git clone https://github.com/ezynook/zabbix.git
```
__Change Directory__
```bash
$ cd zabbix
```
__แก้ไข Environment ตามที่ต้องการ__

* ZBX_VERSION = เวอร์ชั่นที่ต้องการ ณ ตอนนี้มี 5 และ 6
* WEBPORT = Port ในการเข้าเว็บ Zabbix
* SNMPPORT = Port ที่ Client ส่ง SNMP
* ZBXAGENT = Port ที่ Client ส่ง Agent
* ZBXSERVER = Port Zabbix Server
* DBPORT = MySQL Port

```sh
$ vim .env
```
```ini
ZBX_VERSION=ezynook/zabbix:<version>
WEBPORT=80
SNMPPORT=161
ZBXAGENT=10050
ZBXSERVER=10051
DBPORT=3306
```

__Running__

```bash
$ chmod +x start.sh 
$ docker-compose up -d
```
__One Time Test__
```bash
$ docker volume create zabbix_config
$ docker volume create mysql_data
$ docker run -d --name zabbix \
	-p 80:80 -p 161:161 -p 10050:10050 \
	-p 10051:10051 -p 3306:3306 \
	-v mysql_data:/var/lib/mysql \
	-v zabbix_config:/etc/zabbix \
	zabbix:<version>
```

__Open Browser__

```http://localhost/zabbix```

---

> Docker builded by Pasit Yodsoi (pasit.dev)

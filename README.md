<img src="https://cloud.microsystems.co.th/wp-content/uploads/2020/02/zabbix_logo_600x300.jpg" width="90">

## 🖥 Zabbix On Docker

__Frontend Configuration__ = Default

__Database Configuration__ = Bind 0.0.0.0
* Username: zabbix | Password: P@ssw0rd

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
ZBX_VERSION=5
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
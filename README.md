<img src="https://camo.githubusercontent.com/71e79cfd6b679d246f9c432811761bc96eeeaf8680c15db2a8aa842d67398f45/68747470733a2f2f6173736574732e7a61626269782e636f6d2f696d672f6c6f676f2f7a61626269785f6c6f676f5f353030783133312e706e67" width="90">

## 🖥 Zabbix On Docker

🟢 __Frontend Configuration__ = Default

🟢 __Database Configuration__ = Bind Remote Host
* Username: zabbix | Password: P@ssw0rd

Available Version
* ✔️ version 4 LTS (ezynook/zabbix:4)
* ✔️ version 5 LTS (ezynook/zabbix:5)
* ✔️ version 6.4 (ezynook/zabbix:6)
* ✔️ version 7 PRE-RELEASE (ezynook/zabbix:7)

## 📦 Setup
👉 __Download Project__

```bash
$ cd /some/path/zabbix && git clone https://github.com/ezynook/zabbix.git
```
👉 __Change Directory__
```bash
$ cd zabbix
```
👉 __แก้ไข Environment ตามที่ต้องการ__

* ZBX_VERSION = เวอร์ชั่นที่ต้องการ ณ ตอนนี้มี 4-7
* WEBPORT = Port ในการเข้าเว็บ Zabbix
* SNMPPORT = Port ที่ Client ส่ง SNMP
* ZBXAGENT = Port ที่ Client ส่ง Agent
* ZBXSERVER = Port Zabbix Server
* DBPORT = MySQL Port

```sh
$ vim .env
```
```ini
ZBX_VERSION=<version>
WEBPORT=80
SNMPPORT=161
ZBXAGENT=10050
ZBXSERVER=10051
DBPORT=3306
```

👉  __Running__

```bash
$ chmod +x start.sh && docker-compose up -d
```
👉 __หากต้องการแยก Web UI และ Database__
```bash
$ docker-compose -f docker-compose.multiple.yml up -d \
  && docker exec -it zabbix /bin/bash -c "sed -i 's/# DBHost=localhost/DBHost=zabbixdb/g' /etc/zabbix/zabbix_server.conf" \
  && docker restart zabbix
```
👉 __หรือใช้ Shell Script__
```bash
$ chmod +x start-multiple.sh && ./start-multiple.sh
```
🔧 ตั้งค่าหน้า WebUI ขั้นตอนตั้งค่า ```Database Connection``` ให้ติ๊ก ```[ ] Database TLS encryption``` ออก

🔧 ตั้งค่าหน้า WebUI ช่อง ```Database Server``` ใส่เป็น ```zabbixdb```


🌎 __Open Browser__

```http://localhost/zabbix```

---

> ⚒️ Docker builded by Pasit Yodsoi (pasit.dev)

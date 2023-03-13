#!bin/bash
source ./config.sh

dbname=$DB_NAME
hostname=$(hostname)
myip=$(hostname -I | awk '{print $1}')
host_ip=$myip
hostname_server=$hostname

ERROR="
🚨[BACKUP-ERROR]🚨
Server: ${hostname_server}
Database: ${dbname}
Địa chỉ IP : ${host_ip} / 24
Tên Database: ${DB_NAME}
Nội dung: Backup dữ liệu không thành công !
--------
Nguyên nhân: Backup DB bị ngắt giữa chừng, nguyên nhân do lỗi databases hoặc kết nối bị ngắt, vui lòng kiểm tra lại
"

SUCCESS="
✅[BACKUP-SUCCESS]✅
Server: ${hostname_server}
Database: ${dbname}
Địa chỉ IP : ${host_ip} / 24
Tên Database: ${DB_NAME}
Nội dung: Backup Dump thành công databases !
"


alertTelegramSuccess(){
curl -s -X POST $URL \
-G -d chat_id=$CHAT_ID \
--data-urlencode "text=$SUCCESS" \
-d "parse_mode=HTML"
}

alertTelegramError(){
curl -s -X POST $URL \
-G -d chat_id=$CHAT_ID \
--data-urlencode "text=$ERROR" \
-d "parse_mode=HTML"
}



sendServer(){
capacityFile=$(du -sh dkth_produce_$DATE.dump | awk '{print $1}')

curl -X POST http://10.0.0.210:5000/api/databases/info \
-H "Content-Type: application/json" \
-d '{"ipServer": "'"$host_ip"'",
    "hostname": "'"$hostname_server"'",
    "nameDatabase": "'"$DB_NAME"'",
    "pathBackup": "/root/pg_backup",
    "status": "backup",
    "capacityFile": "'"$capacityFile"'"
    }'
}



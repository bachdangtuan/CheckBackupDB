#!bin/bash
TOKEN="6112203391:AAEuDTYX3KQRNuoLKuJ0NAtpRoamdHIQQkA"
CHAT_ID="-957135587"
# URL API post telegeram
URL="https://api.telegram.org/bot${TOKEN}/sendMessage"

hostname=$(hostname)
myip=$(hostname -I | awk '{print $1}')

host_ip=$myip
hostname_server=$hostname


ERROR="
🚨[BACKUP-ERROR]🚨
Server: ${hostname_server}
Địa chỉ IP : ${host_ip} / 24
Nội dung: Backup dữ liệu không thành công !
--------
Nguyên nhân: Đang backup bị ngắt giữa chừng hoặc backup bị lỗi vui lòng kiểm tra lại
"

SUCCESS="
✅[BACKUP-SUCCESS]✅
Server: ${hostname_server}
Địa chỉ IP : ${host_ip} / 24
Nội dung: Backup thành công !
"




alertTelegramSuccess(){
curl -s -X POST $URL \
-G -d chat_id=$CHAT_ID \
--data-urlencode "text=$SUCCESS" \
-d "parse_mode=HTML"
    echo "alert telegram thanh cong"
    exit 0
}

alertTelegramError(){
    echo $dbname
curl -s -X POST $URL \
-G -d chat_id=$CHAT_ID \
--data-urlencode "text=$ERROR" \
-d "parse_mode=HTML"

    echo "loi sai database"
    exit 0
}





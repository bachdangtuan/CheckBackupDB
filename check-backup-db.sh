#!bin/bash
source ./alert/alert-telegram.sh


#cd /root/pg_backup

cd ${PATH_DIR}


pg_dump -U postgres -d ${DB_NAME} --exclude-table-data=adempiere.ad_changelog -Fc -f dkth_produce_${DATE}.dump -v

case $? in
  1)
   alertTelegramError
   sendServer
   exit 0
   ;;
  0)
   alertTelegramSuccess
   sendServer
   exit 0
   ;;
  *)
   alertTelegramError
   sendServer
   exit 0
   echo 'không có kết quả'
   ;;
esac





























# $? thực thi không thành công trả về mã thoát là 1, thực thi thành công mã thoát là 0, đối tượng thực thi không có 
# trả về số khác 0
# 

# ping -c 1 16.145.67.74 

# echo $?

# case $? in
#   1)
#    echo 'thực hiện không thành công'
#    ;;
#   0)
#   echo 'thực hiện thành công'
#    ;;
#   *)
#    echo 'không có kết quả'
#    ;;
# esac






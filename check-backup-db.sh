#!bin/bash

# $? thực thi không thành công trả về mã thoát là 1, thực thi thành công mã thoát là 0, đối tượng thực thi không có 
# trả về số khác 0
# 

# grep "example" testfile.txt

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
ping -c 1 16.145.67.74 

echo $?

case $? in
  1)
   echo 'thực hiện không thành công'
   ;;
  0)
  echo 'thực hiện thành công'
   ;;
  *)
   echo 'không có kết quả'
   ;;
esac


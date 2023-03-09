#!bin/bash

# $? thực thi không thành công trả về mã thoát là 1, thực thi thành công mã thoát là 0
grep "example" testfile.txt

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


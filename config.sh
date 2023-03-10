#!bin/bash

TOKEN="6112203391:AAEuDTYX3KQRNuoLKuJ0NAtpRoamdHIQQkA"
CHAT_ID="-957135587"
# URL API post telegeram
URL="https://api.telegram.org/bot${TOKEN}/sendMessage"
DB_NAME="testbackup";
export DATE=`date +%Y_%m_%d_%H_%M`;
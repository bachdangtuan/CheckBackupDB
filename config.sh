#!bin/bash

# Setting for Backup, nhap thong tin ten database, duong dan backup 
DB_NAME="testbackup";
DATE=`date +%Y_%m_%d_%H_%M`;
PATH_DIR="/root/pg_backup"

# Telegram
TOKEN="6112203391:AAEuDTYX3KQRNuoLKuJ0NAtpRoamdHIQQkA"
CHAT_ID="-957135587"
URL="https://api.telegram.org/bot${TOKEN}/sendMessage"





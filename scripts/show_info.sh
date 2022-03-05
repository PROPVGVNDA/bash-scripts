#!/bin/bash

LOG_DIR=/var/log

LOG_FILE=my_script.log

cd $LOG_DIR || {
  echo "Cannot open neccessary directory"
  exit 1
}

touch $LOG_FILE

date >&1 | tee $LOG_FILE
who >&1 | tee -a $LOG_FILE
uptime >&1 | tee -a $LOG_FILE

echo "Logs saved successfully in $LOG_DIR/$LOG_FILE"

exit 0
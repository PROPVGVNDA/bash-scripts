#!/bin/bash

LOG_DIR=/var/log
ROOT_UID=0
E_XCD=86
E_NOTROOT=87


if [ "$UID" -ne "$ROOT_UID" ]; then
  echo "Must be root user to run script"
  exit $E_NOTROOT
fi

cd $LOG_DIR || {
    echo "Cannot change to $LOG_DIR" >&2
    exit $E_XCD;
}

cat /dev/null > wtmp

echo "Clean up completed"

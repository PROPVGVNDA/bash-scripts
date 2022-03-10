#!/bin/bash

set -e

ADDRESS_FILE="simple_program.txt"

list_operations () {
  clear
  echo "0. Exit"
  echo "1. Search"
  echo "2. Add"
  echo "3. Remove"
  echo "4. Display"
}

call_add () {
  echo -n "Enter name: "; read name
  echo -n "Enter mail: "; read mail
  echo -n "Enter phone number: "; read number
  echo "$name":"$mail":"$number" >> $ADDRESS_FILE
}

call_search() {
  echo -n "Enter keyword to search for: "; read keyword
  cat "$ADDRESS_FILE" | grep "$keyword" 
  echo "Press Enter..."; read
}

call_remove() {
  while true; do
    echo -n "Enter keyword to search for: "; read keyword
    output=$(cat ${ADDRESS_FILE} | grep ${keyword})
    lines=$(echo ${output} | wc -l)
    echo $output
    if [ "$lines" -eq 0 ] | [ -z "$output" ]; then
      echo "No results match your keyword, try different keyword..."
    elif [ "$lines" -gt 1 ]; then
      echo "Several results match your keyword, specify your keyword"
      echo "$output"
    elif [ "$lines" -eq 1 ]; then
      echo "Do you really wish to delete this entry: ${output}? (y/n)"; read opt
      if [ "$opt" = "y" ]; then
        awk '!/'"$output"'/' "$ADDRESS_FILE" > tmpfile && mv tmpfile "$ADDRESS_FILE"; break
      else
        break
      fi
    fi
  done
}

call_display() {
  while IFS= read -r line
  do
    echo "$line" | tr ':' ' '
  done < "$ADDRESS_FILE"
  echo "Press Enter..."; read
}

call_exit () { exit 0; }

while true; do
  list_operations
  echo "What operation?"
  read option
  case "$option" in
    "0" ) call_exit;;
    "1" ) call_search;;
    "2" ) call_add;;
    "3" ) call_remove;;
    "4" ) call_display;;
    *   ) echo "Incorrect operation";;
  esac
done
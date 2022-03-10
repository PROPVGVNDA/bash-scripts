#!/bin/bash

a=23
echo $a

let a=15+6
(( a = 15 + 5 ))
echo $a

read a
echo $a

a=$(echo Hello!)
echo $a

exit 0
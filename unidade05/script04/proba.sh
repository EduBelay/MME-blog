#!/bin/bash

trap '' INT TSTP
for ((i=0; i<=10; i++))
do
   echo "pensando"
   sleep 1
done
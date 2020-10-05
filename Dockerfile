FROM ububtu:18.04

RUN apt update

RUN apt install -y masscan python-scapy net-tools python3 python2.7


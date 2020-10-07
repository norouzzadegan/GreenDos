FROM ubuntu:18.04
RUN apt update
RUN apt install -y masscan net-tools python3 python2.7 python3-pip iputils-ping libpcap-dev
RUN pip3 install scapy
COPY GreenDos.sh .
COPY core.py .

ENTRYPOINT [ "/bin/bash","GreenDos.sh" ]


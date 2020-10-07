## GreenDos is a image convert Dos to Ddos Attacks


This tool is developed for checking services against of DDOS attacks.
We will talk about the algorithm in detailed. The algorithm is as follow:
GreenDos generate packet with random of source ip and source port and sequence number for a packet.
for using it you need enable ip forwarding in your Linux host.
for example this page said about How to Disable/Enable IP forwarding in Linux:

```
https://linuxconfig.org/how-to-turn-on-off-ip-forwarding-in-linux
```

```How Run Container```

For run Container you can set domain or set ip or you can set your specefic port that want to test your service.
if you set IP and domain Container only choose ip so don't set ip and domain with together.

```Example```

```docker pull greenmn/greendos```

```docker run -it greenmn/greendos:latest ip 192.168.18.152``` 

If dont set port scan 65535 and choose open port 

```docker run -it greenmn/greendos:latest domain my_test_site.example```

```docker run -it greenmn/greendos:latest ip 192.168.18.152 port 443```
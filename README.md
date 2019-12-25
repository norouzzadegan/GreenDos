# DOS To DDOS
This tool is developed for checking services against a DDOS attack.
 
We will talk about the algorithm in detailed. The algorithm has 4 main steps as follow:

step 1) At first, you have to enter a specific domain as input.  
step 2) It will ping the Domain that you gave to get the IP.
step 3) By using masscan it scans all the ports in range 1 to 65535 to find the open ones.
step 4) For the last step it will send packets from randomly generated source IP and port to  destination.

For using this tool for your services, you need to install the followings:

```
git clone https://gitlab.com/greenmns/dos-to-ddos.git
cd dos-to-ddos
chmod +x ddos.sh
./ddos
```
you can see help

```
-h|--help show help
-p|--port select espisific port if no set scan all port
-d|--domain set your domain
-i|--ip set your ip
-f|--flood set Number of packet you want to send
-r|--range set range of port scan and format is 1-8080
usage:
./dos.sh -d domain.com
```






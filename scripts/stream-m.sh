#!/bin/bash

 case $1 in
    start)
       cd /home/malbec/stream-m/;
       echo $$ > /home/malbec/stream.pid;
       exec 2>&1 make ROOT=/home/malbec/stream-m/ serve 1>/home/malbec/stream.out ;
       ;;
     stop)  
       kill -9 -`cat /home/malbec/stream.pid`;
       rm /home/malbec/stream.pid;
       ;;
     *)  
       echo "usage: stream-m.sh {start|stop}" ;;
 esac
 exit 0

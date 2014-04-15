#!/bin/bash

 case $1 in
    start)
       cd /home/malbec/mbc-patero/;
       echo $$ > /home/malbec/patero.pid;
       exec 2>&1 python patero.py 1>/home/malbec/patero.out ;
       ;;
     stop)  
       kill -9 -`cat /home/malbec/patero.pid`;
       rm /home/malbec/patero.pid;
       ;;
     *)  
       echo "usage: patero.sh {start|stop}" ;;
 esac
 exit 0

#!/bin/bash

 case $1 in
    start)
       echo $$ > /home/malbec/capture.pid;
       exec 2>&1 /usr/local/bin/melt -producer decklink buffer=25 -consumer posixshm 1>/home/malbec/capture.out ;
       ;;
     stop)  
       kill -9 -`cat /home/malbec/capture.pid`;
       rm /home/malbec/capture.pid;
       ;;
     *)  
       echo "usage: capture.sh {start|stop}" ;;
 esac
 exit 0

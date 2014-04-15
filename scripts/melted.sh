#!/bin/bash

 case $1 in
    start)
       export MLT_PROFILE=dv_pal;
       echo $$ > /home/malbec/melted.pid;
       exec 2>&1 /usr/local/bin/melted -test -c /home/malbec/melted.conf 1>/home/malbec/melted.out ;
       ;;
     stop)  
       kill -9 -`cat /home/malbec/melted.pid`;
       rm /home/malbec/melted.pid;
       ;;
     *)  
       echo "usage: melted {start|stop}" ;;
 esac
 exit 0

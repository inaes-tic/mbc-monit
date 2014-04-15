#!/bin/bash

 case $1 in
    start)
       export DISPLAY=:1
       echo $$ > /home/malbec/output.pid;
       exec 2>&1 /usr/local/bin/melt -producer posixshm:output.mlt -consumer decklink:1 mlt_profile=dv_pal -filter webvfx:http://localhost:3100/filter 1>/home/malbec/output.out ;
       ;;
     stop)  
       kill -9 -`cat /home/malbec/output.pid`;
       rm /home/malbec/output.pid;
       ;;
     *)  
       echo "usage: output.sh {start|stop}" ;;
 esac
 exit 0

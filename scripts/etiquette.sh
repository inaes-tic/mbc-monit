#!/bin/bash

 case $1 in
    start)
       cd /home/malbec/mbc-etiquette/;
       echo $$ > /home/malbec/etiquette.pid;
       exec 2>&1 make NODE=/usr/local/bin/node NODE_CONFIG_DIR=/home/malbec/mbc-caspa/node_modules/mbc-common/config serve_noweb 1>/home/malbec/etiquette.out ;
       ;;
     stop)  
       kill -9 -`cat /home/malbec/etiquette.pid`;
       rm /home/malbec/etiquette.pid;
       ;;
     *)  
       echo "usage: etiquette.sh {start|stop}" ;;
 esac
 exit 0

#!/bin/bash

 case $1 in
    start)
       sleep 3;
       cd /home/malbec/mbc-mosto/;
       echo $$ > /home/malbec/mosto.pid;
       exec 2>&1 make NODE=/usr/local/bin/node MELTED=/usr/local/bin/melted NODE_CONFIG_DIR=/home/malbec/mbc-caspa/node_modules/mbc-common/config serve 1>/home/malbec/mosto.out;
       ;;
     stop)  
       kill -9 -`cat /home/malbec/mosto.pid`;
       rm /home/malbec/mosto.pid;
       ;;
     *)  
       echo "usage: mosto.sh {start|stop}" ;;
 esac
 exit 0

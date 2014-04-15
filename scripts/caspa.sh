#!/bin/bash

 case $1 in
    start)
       cd /home/malbec/mbc-caspa/;
       echo $$ > /home/malbec/caspa.pid;
       exec 2>&1 make NODE=/usr/local/bin/node NODE_CONFIG_DIR=/home/malbec/mbc-caspa/node_modules/mbc-common/config MBC_SCRAPE=1 serve_noweb 1>/home/malbec/caspa.out ;
       ;;
     stop)  
       kill -9 -`cat /home/malbec/caspa.pid`;
       rm /home/malbec/caspa.pid;
       ;;
     *)  
       echo "usage: caspa.sh {start|stop}" ;;
 esac
 exit 0

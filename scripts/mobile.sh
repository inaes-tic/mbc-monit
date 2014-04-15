#!/bin/bash

 case $1 in
    start)
       export DISPLAY=:1
       echo $$ > /home/malbec/mobile.pid;
       exec 2>&1 /usr/local/bin/melt -producer posixshm:output.mlt -consumer avformat:http://localhost:8000/publish/mbc-mobile?password=malbec real_time=1 terminate_on_pause=0 f=webm vcodec=libvpx b=400k s=320x200 acodec=libvorbis g=0 me_method=zero flags2=fast preset=ultrafast tune=zerolatency crf=40 qmin=5 mlt_profile=dv_pal -filter webvfx:http://localhost:3100/filter 1>/home/malbec/mobile.out ;
       ;;
     stop)  
       kill -9 -`cat /home/malbec/mobile.pid`;
       rm /home/malbec/mobile.pid;
       ;;
     *)  
       echo "usage: mobile.sh {start|stop}" ;;
 esac
 exit 0

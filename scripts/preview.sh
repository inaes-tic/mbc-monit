#!/bin/bash

 case $1 in
    start)
       export DISPLAY=:1
       echo $$ > /home/malbec/preview.pid;
       exec 2>&1 /usr/local/bin/melt -producer posixshm:output.mlt -consumer avformat:http://localhost:8000/publish/mbc?password=malbec real_time=1 terminate_on_pause=0 f=webm vcodec=libvpx b=1000k s=720x570 acodec=libvorbis ab=128k g=0 me_method=zero flags2=fast preset=ultrafast tune=zerolatency crf=40 qmin=5 mlt_profile=dv_pal 1>/home/malbec/preview.out ;
       ;;
     stop)  
       kill -9 -`cat /home/malbec/preview.pid`;
       rm /home/malbec/preview.pid;
       ;;
     *)  
       echo "usage: preview.sh {start|stop}" ;;
 esac
 exit 0

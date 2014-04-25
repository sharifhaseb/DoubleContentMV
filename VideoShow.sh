#!/bin/bash
pkill fbi
pkill mplayer
rm /home/pi/log*
NAME=`cat /etc/hostname`
echo "$NAME"
python StartNow.py
if [ "$NAME" = "PI3B01" ]; then
        mplayer -udp-master -udp-ip 172.23.163.255 -framedrop -vo fbdev:/dev/fb1 -nosound /home/pi/pi3b/Content/tty1.avi >> /home/pi/log1.txt &
	echo "Master!"
else
        if [ "$NAME" != "PI3B03" ]; then
            mplayer -udp-slave -framedrop -vo fbdev:/dev/fb1 -nosound /home/pi/pi3b/Content/tty1.avi >> /home/pi/log2.txt &
        else
            echo 'PI3B01 skips fb1'
	fi
        echo "Slave!"
fi
sleep 0.5
mplayer -udp-slave -framedrop -vo fbdev:/dev/fb2 -nosound /home/pi/pi3b/Content/tty2.avi >> /home/pi/log2.txt &
mplayer -udp-slave -framedrop -vo fbdev:/dev/fb3 -nosound /home/pi/pi3b/Content/tty3.avi >> /home/pi/log3.txt &
mplayer -udp-slave -framedrop -vo fbdev:/dev/fb4 -nosound /home/pi/pi3b/Content/tty4.avi >> /home/pi/log4.txt &
mplayer -udp-slave -framedrop -vo fbdev:/dev/fb5 -nosound /home/pi/pi3b/Content/tty5.avi >> /home/pi/log5.txt &
mplayer -udp-slave -framedrop -vo fbdev:/dev/fb0 -nosound /home/pi/pi3b/Content/tty0.avi >> /home/pi/log0.txt &


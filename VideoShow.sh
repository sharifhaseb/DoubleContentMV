
sudo pkill fbi
sudo pkill mplayer
sudo rm /home/pi/log*
sudo python StartNow.py
sudo mplayer -framedrop -vo fbdev:/dev/fb1 -nosound /home/pi/pi3b/Content/tty1.avi >> /home/pi/log1.txt &
sudo mplayer -framedrop -vo fbdev:/dev/fb2 -nosound /home/pi/pi3b/Content/tty2.avi >> /home/pi/log2.txt &
sudo mplayer -framedrop -vo fbdev:/dev/fb3 -nosound /home/pi/pi3b/Content/tty3.avi >> /home/pi/log3.txt &
sudo mplayer -framedrop -vo fbdev:/dev/fb4 -nosound /home/pi/pi3b/Content/tty4.avi >> /home/pi/log4.txt &
sudo mplayer -framedrop -vo fbdev:/dev/fb5 -nosound /home/pi/pi3b/Content/tty5.avi >> /home/pi/log5.txt &
sudo mplayer -framedrop -vo fbdev:/dev/fb0 -nosound /home/pi/pi3b/Content/tty0.avi >> /home/pi/log0.txt &


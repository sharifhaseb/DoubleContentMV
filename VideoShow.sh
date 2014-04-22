rm /home/pi/pi3b/Content/tty*
ffmpeg -r 1 -i /home/pi/pi3b/Content/v%01d/samplescreen0.png  /home/pi/pi3b/Content/tty0.avi
ffmpeg -r 1 -i /home/pi/pi3b/Content/v%01d/samplescreen1.png  /home/pi/pi3b/Content/tty1.avi
ffmpeg -r 1 -i /home/pi/pi3b/Content/v%01d/samplescreen2.png  /home/pi/pi3b/Content/tty2.avi
ffmpeg -r 1 -i /home/pi/pi3b/Content/v%01d/samplescreen3.png  /home/pi/pi3b/Content/tty3.avi
ffmpeg -r 1 -i /home/pi/pi3b/Content/v%01d/samplescreen4.png  /home/pi/pi3b/Content/tty4.avi
ffmpeg -r 1 -i /home/pi/pi3b/Content/v%01d/samplescreen5.png  /home/pi/pi3b/Content/tty5.avi
sudo pkill fbi
sudo pkill mplayer
sudo mplayer -loop 0 -vo fbdev:/dev/fb1 -fs -nosound /home/pi/pi3b/Content/tty1.avi >> /home/pi/log1.txt &
sudo mplayer -loop 0 -vo fbdev:/dev/fb2 -fs -nosound /home/pi/pi3b/Content/tty2.avi >> /home/pi/log2.txt &
sudo mplayer -loop 0 -vo fbdev:/dev/fb3 -fs -nosound /home/pi/pi3b/Content/tty3.avi >> /home/pi/log3.txt &
sudo mplayer -loop 0 -vo fbdev:/dev/fb4 -fs -nosound /home/pi/pi3b/Content/tty4.avi >> /home/pi/log4.txt &
sudo mplayer -loop 0 -vo fbdev:/dev/fb5 -fs -nosound /home/pi/pi3b/Content/tty5.avi >> /home/pi/log5.txt &
sudo mplayer -loop 0 -vo fbdev:/dev/fb0 -fs -nosound /home/pi/pi3b/Content/tty0.avi >> /home/pi/log0.txt &

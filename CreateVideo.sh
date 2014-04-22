rm /home/pi/pi3b/Content/tty*
ffmpeg -t 60 -loop 1 -r 2 -i /home/pi/pi3b/Content/v%01d/samplescreen0.png  /home/pi/pi3b/Content/tty0.avi
ffmpeg -t 60 -loop 1 -r 2 -i /home/pi/pi3b/Content/v%01d/samplescreen1.png  /home/pi/pi3b/Content/tty1.avi
ffmpeg -t 60 -loop 1 -r 2 -i /home/pi/pi3b/Content/v%01d/samplescreen2.png  /home/pi/pi3b/Content/tty2.avi
ffmpeg -t 60 -loop 1 -r 2 -i /home/pi/pi3b/Content/v%01d/samplescreen3.png  /home/pi/pi3b/Content/tty3.avi
ffmpeg -t 60 -loop 1 -r 2 -i /home/pi/pi3b/Content/v%01d/samplescreen4.png  /home/pi/pi3b/Content/tty4.avi
ffmpeg -t 60 -loop 1 -r 2 -i /home/pi/pi3b/Content/v%01d/samplescreen5.png  /home/pi/pi3b/Content/tty5.avi

#!/usr/bin/python
# -*- coding: utf-8 -*-

__author__ = ('Kaan Akşit')

import sys,os,time

# Function to update screens.
def UpdateScreen(tty=6,ImagePath='./Content/blank.png'):
    command = 'fbi -T %s %s --autozoom --noverbose' % (tty,ImagePath)
    os.system(command)
    return True

# Function to assign TTYs to found framebuffer devices.
def AssignTtysToScreens(ScreenList):
    TtyList = []
    del TtyList[:]
    for i in xrange(0,len(ScreenList)):
        tty = '%s' % (i+10)
        TtyList.append(tty)
        command = './con2fb %s %s' % (ScreenList[i],TtyList[i])
        print command
        os.system(command) 
    return TtyList

# Finds the framebuffer devices attached to the system.
def FindScreens():
    ScreenList = []
    del ScreenList[:]
    pipe       = os.popen('ls /dev/fb*')
    for line in pipe.readlines():
        ScreenList.append(line.replace("\n",""))
    return ScreenList

# Main function started when the script is initiated directly.
def main(debug=False):
    # Printing author information.
    print 'PI3B script, Author(s): %s' % __author__
    # Check for flags to know which screens to update.
    UpdateList = []
    for SelectedScreens in sys.argv:
        if len(SelectedScreens) < 2:
            if int(SelectedScreens) < 6 and int(SelectedScreens) > -1:
                UpdateList.append(int(SelectedScreens))
    if len(sys.argv) == 1:
        UpdateList = [0,1,2,3,4,5]
    print "Screens to be update:", UpdateList
    # Finding the screens connected to the device.
    print '\nFramebuffer devices found:'
    screens = FindScreens()
    print screens
    # Assigning TTY to each framebuffer device.
    print '\nAssigned TTY values for found Framebuffer devices:'
    ttys    = AssignTtysToScreens(screens)
    print ttys
    # Test pattern is displayed on the each display.
    test(ttys,screens,"no")
    # If flag to clear all screen is iniated, this block is valid.
    if len(sys.argv) > 1:
        if int(sys.argv[1]) == 666:
            print 'All screens are cleared!'
            sys.exit()
            return True     
    # Each screen is being update with the necessary content.
    # Change the tdelay (secs) to adjust the time in between each screen update.
    tdelay   = 2
    # Get initialization time. 
    tinit    = time.time()
    # Get start time stamp.
    tstart   = time.time()
    # Simple counter
    SetNo    = 0
    # Number of set of images to be displayed.
    NoOfSet  = 10
    # Get the current time stamp.
    tcurrent = time.time()
    # Loop to display moving images, it displays moving images for a minute and then stops.
    while tcurrent-tinit < 60:
        # Get the current time stamp.
        tcurrent = time.time()
        # Check if time periodicity is reached.
        if tcurrent-tstart > 2:
            # Kill the current fbi applications operational.
            os.system('pkill fbi') 
            # Update the screens loop.
            for i in UpdateList:
                # Create a new variable that corresponds to image set filenames.
                ImageNo = i + len(UpdateList) * SetNo
                print SetNo, ImageNo
                # Update the screen.
                UpdateScreen(ttys[i],'./Content/samplescreen%d.png' % ImageNo)     
                # Prints a status report if debug mode is on.
                if debug == True:
                    print 'Updating %s on %s' % (screens[i],ttys[i])
                # Delay between each screen update.
                time.sleep(0.1)
                # Set a new start time.
                tstart = time.time()
            # Increment to set new set of images.
            SetNo   += 1 
            SetNo    = SetNo % NoOfSet
    return True

# Display test pattern at each framebuffer device.
def test(ttys,screens,wait="no"):
    print '\nSample Update of screens make sure all of them is displaying logo!'
    for i in xrange(0,len(screens)):
        UpdateScreen(ttys[i])
        print 'Updating %s on %s' % (screens[i],ttys[i])
        if wait == "yes":
            time.sleep(1)
    return True

if __name__ == '__main__':
    sys.exit(main())

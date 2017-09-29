# LinuxBatteryNotification
simple bash script for ubuntu to be notified about battery status after 20 minutes

1. download it and put it on your desktop

2. open your terminal and configure crontab
open terminal with ctrl + alt + t

type 
$ crontab -e
crontab is for continuous starting programs

you might choose your favourite editor here (I recommend nano)

at the end of the file add:

*/20 * * * * /home/[your username]/Desktop/BatteryNotification
# Battery notification every 20 minutes

close your file with ctrl + x, type "y" and save it under its default name with enter

3. Note
Your might change the time with another number instead of 20.

4. Problems

Your must have zenity installed. Check it with "zenity --info --text "Hello World!"

The path in crontab must be correct. Open your terminal at the location of BatteryNotification and 
type "pwd" to get the correct path.

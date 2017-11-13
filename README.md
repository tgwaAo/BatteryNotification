# LinuxBatteryNotification
Simple bash script for ubuntu to be notified about battery status. Show alert if battery status is less than 30 percent.

1. Download it and put it on your desktop

2. Open your terminal and configure crontab
Open terminal with ctrl + alt + t.

Type 
$ crontab -e
Crontab is for continuous starting programs.

You might choose your favourite editor here (I recommend nano).

At the end of the file add:

*/10 * * * * /home/[your username]/Desktop/BatteryNotification.sh

The programm is executed every 10 minutes!

Close your file with ctrl + x, type "y" and save it under its default name with enter.

3. Note
Your might change the time with another number instead of 20.

4. Problems

Your must have zenity installed. Check it with "zenity --info --text "Hello World!"

The path in crontab must be correct. Open your terminal at the location of BatteryNotification and 
type "pwd" to get the correct path.

It might also be helpful to set the time to 1 rather than 10.

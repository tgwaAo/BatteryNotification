#!/bin/bash


# Read battery status and send notification.
#
# If the status is not so important, just send a message.
# If the status is really low, show a textbox.


var=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|percentage")
#echo "$var"

percent="${var##*$'\n'}"
		size=${#percent} 
		status=${percent:(size-3):2}

if [[ $var == *"discharging"* ]]
	then		
		if [[ "$status" -lt 20 ]]
		then
			zenity --warning --text "Your energy is getting very low!\n$percent" --title "Very low energy" --display=:1
		elif [[ "$status" -lt 30 ]]
		then
			XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "Low energy" "Your energy is getting low!\n$percent"
		fi

elif [[ "$status" -gt 85 ]]
then
	XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "Enough energy" "Your energy is full.\n$percent"
fi
